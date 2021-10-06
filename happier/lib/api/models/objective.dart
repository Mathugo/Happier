import 'package:equatable/equatable.dart';

class Objective extends Equatable{
  final String title;
  final String description;
  final bool isCompleted;

  const Objective({required this.title, required this.description, this.isCompleted = false});

  @override
  List<Object?> get props => [title, description, isCompleted];
}