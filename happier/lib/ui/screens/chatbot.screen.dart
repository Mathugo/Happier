import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/chat_message.dart';
import 'package:happier/blocs/chat/chat.dart';
import 'package:happier/utils/constants/colors.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
            if (state is ChatInitial) {
              return _MessagesView(messages: state.messages);
            } else if (state is ChatUpdated) {
              return _MessagesView(messages: state.messages);
            }

            return Text('Something is wrong! currentChatState: $state');
          }),
        ),
        _ChatInputField()
      ],
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
                        : SECONDARY_COLOR),
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

class _ChatInputField extends StatelessWidget {
  final _textEditingController = TextEditingController();

  _ChatInputField({
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
                  color: PRIMARY_COLOR,
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
            Expanded(
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                    hintText: 'Write message...',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<ChatBloc>(context).add(
                  SendMessage(message: _textEditingController.text),
                );
                _textEditingController.clear();
              },
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: PRIMARY_COLOR,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
