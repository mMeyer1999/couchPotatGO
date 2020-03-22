import 'dart:collection';

import 'package:couch_potatoe/dataclasses/Progressions/AbstractExerciseProgression.dart';

import 'Stages/ProgressionLists.dart';
import 'Stages/Stage.dart';

class DistancebasedExerciseProgression extends AbstractExerciseProgression {
  DistancebasedExerciseProgression(int level, int currentIteration, amount) : super(level, currentIteration, amount);


  @override
  LinkedList<Stage> getStageList() {
    print("Getting distanceList");
    return DistanceList.distanceList;
  }




}