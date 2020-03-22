import 'Exercise.dart';

class ExerciseInstance { // To be used in trainings plan to determine a single Instance of an exercise (technically an instance of an instance). I.e. the Trainingplan may have 3 instances of the pushup exercise
  final Exercise exercise;
  bool completed = false;

  ExerciseInstance(this.exercise);
}