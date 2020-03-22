import 'package:couch_potatoe/SettingsSingleton.dart';

class PlayerLevelProgression {
    int level;
    double currentXP;
    int xpForLevelUp;

    PlayerLevelProgression(this.level, this.currentXP) {
      this.xpForLevelUp = calculateXPRequirement();
    }

    bool addXP(int amount) {
      this.currentXP+=amount;
      if(this.currentXP>=xpForLevelUp) {
        levelup();
        return true;
      }
      return false;
    }

  void levelup() {
    currentXP -= xpForLevelUp;
    level++;
    xpForLevelUp = calculateXPRequirement();
    if(currentXP>=xpForLevelUp) { //In case there are multiple levelups in one go
      levelup();
    }
  }

  int calculateXPRequirement() {
    return (SettingsSingleton.xpPerMinute * 0.0083*this.level*this.level*this.level + 0.35*this.level*this.level + 0.8917*this.level + 8.75).round();
  }
}