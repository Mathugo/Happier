import 'package:flutter/material.dart';
import 'package:happier/api/models/objective.dart';

class ObjectivesScreen extends StatelessWidget {
  static const List<Objective> testObjectives = [
    Objective(title: 'Workout', description: 'Get your daily exercise!'),
    Objective(
        title: 'Study',
        description: 'Make sure you have studied at least a little bit today.'),
    Objective(
        title: 'Speak with a friend',
        description: 'It is important to maintain your personal relationships.')
  ];

  const ObjectivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
          child: const Text(
            'Here is a small list of goals for the week. Don\'t rush, do them when you feel like it and have time, the goal is not to do them all.',
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
      ],
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
