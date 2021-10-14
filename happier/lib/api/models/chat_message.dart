import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'chat_message.g.dart';

@HiveType(typeId: 0)
class ChatMessage extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String messageContent;
  @HiveField(1)
  final String messageType;

  ChatMessage({required this.messageContent, required this.messageType});

  // TODO: Add a timestamp
  @override
  List<Object?> get props => [messageContent, messageType];
}