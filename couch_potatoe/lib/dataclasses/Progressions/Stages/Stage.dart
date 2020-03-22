import 'dart:collection';

class Stage extends LinkedListEntry<Stage> {
  final double amount; //Amount of seconds / repetitions / meters
  final int iterationsToNext; //Amount of times that this stage has to be completed before going to the next

  Stage(this.amount, this.iterationsToNext);
}
