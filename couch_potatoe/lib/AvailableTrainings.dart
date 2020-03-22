import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:couch_potatoe/TrainingListItem.dart';
import 'package:couch_potatoe/dataclasses/DefaultExercise.dart';
import 'package:couch_potatoe/dataclasses/Enums.dart';
import 'package:couch_potatoe/dataclasses/Exercise.dart';
import 'package:couch_potatoe/dataclasses/Progressions/RepetitionbasedExerciseProgression.dart';
import 'package:flutter/material.dart';

import 'dataclasses/Progressions/DistancebasedExerciseProgression.dart';
import 'dataclasses/Progressions/MinutebasedExerciseProgression.dart';
import 'dataclasses/Progressions/SecondbasedExerciseProgression.dart';
import 'dataclasses/UnlockableExercise.dart';

class AvailableTrainings extends StatefulWidget {

  @override
  _AvailableTrainings createState() => _AvailableTrainings();
}

class _AvailableTrainings extends State<AvailableTrainings> {

  @override
  Widget build(BuildContext context) {

    List<Exercise> exercises = SettingsSingleton.exerciseOverview.activeExercises.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Verfügbare Übungen'),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body:
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: exercises.length,
              itemBuilder: (context, i) {
                return Container(
                  child: TrainingListItem(exercises[i].name, exercises[i]),
                  height: 80,
                  color: Color.fromRGBO(exercises[i].categories.contains(Category.Strength) ? 255 : 0, exercises[i].categories.contains(Category.Agility) ? 255 : 0, exercises[i].categories.contains(Category.Stamina) ? 255 : 0, 100),
                );
          }),
    );
  }
}