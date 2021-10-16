import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/objective.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'objectives.dart';

class ObjectivesBloc extends Bloc<ObjectivesEvent, ObjectivesState> {
  final List<Objective> _initialObjectives = [
    Objective(
        title: 'Meditate',
        description:
            'Ten minutes of meditation a day is good for your mind, you can use the « Meditation » tool'),
    Objective(
        title: 'Get some air',
        description:
            'If you can, a walk in the woods is a great idea. If you live in the city, you can go for a walk in a park. Try to do it for about thirty minutes'),
    Objective(
        title: 'Hang out',
        description:
            'Go outside with a friend, ask him or her to have coffee or do an activity together'),
    Objective(
        title: 'Take a bath',
        description:
            'It may not seem like much, but a bath is very relaxing for the body and mind. You can try to find the time to take one during the week')
  ];

  // TODO: Fix this duplication!
  ObjectivesBloc() : super(ObjectivesLoading());

  @override
  Stream<ObjectivesState> mapEventToState(ObjectivesEvent event) async* {
    if (event is ObjectivesRequested) {
      try {
        yield ObjectivesLoaded(objectives: await _getStoredObjectives());
      } catch (_) {
        print('Failed loading of Objectives: $_');
      }
    } else if (event is ObjectiveUpdated) {
      if (state is ObjectivesLoaded) {
        List<Objective> updatedObjectives = await _getStoredObjectives();
        updatedObjectives = updatedObjectives
            .map((objective) => objective.id == event.updatedObjective.id
                ? event.updatedObjective
                : objective)
            .toList();
        _updateStoredObjectives(updatedObjectives);
        yield ObjectivesLoaded(objectives: updatedObjectives);
      }
    }
  }

  Future<List<Objective>> _getStoredObjectives() async {
    Box box = await _getObjectiveBox();
    return List<Objective>.from(box.get('objectives'));
  }

  Future<void> _updateStoredObjectives(
      List<Objective> updatedObjectives) async {
    Box box = await _getObjectiveBox();
    box.put('objectives', updatedObjectives);
  }

  Future<Box> _getObjectiveBox() async {
    var box = await Hive.openBox('objectiveBox');
    if (box.get('objectives') == null || box.get('objectives').length == 0) {
      box.put('objectives', _initialObjectives);
    }
    return box;
  }
}
