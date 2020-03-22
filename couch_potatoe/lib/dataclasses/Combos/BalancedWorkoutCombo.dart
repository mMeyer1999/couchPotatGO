import 'package:couch_potatoe/dataclasses/Enums.dart';
import 'package:couch_potatoe/dataclasses/TrainingPlan.dart';

import 'Combo.dart';

class BalancedWorkoutCombo extends Combo {
  @override
  bool isValidCombo(TrainingPlan trainingPlan) {
    Map<Category,int> categories = trainingPlan.categoryDistribution;
    for(Category category in categories.keys) {
      if(categories[category]<=0) {
        return false;
      }
    }
    return true;
  }

  String toString() {
    return "Ausgeglichenes Workout Kombo: + " + (100*bonusModifier).round().toString() + "% XP!";
  }
}