import 'dart:math';

import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dataclasses/Exercise.dart';

class ExerciseView extends StatefulWidget {
  final Exercise exercise;

  ExerciseView(this.exercise);

  @override
  State<StatefulWidget> createState() => ExerciseViewState();
}

class ExerciseViewState extends State<ExerciseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: Column(

          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(widget.exercise.explanation),
            //A picture here
            SizedBox(
              height: 30,
            ),
            Text(widget.exercise.categoryString()),
            SizedBox(
              height: 30,
            ),
            LinearProgressIndicator(
              value: widget.exercise.exerciseProgression.currentIteration/widget.exercise.exerciseProgression.getIterationsToNextLevel(),
              semanticsLabel: "Level " + widget.exercise.exerciseProgression.level.toString(),
            ),
            SizedBox(
              height: 30,
            ),
            LinearProgressIndicator(
              value: min(1.0, widget.exercise.xpGainPerCompletion / 500), //Everything above 500 XP is just shown at max difficulty
              semanticsLabel: "Schwierigkeit",
            ),
            SizedBox(
              height: 30,
            ),
            Builder(  //Using the builder workaround to get access to the context of the Scaffold to make the SnackBar work
                builder: (context) {
                  return RaisedButton(
                    child: Text("Zum Trainingsplan hinzufügen"),
                    onPressed: () {
                      SettingsSingleton.trainingPlan.addExercise(widget.exercise);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Übung hinzugefügt!"),
                      ));
                    },
                  );
                }
            ),

          ],
        ),
      ),

    );
  }

}