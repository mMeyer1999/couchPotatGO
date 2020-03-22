import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:flutter/material.dart';
import 'dataclasses/ExerciseInstance.dart';

class WorkoutItem extends StatefulWidget {
  final ExerciseInstance exerciseInstance;
  final Function update;
  const WorkoutItem(this.exerciseInstance, this.update);

  @override
  State<StatefulWidget> createState() => WorkoutItemState();
}


class WorkoutItemState extends State<WorkoutItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 22),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide())
      ),
      child: ListTile(
        leading: Checkbox(
          value: widget.exerciseInstance.completed,
          onChanged: (bool value) => setState(() {
            widget.exerciseInstance.completed = value;
          }),
        ),
        title: Text(widget.exerciseInstance.exercise.name,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
        ),
        subtitle: Text(widget.exerciseInstance.exercise.xpGainPerCompletion.toString()),
        trailing: IconButton(
            onPressed: () => setState(() {
              SettingsSingleton.trainingPlan.removeExercise(widget.exerciseInstance);
              widget.update.call();
            }),
            icon: Icon(Icons.delete)),
      ),
    );
  }

}