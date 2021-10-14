import 'package:flutter/material.dart';
import 'package:happier/api/models/objective.dart';

class ObjectivesScreen extends StatelessWidget {
  static const List<Objective> testObjectives = [


    Objective(title: 'Meditate', description: 'Ten minutes of meditation a day is good for your mind, you can use the « Meditation » tool'),

    Objective(title: 'Get some air', description: 'If you can, a walk in the woods is a great idea. If you live in the city, you can go for a walk in a park. Try to do it for about thirty minutes'),

    Objective(title: 'Hang out', description: 'Go outside with a friend, ask him or her to have coffee or do an activity together'),

    Objective(title: 'Take a bath', description: 'It may not seem like much, but a bath is very relaxing for the body and mind. You can try to find the time to take one during the week')
  ];

  const ObjectivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: <Widget>[
        Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
          child: const Text(
            'Here is a small list of objectives for your week. Don\'t rush, do them when you feel like it and have time, the goal is not to do them all, but to do them well',
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF444444)
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: const _ObjectivesList(objectives: testObjectives)
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 30),
          child: const Text(
            'After finishing this list, you can come back to Hap if you want to continue your discussion',
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF444444)
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    )
    ]
    )
    );
  }
}

class _ObjectivesList extends StatelessWidget {
  const _ObjectivesList({
    Key? key,
    required this.objectives,
  }) : super(key: key);

  final List<Objective> objectives;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: objectives.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          return _ObjectiveListItem(objective: objectives[index]);
        });
  }
}

class _ObjectiveListItem extends StatelessWidget {
  const _ObjectiveListItem({
    Key? key,
    required this.objective,
  }) : super(key: key);

  final Objective objective;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
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
                  Text(
                    objective.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF444444)),
                  ),
                  Text(objective.description)
                ],
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 1,
              child: Checkbox(
                checkColor: Colors.white,
                value: objective.isCompleted,
                onChanged: (bool? value) {},
              ),
            )
          ],
        ));
  }
}
