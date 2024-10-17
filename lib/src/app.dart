// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:outpass_app/src/tabsStudents/apply_outpass_special.dart';
import 'package:outpass_app/src/tabsStudents/apply_outpass.dart';
import 'package:outpass_app/src/tabsStudents/apply_outpass_emergency.dart';
import 'package:outpass_app/src/tabsWarden/home.dart';
import 'package:outpass_app/src/tabsStudents/outpass_rules.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    // required this.camera,
    });

    // final CameraDescription camera;

  @override
  // ignore: no_logic_in_create_state
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();
  // final CameraDescription camera;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Outpass App',
      home: Home(),
      routes: {
        '/applyforoutpass' : (context) => const ApplyOutpass(),
        '/applyforoutpassEmergency' : (context) => const ApplyOutpassEmergency(),
        '/applyforoutpassSpecial' : (context) => const ApplyOutpassSpecial(),
        '/rulesforoutpass' : (context) => const OutpassRules(),
      },
    );
  }
}
