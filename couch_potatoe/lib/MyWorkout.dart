import 'package:couch_potatoe/AvailableTrainings.dart';
import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:couch_potatoe/WorkoutItem.dart';
import 'package:couch_potatoe/dataclasses/ExerciseInstance.dart';
import 'package:couch_potatoe/dataclasses/TrainingPlan.dart';
import 'package:flutter/material.dart';

class MyWorkout extends StatefulWidget {
  MyWorkout({Key key, this.name}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String name;
  final String title = 'Trainingsplan von ';

  @override
  _MyWorkoutState createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {

  TrainingPlan getTrainingPlan() {
    return SettingsSingleton.trainingPlan;
  }


  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title + widget.name),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body:
        ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: getTrainingPlan().exercises.length,
          itemBuilder: (context, i) {
            ExerciseInstance exerciseInstance = getTrainingPlan().exercises[i];
            return WorkoutItem(exerciseInstance, update);
          }
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(35, 152, 185, 100),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AvailableTrainings(),
          )
          ),
          tooltip: 'Workout hinzufügen',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
}
