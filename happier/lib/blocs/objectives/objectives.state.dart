import 'package:equatable/equatable.dart';
import 'package:happier/api/models/objective.dart';

abstract class ObjectivesState extends Equatable {
  const ObjectivesState();

  @override
  List<Object> get props => [];
}

class ObjectivesInitial extends ObjectivesState {}

class ObjectivesLoading extends ObjectivesState {}

class ObjectivesLoaded extends ObjectivesState {
  final List<Objective> objectives;

  const ObjectivesLoaded({required this.objectives});

  @override
  List<Object> get props => [objectives];
}
