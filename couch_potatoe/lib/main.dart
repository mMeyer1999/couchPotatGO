import 'package:couch_potatoe/MyWorkout.dart';
import 'package:couch_potatoe/SettingsSingleton.dart';
import 'package:couch_potatoe/dataclasses/Enums.dart';
import 'package:couch_potatoe/dataclasses/Progressions/ExerciseTransformation.dart';
import 'package:couch_potatoe/dataclasses/Progressions/ExerciseUnlock.dart';
import 'package:couch_potatoe/dataclasses/Progressions/RepetitionbasedExerciseProgression.dart';
import 'package:flutter/material.dart';

import 'dataclasses/DefaultExercise.dart';
import 'dataclasses/Exercise.dart';
import 'dataclasses/ExerciseOverviewImpl.dart';
import 'dataclasses/Progressions/DistancebasedExerciseProgression.dart';
import 'dataclasses/Progressions/MinutebasedExerciseProgression.dart';
import 'dataclasses/Progressions/SecondbasedExerciseProgression.dart';
import 'dataclasses/TrainingPlan.dart';
import 'dataclasses/UnlockableExercise.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initialise();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: MyWorkout(name: 'Markus'),
    );
  }

  void initialise() {
    // SETUP - Create (or maybe load) exercises
    Exercise kneePushup = DefaultExercise("Knieliegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,2), 5);
    Exercise pushup = UnlockableExercise(Set.from([kneePushup]), "Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,2), 10);
    Exercise tightPushup = UnlockableExercise(Set.from([pushup]), "Enge Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,5), 14);
    Exercise widePushup = UnlockableExercise(Set.from([pushup]), "Weite Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,5), 14);
    Exercise pikePushup = UnlockableExercise(Set.from([pushup]), "Pike Push-Ups", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,5), 20);
    Exercise oneHandPushup = UnlockableExercise(Set.from([pushup]), "Einhändige Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,1), 45);
    Exercise handStandPushup = UnlockableExercise(Set.from([pushup]), "Handstand Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest]), RepetitionbasedExerciseProgression(0,0,1), 50);
    Exercise sailorPushup = UnlockableExercise(Set.from([pushup]), "Seemannsliegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,1), 55);
    Exercise pedaling = DefaultExercise("Radfahren im liegen", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,10), 5);
    Exercise flutterKicks = UnlockableExercise(Set.from([pedaling]), "Flutter-Kicks", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,5), 2.5);
    Exercise crunch = UnlockableExercise(Set.from([flutterKicks]), "Crunches", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,5), 5);
    Exercise situp = UnlockableExercise(Set.from([crunch]), "Situps", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,5), 10);
    Exercise underarmPlank = UnlockableExercise(Set.from([situp]), "Unter-arm plank", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 20);
    Exercise sidePlank = UnlockableExercise(Set.from([situp]), "Side-plank", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 20);
    Exercise sidePlankLegraise = UnlockableExercise(Set.from([situp]), "Side-plank Legraise", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,20), 8);
    Exercise jackknifeCrunch = UnlockableExercise(Set.from([situp]), "Jackknife Crunches", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,10), 15);
    Exercise valSlidePushup = UnlockableExercise(Set.from([situp]), "ValSlide pushup vorwärts", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,4), 17.5);
    Exercise tuckPlanche = UnlockableExercise(Set.from([situp]), "Tuck-Planche", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,1), 15);
    Exercise wallSit = DefaultExercise("Wand-Sitzen", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,10), 4);
    Exercise squat = UnlockableExercise(Set.from([wallSit]), "Squats", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility, Category.Strength]), Set.from([MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,10), 4);
    Exercise lowSquat = UnlockableExercise(Set.from([wallSit]), "Tiefe Hocke", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 3);
    Exercise squatTuckJump = UnlockableExercise(Set.from([wallSit]), "Squat to Tuck-Jump", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), RepetitionbasedExerciseProgression(0,0,7), 10);
    Exercise pistolSquat = UnlockableExercise(Set.from([wallSit]), "Pistol-Squats", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,2), 23);
    Exercise shrimpSquat = UnlockableExercise(Set.from([wallSit]), "Shrimp-Squat", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,2), 30);
    Exercise sissySquat = UnlockableExercise(Set.from([wallSit]), "Sissy-Squat", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,2), 30);
    Exercise dragonPistolSquat = UnlockableExercise(Set.from([wallSit]), "Dragon-Pistol-Squat", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength]), Set.from([MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,2), 55);
    Exercise casualWalk = DefaultExercise("Spaziergang", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), DistancebasedExerciseProgression(0,0,1000), 5);
    Exercise fastWalk = UnlockableExercise(Set.from([casualWalk]), "Schnelles Gehen", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), DistancebasedExerciseProgression(0,0,1000), 10);
    Exercise jogging = UnlockableExercise(Set.from([fastWalk]), "Joggen", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), DistancebasedExerciseProgression(0,0,1000), 17);
    Exercise sprinting = UnlockableExercise(Set.from([jogging]), "Sprinten", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), DistancebasedExerciseProgression(0,0,100), 100);
    Exercise jumpingRope = DefaultExercise("Springseil/Boxerlauf", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), MinutebasedExerciseProgression(0,0,1), 10);
    Exercise nonJumpingJack = DefaultExercise("Bodenständiger Hampelmann", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 5);
    Exercise jumpingJack = UnlockableExercise(Set.from([nonJumpingJack]), "Hampelmann", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 10);
    Exercise sealJack = UnlockableExercise(Set.from([jumpingJack]), "Seal jack", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 13);
    Exercise crossOverJack = UnlockableExercise(Set.from([jumpingJack]), "Crossover jack", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 14);
    Exercise squatJack = UnlockableExercise(Set.from([jumpingJack]), "Squat jack", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 16);
    Exercise starJack = UnlockableExercise(Set.from([jumpingJack]), "Star jack", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,20), 19);
    Exercise skaterHops = UnlockableExercise(Set.from([jumpingJack]), "Skater hops", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 13.5);
    Exercise hockStreck = DefaultExercise("Hockstreck", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,5), 8);
    Exercise burpeeNoPushup = UnlockableExercise(Set.from([hockStreck]), "Burpee ohne Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Stamina]), Set.from([MuscleGroup.Chest, MuscleGroup.Core, MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,5), 13);
    Exercise burpeeWithPushup = UnlockableExercise(Set.from([hockStreck, pushup]), "Burpee mit Liegestütze", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength, Category.Stamina]), Set.from([MuscleGroup.Chest, MuscleGroup.Core, MuscleGroup.Legs]), RepetitionbasedExerciseProgression(0,0,5), 20);
    Exercise chestOpener = DefaultExercise("Brustöffner", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Chest]), SecondbasedExerciseProgression(0,0,20), 7.5);
    Exercise quadrizepsStretch = DefaultExercise("Quadrizeps", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,40), 7.5);
    Exercise legStretcher = DefaultExercise("Beindehner", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 7.5);
    Exercise halfForwardPose = DefaultExercise("Halbe Vorbeuge", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Core, MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,10), 3);
    Exercise fullForwardPose = UnlockableExercise(Set.from([halfForwardPose]), "Volle Vorbeuge", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Core, MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,10), 7);
    Exercise pushupPosition = UnlockableExercise(Set.from([fullForwardPose]), "liegestützposition", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Chest]), SecondbasedExerciseProgression(0,0,10), 15);
    Exercise cobra = UnlockableExercise(Set.from([fullForwardPose]), "Cobra", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,10), 4);
    Exercise downwardDog = UnlockableExercise(Set.from([cobra, pushupPosition]),"herabschauender Hund", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Chest]), SecondbasedExerciseProgression(0,0,10), 7.5);
    Exercise sunSalute = UnlockableExercise(Set.from([downwardDog, cobra]), "Sonnengruß", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Chest, MuscleGroup.Core, MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,10), 8.5);
    Exercise oneLeg = DefaultExercise("Auf einem Bein stehen", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 3);
    Exercise blindOneLeg = UnlockableExercise(Set.from([oneLeg]), "Auf einem Bein stehen (geschlossene Augen)", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 6.5);
    Exercise towelOneLeg = UnlockableExercise(Set.from([blindOneLeg]), "Auf einem Bein stehen (auf einem Handtuch)", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 8);
    Exercise standingScale = UnlockableExercise(Set.from([towelOneLeg]), "Stand-Waage", "Hier könnte eine Anleitung stehen", Set.from([Category.Agility]), Set.from([MuscleGroup.Core, MuscleGroup.Legs]), SecondbasedExerciseProgression(0,0,20), 15);
    Exercise headStand = UnlockableExercise(Set.from([pushup]),"Kopfstand", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength, Category.Agility]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,5), 2);
    Exercise crow = UnlockableExercise(Set.from([headStand]), "Krähe", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength, Category.Agility]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,2), 4);
    Exercise wallHandStand = UnlockableExercise(Set.from([crow]), "Wand Handstand", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength, Category.Agility]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,2), 6);
    Exercise freeWallHandStand = UnlockableExercise(Set.from([wallHandStand]), "Freier Wand Handstand", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength, Category.Agility]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,2), 9);
    Exercise freeHandStand = UnlockableExercise(Set.from([freeWallHandStand]), "Freier Handstand", "Hier könnte eine Anleitung stehen", Set.from([Category.Strength, Category.Agility]), Set.from([MuscleGroup.Chest, MuscleGroup.Core]), SecondbasedExerciseProgression(0,0,2), 13);

    List<Exercise> exercises = [kneePushup, pushup, tightPushup, widePushup, pikePushup, oneHandPushup, handStandPushup, sailorPushup, pedaling, flutterKicks, crunch, situp, underarmPlank, sidePlank, sidePlankLegraise, jackknifeCrunch, valSlidePushup, tuckPlanche, wallSit, squat, lowSquat, squatTuckJump, pistolSquat, shrimpSquat, sissySquat, dragonPistolSquat, casualWalk, fastWalk, jogging, sprinting, jumpingRope, nonJumpingJack, jumpingJack, sealJack, crossOverJack, squatJack, starJack, skaterHops, hockStreck, burpeeNoPushup, burpeeWithPushup, chestOpener, quadrizepsStretch, legStretcher, downwardDog, cobra, halfForwardPose, fullForwardPose, pushupPosition, sunSalute, oneLeg, blindOneLeg, towelOneLeg, standingScale, headStand, crow, wallHandStand, freeWallHandStand, freeHandStand];
    SettingsSingleton.exerciseOverview = ExerciseOverviewImpl(exercises);
    SettingsSingleton.trainingPlan = TrainingPlan();

    //TODO - Remove this (Test Data)
    SettingsSingleton.trainingPlan.addExercise(kneePushup);
    SettingsSingleton.trainingPlan.addExercise(pedaling);
    SettingsSingleton.trainingPlan.addExercise(hockStreck);

    //Create or load progression-connections (yes, load the remaining connections too)
    kneePushup.transformation = ExerciseTransformation(pushup,10);

    pushup.unlocks = Set.from([
      ExerciseUnlock(tightPushup, 5),
      ExerciseUnlock(headStand, 8),
      ExerciseUnlock(widePushup, 10),
      ExerciseUnlock(pikePushup, 15),
      ExerciseUnlock(oneHandPushup, 25),
      ExerciseUnlock(handStandPushup, 30),
      ExerciseUnlock(sailorPushup, 35),
    ]);

    pedaling.transformation = ExerciseTransformation(flutterKicks, 30);
    flutterKicks.transformation = ExerciseTransformation(crunch, 15);
    crunch.transformation = ExerciseTransformation(situp, 15);

    situp.unlocks = Set.from([
      ExerciseUnlock(underarmPlank, 10),
      ExerciseUnlock(sidePlank, 15),
      ExerciseUnlock(jackknifeCrunch, 20),
      ExerciseUnlock(valSlidePushup, 25),
      ExerciseUnlock(tuckPlanche, 30),
    ]);

    sidePlank.transformation = ExerciseTransformation(sidePlankLegraise, 40);

    headStand.transformation = ExerciseTransformation(crow, 10);
    crow.transformation = ExerciseTransformation(wallHandStand, 10);
    wallHandStand.transformation = ExerciseTransformation(freeWallHandStand, 10);
    freeWallHandStand.transformation = ExerciseTransformation(freeHandStand, 5);


    nonJumpingJack.transformation = ExerciseTransformation(jumpingJack, 0.5);

    jumpingJack.unlocks = Set.from([
      ExerciseUnlock(sealJack,30),
      ExerciseUnlock(crossOverJack, 50),
      ExerciseUnlock(squatJack, 70),
      ExerciseUnlock(starJack, 90),
      ExerciseUnlock(skaterHops, 120),
    ]);



    wallSit.transformation = ExerciseTransformation(squat, 30);

    squat.unlocks = Set.from([
      ExerciseUnlock(lowSquat, 15),
      ExerciseUnlock(squatTuckJump, 20),
      ExerciseUnlock(pistolSquat, 35),
      ExerciseUnlock(shrimpSquat, 50),
      ExerciseUnlock(sissySquat, 60),
      ExerciseUnlock(dragonPistolSquat, 70),
    ]);

    hockStreck.transformation = ExerciseTransformation(burpeeNoPushup, 10);
    burpeeNoPushup.transformation = ExerciseTransformation(burpeeWithPushup, 10);

    casualWalk.transformation = ExerciseTransformation(fastWalk, 2000);
    fastWalk.transformation = ExerciseTransformation(jogging, 5000);

    jogging.unlocks = Set.from([ExerciseUnlock(sprinting, 10000)]);

    oneLeg.transformation = ExerciseTransformation(blindOneLeg, 40);
    blindOneLeg.transformation = ExerciseTransformation(towelOneLeg, 20);
    towelOneLeg.transformation = ExerciseTransformation(standingScale, 30);

    halfForwardPose.transformation = ExerciseTransformation(fullForwardPose, 60);
    fullForwardPose.unlocks = Set.from([
      ExerciseUnlock(pushupPosition, 45),
      ExerciseUnlock(cobra, 60),
    ]);

    cobra.unlocks = Set.from([ExerciseUnlock(downwardDog, 60)]);
    pushupPosition.unlocks = Set.from([ExerciseUnlock(downwardDog, 60)]);

    downwardDog.unlocks = Set.from([ExerciseUnlock(sunSalute, 60)]);
  }
}

