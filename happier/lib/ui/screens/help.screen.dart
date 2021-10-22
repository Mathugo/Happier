import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Column(
        children: [
          Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 10),
              margin: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 7, top: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.grey[100]),
              child: Row(
                children: [
                  Expanded(
                    flex: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nathan Haudot',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: const Text('Birth date: 2000-07-06')),
                        Container(
                            padding: const EdgeInsets.only(top: 2),
                            child:
                                const Text('Email: nathan.haudot@outlook.fr')),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 10),
              margin:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.grey[100]),
              child: Row(
                children: [
                  Expanded(
                    flex: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'First name'),
                            )),
                        const Text(
                          'Last Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Last name'),
                            )),
                        const Text(
                          'Birth Date',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'YY/MM/DD'),
                            )),
                        const Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Full address'),
                            )),
                        const Text(
                          'Postal Code',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'XXX-XX'),
                            )),
                        const Text(
                          'City',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'City name'),
                            )),
                        const Text(
                          'Country',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444)),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Country name'),
                            )),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              )),
        ],
      )
    ]));
  }
}
