import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:outpass_app/src/tabs/home.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.camera,
    });

    final CameraDescription camera;

  @override
  // ignore: no_logic_in_create_state
  State<MyApp> createState() => _MyAppState(camera: camera);
}

class _MyAppState extends State<MyApp> {
  _MyAppState({required this.camera});
  final CameraDescription camera;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Outpass App',
      home: Home(camera: camera),
      routes: {
        '/applyforoutpass' : (context) => Home(camera: camera),
      },
    );
  }
}
