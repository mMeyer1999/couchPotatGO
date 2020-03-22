import 'package:couch_potatoe/dataclasses/Combos/ComboManager.dart';
import 'package:couch_potatoe/dataclasses/Enums.dart';
import 'package:couch_potatoe/dataclasses/ExerciseInstance.dart';

import 'Combos/Combo.dart';
import 'Exercise.dart';

class TrainingPlan {
  final List<ExerciseInstance> exercises = []; //Not a set, as there CAN be duplicates
  final Map<Category, int> categoryDistribution = Map.fromIterable(Category.values, key: (category) => category, value: (item) => 0); //Uses all enum values
  final Map<MuscleGroup, int> muscleGroupDistribution = Map.fromIterable(MuscleGroup.values, key: (muscleGroup) => muscleGroup, value: (item) => 0); //Users all enum values
  final ComboManager comboManager = ComboManager();

  void addExercise(Exercise exercise) { //This uses an exercise
    for(Category category in exercise.categories) {
      categoryDistribution[category]++;
    }
    for(MuscleGroup muscleGroup in exercise.muscleGroups) {
      muscleGroupDistribution[muscleGroup]++;
    }
    exercises.add(ExerciseInstance(exercise));
  }

  void removeExercise(ExerciseInstance exerciseInstance) { //This uses an exerciseInstance
    Exercise exercise = exerciseInstance.exercise;
    for(Category category in exercise.categories) {
      categoryDistribution[category]--;
    }
    for(MuscleGroup muscleGroup in exercise.muscleGroups) {
      muscleGroupDistribution[muscleGroup]--;
    }
    exercises.remove(exerciseInstance);
  }

  void printCombos() {
    print("===Active combos===");
    for(Combo combo in comboManager.calculateActiveCombos(this)) {
      print(combo);
    }
  }
}