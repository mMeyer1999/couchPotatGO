import 'dart:collection';

import 'Stages/Stage.dart';

abstract class AbstractExerciseProgression {
  int level;
  int currentIteration; // i.e. 5 completions of the exercise for a levelup, so after 2 completions the currentIteration would be 2
  Stage currentStage;

  AbstractExerciseProgression(this.level, this.currentIteration, amount) {
    setup(amount);
    if(currentStage==null) { //To prevent retardedDeveloperExceptions
      Exception("CurrentStage was not initialised correctly in setup() by a subclass!");
    }
  }

  int getIterationsToNextLevel() {
    return currentStage.iterationsToNext;
  }

  double getCurrentAmount() { //Usually an int
    return currentStage.amount;
  }

  bool addIteration() {
    currentIteration++;
    if(currentIteration>=getIterationsToNextLevel()) {
      currentIteration = 0;
      levelup();
      return true;
    }
    return false;
  }

  void levelup() {
    level++;
    this.currentStage = this.currentStage.next;
  }

  void setup(amount) {
    for(Stage stage in getStageList()) {
      if(amount == stage.amount) {
        this.currentStage = stage;
        return;
      }
    }
    print("Error! Invalid amount (" + amount.toString() + ") passed in constructor!");
    throw Exception("Error! Invalid amount (" + amount.toString() + ") passed in constructor!");
  }

  LinkedList<Stage> getStageList();

}