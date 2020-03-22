import 'package:couch_potatoe/dataclasses/Exercise.dart';

import '../dataclasses/Enums.dart';

abstract class ExerciseOverview {
  final List<Exercise> installedExercises;
  Iterable<Exercise> activeExercises = [];

  ExerciseOverview(this.installedExercises) {
    this.updateActiveExercises();
  }

  void updateActiveExercises();

  Iterable<Exercise> filterByCategory(Category category, bool onlyActiveExercises);
  Iterable<Exercise> filterByMuscleGroup(MuscleGroup muscleGroup, bool onlyActiveExercises);
}