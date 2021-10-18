import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/objective.dart';
import 'package:happier/blocs/objectives/objectives.dart';

class ObjectivesScreen extends StatelessWidget {
  const ObjectivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      BlocBuilder<ObjectivesBloc, ObjectivesState>(builder: (context, state) {
        if (state is ObjectivesLoaded) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 15),
                child: const Text(
                  'Here is a small list of objectives for your week. Don\'t rush, do them when you feel like it and have time, the goal is not to do them all, but to do them well.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF444444)),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: _ObjectivesList(objectives: state.objectives)),
              Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 0, bottom: 30),
                child: const Text(
                  'After finishing this list, you can come back to Hap if you want to continue your discussion.',
                  style: TextStyle(fontSize: 18, color: Color(0xFF444444)),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      })
    ]));
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444444)),
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
                onChanged: (bool? value) {
                  BlocProvider.of<ObjectivesBloc>(context).add(ObjectiveUpdated(
                      updatedObjective:
                          objective.copyWith(isCompleted: value ?? false)));
                },
              ),
            )
          ],
        ));
  }
}
