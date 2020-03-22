import 'package:couch_potatoe/ExerciseView.dart';
import 'package:couch_potatoe/MyWorkout.dart';
import 'package:flutter/material.dart';
import 'package:couch_potatoe/dataclasses/Exercise.dart';


class TrainingListItem extends StatelessWidget {

  final String name;
  final Exercise exercise;
  const TrainingListItem(this.name, this.exercise);

  Exercise getExercise() {
    return exercise;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22
      ),
      child: GridTile(
        child: Image(
          image: NetworkImage('https://cdn.icon-icons.com/icons2/37/PNG/512/running_sport_3645.png'),
        ),
        header: Text(name),
        footer: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ExerciseView(exercise),
            ),
          )
        )
      )
    );
  }
}
