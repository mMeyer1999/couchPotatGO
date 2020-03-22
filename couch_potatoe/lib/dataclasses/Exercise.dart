import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:couch_potatoe/dataclasses/Enums.dart';
import 'package:couch_potatoe/dataclasses/Progressions/ExerciseUnlock.dart';

import 'Progressions/AbstractExerciseProgression.dart';
import 'Progressions/ExerciseTransformation.dart';

class Exercise {
  bool active = false; //Progressions, as well as activities that need to be unlocked, are not active by default.
  final String name;
  final String explanation;
  final Set<Category> categories; // the categories this exercise belongs to. Usually only one.
  final Set<MuscleGroup> muscleGroups; // the muscle group(s) that are trained in this exercise
  AbstractExerciseProgression exerciseProgression;
  double difficulty; //Difficulty is per unit, so per repetition, second, minute or meter
  double xpGainPerCompletion;
  ExerciseTransformation transformation;
  Set<ExerciseUnlock> unlocks;

  Exercise(this.active, this.name, this.explanation, this.categories, this.muscleGroups, this.exerciseProgression, this.difficulty) {
    updateXPGainPerCompletion();
  }

  void updateXPGainPerCompletion() {
    this.xpGainPerCompletion = difficulty * exerciseProgression.currentStage.amount; //Difficulty is per unit, so per repetition, second, minute or meter
  }

  bool addIteration() { //Call this every time this exercise has been completed. Returns TRUE if there was a levelup, otherwise FALSE.
    bool levelUp = this.exerciseProgression.addIteration();
    if(levelUp) {
      _onLevelUp();
    }
    return levelUp;
  }

  String categoryString() {
    Map<Category, String> toStrings = {
      Category.Strength : "Stärke",
      Category.Stamina : "Ausdauer",
      Category.Agility : "Flexibilität",
    };
    String categoryString = "";
    categories.forEach((category) { categoryString += toStrings[category]; });
    return "Kategorie" + (categories.length > 1 ? "n" : "") + ": " + categoryString;

  }

  _onLevelUp() { //TODO - Fancy notification for the user
    if(transformation != null && unlocks != null) { //This is not intended, but not otherwise checked for
      print("WARNING! Progression and Unlocks for the same exercise!");
    }
    double currentAmount = exerciseProgression.getCurrentAmount();
    if(transformation != null) {
      if(currentAmount>=transformation.amountToProgressAt) {
        this.active = false; //Deactivate this activity, as it is replaced
        transformation.exerciseToProgressTo.unlock(this);
        _onProgression(transformation);
        return;
      }
    } else if(unlocks != null) {
      for(ExerciseUnlock exerciseUnlock in unlocks) {
        if(currentAmount>=exerciseUnlock.amountToUnlockAt) {
          unlocks.remove(exerciseUnlock);
          exerciseUnlock.exerciseToUnlock.unlock(this);
          _onUnlock(exerciseUnlock);
        }
      }
    }
    //TODO - Trigger refresh of this exercise in global Exercise?manager?

    //If there was no progression previously (either none, or an unlock)
    updateXPGainPerCompletion();
  }

  void unlock(Exercise unlockingExercise) {
    this.active = true;
  }

  void _onProgression(ExerciseTransformation exerciseTransformation) { //Called immediately AFTER a progression
    SettingsSingleton.exerciseOverview.updateActiveExercises();
    //TODO - Update transformed exercises in Trainingplan
  }

  void _onUnlock(ExerciseUnlock exerciseProgression) { //Called immediately AFTER an unlock
    SettingsSingleton.exerciseOverview.updateActiveExercises();
  }

  @override
  String toString() {
    return "Exercise[" + this.name + "]";
  }
}