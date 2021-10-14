import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/chat_message.dart';

import 'chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final List<ChatMessage> _messages = [
    const ChatMessage(messageContent: 'Hi, Pontus!', messageType: 'receiver'),
    const ChatMessage(
        messageContent: 'How have you been today?', messageType: 'receiver'),
  ];

  ChatBloc()
      : super(const ChatInitial(messages: [
          ChatMessage(messageContent: 'Hi, Pontus!', messageType: 'receiver'),
          ChatMessage(
              messageContent: 'How have you been today?',
              messageType: 'receiver'),
        ]));

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatRequested) {
      yield ChatLoading();
      yield ChatUpdated(messages: _messages);
    } else if (event is SendMessage) {
      yield ChatLoading();
      _messages.add(
          ChatMessage(messageContent: event.message, messageType: 'sender'));
      yield ChatUpdated(messages: _messages);
    }
  }
}
