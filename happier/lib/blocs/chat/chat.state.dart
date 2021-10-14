import 'package:equatable/equatable.dart';
import 'package:happier/api/models/chat_message.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {
  final List<ChatMessage> messages;

  const ChatInitial({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatLoading extends ChatState {}

class ChatUpdated extends ChatState {
  final List<ChatMessage> messages;

  const ChatUpdated({required this.messages});

  @override
  List<Object> get props => [messages];
}
