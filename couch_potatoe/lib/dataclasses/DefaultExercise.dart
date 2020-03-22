import 'package:couch_potatoe/dataclasses/Enums.dart';
import 'package:couch_potatoe/dataclasses/Exercise.dart';
import 'package:couch_potatoe/dataclasses/Progressions/AbstractExerciseProgression.dart';

class DefaultExercise extends Exercise {
  DefaultExercise(String name, String explanation, Set<Category> categories, Set<MuscleGroup> muscleGroups, AbstractExerciseProgression exerciseProgression, double difficulty) : super(true, name, explanation, categories, muscleGroups, exerciseProgression, difficulty);

}