import 'package:equatable/equatable.dart';
import 'package:happier/api/models/chat_message.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class ChatRequested extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class UpdateChat extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class SendMessage extends ChatEvent {
  final String message;

  const SendMessage({required this.message});

  @override
  List<Object?> get props => [];
}
