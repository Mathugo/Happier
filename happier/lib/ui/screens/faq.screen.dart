import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('Can I trust the findings of Hap?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('How do I contact Happier?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('How can Hap help me?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('How do I contact someone to help me?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('How much does it cost to use Happier?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('Can I use Happier in any country?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('When should I ask for help from a psychologist?',
                style: TextStyle(fontSize: 18))),
        Container(
            padding:
                const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 83, 79, 1), width: 2.0)),
            ),
            child: const Text('What data does Happier collect?',
                style: TextStyle(fontSize: 18))),
      ],
    );
  }
}
