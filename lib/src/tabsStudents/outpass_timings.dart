import 'package:flutter/material.dart';
import 'package:outpass_app/src/components/appbar.dart';
import 'package:outpass_app/src/components/drawer_function.dart';

class OutpassTimings extends StatefulWidget {
  const OutpassTimings({super.key});

  @override
  State<OutpassTimings> createState() => _OutpassTimingsState();
}

class _OutpassTimingsState extends State<OutpassTimings> {
  final List<List<String>> outpassTimes = [];

  @override
  void initState() {
    super.initState();
    outpassTimes.add([
      '18th October 2024',
      '3.30 PM - 7.30 PM',
      '16th October 2024',
    ]);
    outpassTimes.add([
      '19th October 2024',
      '5:00 AM - 7.30 PM',
      '17th October 2024',
    ]);
    outpassTimes.add([
      '20th October 2024',
      '5.00 AM - 7.30 PM',
      '18th October 2024',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: drawerMenuFunction(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: outpassTimes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(outpassTimes[index][0]),
                subtitle: Text(outpassTimes[index][1]),
              ),
            );
          },
        ),
      ),
    );
  }
}
