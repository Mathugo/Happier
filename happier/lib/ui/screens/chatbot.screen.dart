import 'package:flutter/material.dart';
import 'package:happier/api/models/chat_message.dart';

class ChatbotScreen extends StatelessWidget {
  static const List<ChatMessage> testMessages = [
    ChatMessage(messageContent: 'Hi, Pontus!', messageType: 'receiver'),
    ChatMessage(
        messageContent: 'How have you been today?', messageType: 'receiver'),
    ChatMessage(
        messageContent: 'Hey Happier, I am doing fine.', messageType: 'sender'),
    ChatMessage(
        messageContent:
            'That is nice to hear, you know I am here if you need anything, right?',
        messageType: 'receiver'),
    ChatMessage(messageContent: 'Thank you!', messageType: 'sender'),
  ];

  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: _MessagesView(messages: testMessages),
        ),
        _ChatInputField()
      ],
    );
  }
}

class _ChatInputField extends StatelessWidget {
  const _ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Write message...',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class _MessagesView extends StatelessWidget {
  const _MessagesView({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: (messages[index].messageType == 'receiver'
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                    color: (messages[index].messageType == 'receiver'
                        ? Colors.grey.shade200
                        : Colors.blue[200]),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    messages[index].messageContent,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
