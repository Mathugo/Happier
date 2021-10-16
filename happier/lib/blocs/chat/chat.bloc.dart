import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/chat_message.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final List<ChatMessage> _initialMessages = [
    ChatMessage(messageContent: 'Hi, Pontus!', messageType: 'receiver'),
    ChatMessage(
        messageContent: 'How have you been today?', messageType: 'receiver'),
  ];

  // TODO: Initial state should be ChatLoading
  ChatBloc()
      : super(ChatInitial(messages: [
          ChatMessage(messageContent: 'Hi, Pontus!', messageType: 'receiver'),
          ChatMessage(
              messageContent: 'How have you been today?',
              messageType: 'receiver'),
        ]));

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatRequested || event is UpdateChat) {
      yield ChatUpdated(messages: await _getMessages());
    } else if (event is SendMessage) {
      yield ChatLoading();
      Box box = await _getChatBox();
      List<ChatMessage> messages = List<ChatMessage>.from(box.get('messages'));
      box.put(
          'messages',
          messages
            ..add(ChatMessage(
                messageContent: event.message, messageType: 'sender')));
      yield ChatUpdated(messages: messages);
    } else if (event is ClearChat) {
      Box box = await _getChatBox();
      box.put('messages', []);
      yield ChatUpdated(messages: _initialMessages);
    }
  }

  Future<List<ChatMessage>> _getMessages() async {
    Box box = await _getChatBox();
    return List<ChatMessage>.from(box.get('messages'));
  }

  // TODO: box should act as a singleton
  Future<Box> _getChatBox() async {
    var box = await Hive.openBox('chatBox');
    if (box.get('messages') == null || box.get('messages').length == 0) {
      box.put('messages', _initialMessages);
    }
    return box;
  }
}
