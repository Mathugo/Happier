import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'objective.g.dart';

@HiveType(typeId: 1)
class Objective extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool isCompleted;

  Objective(
      {String? id,
      required this.title,
      required this.description,
      this.isCompleted = false})
      : id = id ?? const Uuid().v4();

  Objective copyWith(
      {String? id, String? title, String? description, bool? isCompleted}) {
    return Objective(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
