import 'package:couch_potatoe/AvailableTrainings.dart';
import 'package:couch_potatoe/dataclasses/Exercise.dart';
import 'package:flutter/material.dart';

class Training extends StatefulWidget {

  const Training(this.exercise);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Exercise exercise;

  @override
  _Training createState() => _Training();
}

class _Training extends State<Training> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.exercise.toString()),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body: Text('Hello World'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AvailableTrainings()),
          );
        },
        tooltip: 'Workout hinzufügen',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}