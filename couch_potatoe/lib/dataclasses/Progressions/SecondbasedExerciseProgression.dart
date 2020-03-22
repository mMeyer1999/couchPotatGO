import 'dart:collection';

import 'package:couch_potatoe/dataclasses/Progressions/AbstractExerciseProgression.dart';
import 'Stages/ProgressionLists.dart';
import 'Stages/Stage.dart';

class SecondbasedExerciseProgression extends AbstractExerciseProgression {
  SecondbasedExerciseProgression(int level, int currentIteration, amount) : super(level, currentIteration, amount);

  @override
  LinkedList<Stage> getStageList() {
    print("Getting secondsList");
    return DurationList.secondsList;
  }
}