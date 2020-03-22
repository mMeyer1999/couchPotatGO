import 'package:couch_potatoe/dataclasses/Enums.dart';

import 'package:couch_potatoe/dataclasses/Exercise.dart';

import '../Interfaces/ExerciseOverview.dart';

class ExerciseOverviewImpl extends ExerciseOverview {
  ExerciseOverviewImpl(List<Exercise> installedExercises) : super(installedExercises);

  @override
  void updateActiveExercises() {
    this.activeExercises = installedExercises.where((exercise) => exercise.active);
  }

  @override
  Iterable<Exercise> filterByCategory(Category category, bool onlyActiveExercises) {
    Iterable<Exercise> targetIterable = onlyActiveExercises ? this.activeExercises : this.installedExercises;
    return targetIterable.where((exercise) => exercise.categories.contains(category));
  }

  @override
  Iterable<Exercise> filterByMuscleGroup(MuscleGroup muscleGroup, bool onlyActiveExercises) {
    Iterable<Exercise> targetIterable = onlyActiveExercises ? this.activeExercises : this.installedExercises;
    return targetIterable.where((exercise) => exercise.muscleGroups.contains(muscleGroup));
  }



}