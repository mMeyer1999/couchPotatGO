import 'package:couch_potatoe/dataclasses/Enums.dart';

import 'package:couch_potatoe/dataclasses/Progressions/AbstractExerciseProgression.dart';

import 'Exercise.dart';

class UnlockableExercise extends Exercise {
  final Set<Exercise> _requirements;

  UnlockableExercise(this._requirements, String name, String explanation, Set<Category> categories, Set<MuscleGroup> muscleGroups, AbstractExerciseProgression exerciseProgression, double difficulty) : super(false, name, explanation, categories, muscleGroups, exerciseProgression, difficulty);

  @override
  void unlock(Exercise unlockingExercise) {
    if(!_requirements.contains(unlockingExercise)) {
      print("Warning! unlock triggered on a MultiUnlockableExercise which does not contain this exercise:" + unlockingExercise.toString());
    }

    _requirements.remove(unlockingExercise);
    if(_requirements.isEmpty) {
      this.active = true;
      print("Unlocking MultiUnlockableExercise");
    }
  }
}