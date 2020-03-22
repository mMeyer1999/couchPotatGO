import 'package:couch_potatoe/dataclasses/Combos/BalancedWorkoutCombo.dart';
import 'package:couch_potatoe/dataclasses/TrainingPlan.dart';

import 'Combo.dart';

class ComboManager {
  final List<Combo> availableCombos = [BalancedWorkoutCombo()];

  Iterable<Combo> calculateActiveCombos(TrainingPlan trainingPlan) {
    return availableCombos.where((combo) {return combo.isValidCombo(trainingPlan);});
  }
}