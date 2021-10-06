import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable{
  final String messageContent;
  final String messageType;

  const ChatMessage({required this.messageContent, required this.messageType});

  @override
  List<Object?> get props => [messageContent, messageType];
}