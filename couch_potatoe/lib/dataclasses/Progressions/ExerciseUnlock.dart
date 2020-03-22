import 'package:couch_potatoe/dataclasses/Exercise.dart';

class ExerciseUnlock {
  final Exercise exerciseToUnlock;
  final int amountToUnlockAt; //This is the amount of repetition/seconds/minutes/meters that have to be COMPLETED fully to progress to the next level

  ExerciseUnlock(this.exerciseToUnlock, this.amountToUnlockAt);
}