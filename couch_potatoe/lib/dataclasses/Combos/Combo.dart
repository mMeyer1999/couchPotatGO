import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:couch_potatoe/dataclasses/TrainingPlan.dart';

abstract class Combo {
  final double bonusModifier = SettingsSingleton.balancedWorkoutComboBonus;  // % or static bonus?

  bool isValidCombo(TrainingPlan trainingPlan);

}