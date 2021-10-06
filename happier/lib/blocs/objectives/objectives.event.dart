import 'package:equatable/equatable.dart';
import 'package:happier/api/models/objective.dart';

abstract class ObjectivesEvent extends Equatable {
  const ObjectivesEvent();
}

class ObjectivesRequested extends ObjectivesEvent {
  @override
  List<Object?> get props => [];
}

class ObjectiveUpdated extends ObjectivesEvent {
  final Objective oldObjective;
  final Objective updatedObjective;

  const ObjectiveUpdated(
      {required this.oldObjective, required this.updatedObjective});

  @override
  List<Object?> get props => [oldObjective, updatedObjective];
}
