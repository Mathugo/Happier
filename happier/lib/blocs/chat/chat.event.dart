import 'package:equatable/equatable.dart';

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

class ClearChat extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class SendMessage extends ChatEvent {
  final String message;

  const SendMessage({required this.message});

  @override
  List<Object?> get props => [];
}
