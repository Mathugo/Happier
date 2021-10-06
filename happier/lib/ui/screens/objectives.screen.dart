import 'package:flutter/material.dart';
import 'package:happier/api/models/objective.dart';
import 'package:happier/utils/constants/colors.dart';

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
      children: const [
        Expanded(child: _ObjectivesList(objectives: testObjectives)),
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
        color: SECONDARY_COLOR,
        child: Column(
          children: [
            Row(
              children: [
                Text(objective.title),
                const Spacer(),
                Text(objective.isCompleted.toString(),
                    style: TextStyle(
                      color: objective.isCompleted == true
                          ? Colors.green
                          : Colors.red,
                    ))
              ],
            ),
            Text(objective.description)
          ],
        ));
  }
}
