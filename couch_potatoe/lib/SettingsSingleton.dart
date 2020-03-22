import 'Interfaces/ExerciseOverview.dart';
import 'dataclasses/TrainingPlan.dart';

class SettingsSingleton {
  static final double xpPerMinute = 25; //Amount of XP that the average user can earn in a minute. This should be VERY GENEROUS to new users!

  static final double balancedWorkoutComboBonus = 0.1; // +10%

  static ExerciseOverview exerciseOverview; //might be null if not initialised yet (is initialised in main.dart)
  static TrainingPlan trainingPlan;
}