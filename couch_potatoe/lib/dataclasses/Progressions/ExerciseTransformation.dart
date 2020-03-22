
import 'package:couch_potatoe/dataclasses/Exercise.dart';

class ExerciseTransformation {
  final Exercise exerciseToProgressTo;
  final double amountToProgressAt; //This is the amount of repetition/seconds/minutes/meters that have to be COMPLETED fully to progress to the next level

  ExerciseTransformation(this.exerciseToProgressTo, this.amountToProgressAt);
}