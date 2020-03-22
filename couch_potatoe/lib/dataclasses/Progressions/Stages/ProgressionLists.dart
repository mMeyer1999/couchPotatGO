import 'dart:collection';

import 'Stage.dart';

class DurationList {
  static final LinkedList<Stage> secondsList = generateSecondsList();
  static final LinkedList<Stage> minutesList = generateMinutesList(); //For durations that are usually given as minutes, but expressed as seconds (i.e. 600 seconds = 10min). This is because Stage always has integer values, no floats.

  static LinkedList<Stage> generateSecondsList() {
    LinkedList<Stage> generatedList = LinkedList<Stage>();
    generatedList.add(Stage(1,5));
    generatedList.add(Stage(2,5));
    generatedList.add(Stage(3,5));
    generatedList.add(Stage(5,5));
    generatedList.add(Stage(10,5));
    generatedList.add(Stage(15,5));
    generatedList.add(Stage(20,5));
    generatedList.add(Stage(25,5));
    generatedList.add(Stage(30,10));
    generatedList.add(Stage(40,10));
    generatedList.add(Stage(50,10));
    generatedList.add(Stage(60,10));
    generatedList.add(Stage(70,10));
    generatedList.add(Stage(80,10));
    generatedList.add(Stage(90,10));
    generatedList.add(Stage(100,15));
    generatedList.add(Stage(120,15));
    generatedList.add(Stage(140,15));
    generatedList.add(Stage(160,15));
    generatedList.add(Stage(180,15));
    generatedList.add(Stage(200,15));
    generatedList.add(Stage(220,15));
    generatedList.add(Stage(240,15));
    generatedList.add(Stage(260,15));
    generatedList.add(Stage(280,9999999));
    return generatedList;
  }

  static LinkedList<Stage> generateMinutesList() {
    LinkedList<Stage> generatedList = LinkedList<Stage>();
    generatedList.add(Stage(0.25,5));
    generatedList.add(Stage(0.5,5));
    generatedList.add(Stage(0.75,5));
    generatedList.add(Stage(1,5));
    generatedList.add(Stage(1.5,5));
    generatedList.add(Stage(2,5));
    generatedList.add(Stage(2.5,5));
    generatedList.add(Stage(3,5));
    generatedList.add(Stage(4,5));
    generatedList.add(Stage(5,5));
    generatedList.add(Stage(6,5));
    generatedList.add(Stage(7,5));
    generatedList.add(Stage(8,5));
    generatedList.add(Stage(9,5));
    generatedList.add(Stage(10,15));
    generatedList.add(Stage(15,15));
    generatedList.add(Stage(20,15));
    generatedList.add(Stage(25,15));
    generatedList.add(Stage(30,20));
    generatedList.add(Stage(35,20));
    generatedList.add(Stage(40,20));
    generatedList.add(Stage(45,25));
    generatedList.add(Stage(50,25));
    generatedList.add(Stage(55,25));
    generatedList.add(Stage(60,9999999));
    return generatedList;
  }
}

class RepetitionList {
  static final LinkedList<Stage> repetitionList = generateRepetitionList();

  static LinkedList<Stage> generateRepetitionList() {
    LinkedList<Stage> generatedList = LinkedList<Stage>();
    generatedList.add(Stage(1,5));
    generatedList.add(Stage(2,5));
    generatedList.add(Stage(3,5));
    generatedList.add(Stage(4,5));
    generatedList.add(Stage(5,5));
    generatedList.add(Stage(6,5));
    generatedList.add(Stage(7,5));
    generatedList.add(Stage(8,5));
    generatedList.add(Stage(9,5));
    generatedList.add(Stage(10,10));
    generatedList.add(Stage(15,20));
    generatedList.add(Stage(20,20));
    generatedList.add(Stage(25,25));
    generatedList.add(Stage(30,25));
    generatedList.add(Stage(35,30));
    generatedList.add(Stage(40,30));
    generatedList.add(Stage(45,35));
    generatedList.add(Stage(50,35));
    generatedList.add(Stage(60,40));
    generatedList.add(Stage(70,40));
    generatedList.add(Stage(80,9999999));
    return generatedList;
  }
}

class DistanceList {
  static final LinkedList<Stage> distanceList = generateDistanceList(); //In meters

  static LinkedList<Stage> generateDistanceList() {
    LinkedList<Stage> generatedList = LinkedList<Stage>();
    generatedList.add(Stage(100,5));
    generatedList.add(Stage(200,5));
    generatedList.add(Stage(300,5));
    generatedList.add(Stage(500,5));
    generatedList.add(Stage(1000,5));
    generatedList.add(Stage(1500,5));
    generatedList.add(Stage(2000,5));
    generatedList.add(Stage(2500,7));
    generatedList.add(Stage(3000,10));
    generatedList.add(Stage(4000,15));
    generatedList.add(Stage(5000,20));
    generatedList.add(Stage(6000,25));
    generatedList.add(Stage(7000,30));
    generatedList.add(Stage(8000,35));
    generatedList.add(Stage(9000,42));
    generatedList.add(Stage(10000,999999));
    return generatedList;
  }
}