import 'package:flutter/material.dart';
import 'package:outpass_app/src/tabs/home.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Outpass App',
      home: Home(),
      // routes: {
      //   '/' : (context) => const Home(),
      // },
    );
  }
}
