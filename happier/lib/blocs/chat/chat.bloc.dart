import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/chat_message.dart';
import 'package:happier/api/models/repositories/bot.repository.dart';
import 'package:happier/api/models/repositories/gpt3.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';
import 'chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final BotRepository _botRepository;

  // TODO: Initial state should be ChatLoading
  ChatBloc(this._botRepository)
      : super(ChatInitial(messages: <ChatMessage>[
          ChatMessage(messageContent: 'Loading...', messageType: 'receiver')
        ]));

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatRequested || event is UpdateChat) {
      List<ChatMessage> messages = [];
      String? botResponse = await _botRepository.detectIntent('Hello!');
      messages.add(ChatMessage(
          messageContent: botResponse ?? 'Hi! I\'m Hap, how can I help you?',
          messageType: 'receiver'));
      _saveMessages(messages);
      yield ChatUpdated(messages: messages);
    } else if (event is SendMessage) {
      List<ChatMessage> messages = await _getMessages();
      messages.add(
          ChatMessage(messageContent: event.message, messageType: 'sender'));
      yield ChatResponseLoading(previousMessages: messages);
      String? botResponse = await _botRepository.detectIntent(event.message);
      if (botResponse == 'none') {
        botResponse = 'Sorry, I don\'t understand you.';
      }
      // TEST IF WE HAVE MULTIPLE RESPONSES
      List<String>? splited_response = botResponse?.split(';');
      if (splited_response?.length == 1) {
        messages.add(ChatMessage(
            messageContent:
                botResponse ?? 'Sorry, I couldn\'t understand that.',
            messageType: 'receiver'));
      } else {
        splited_response?.forEach((msg) {
          messages
              .add(ChatMessage(messageContent: msg, messageType: 'receiver'));
        });
      }

      yield ChatUpdated(messages: messages);
      _saveMessages(messages);
    } else if (event is ClearChat) {
      Box box = await _getChatBox();
      box.put('messages', []);
      yield ChatUpdated(messages: <ChatMessage>[
        ChatMessage(
            messageContent: 'Hi! I\'m Hap, how can I help you?',
            messageType: 'receiver')
      ]);
    }
  }

  Future<List<ChatMessage>> _getMessages() async {
    Box box = await _getChatBox();
    return List<ChatMessage>.from(box.get('messages'));
  }

  Future<void> _saveMessages(List<ChatMessage> messages) async {
    Box box = await _getChatBox();
    box.put('messages', messages);
  }

  // TODO: box should act as a singleton
  Future<Box> _getChatBox() async {
    var box = await Hive.openBox('chatBox');
    if (box.get('messages') == null || box.get('messages').length == 0) {
      box.put('messages', <ChatMessage>[
        ChatMessage(
            messageContent: 'Hi! I\'m Hap, how can I help you?',
            messageType: 'receiver')
      ]);
    }
    return box;
  }
}
