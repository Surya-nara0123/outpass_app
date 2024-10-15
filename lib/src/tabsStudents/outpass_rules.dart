import 'package:flutter/material.dart';
import 'package:outpass_app/src/components/appbar.dart';
import 'package:outpass_app/src/components/drawer_function.dart';

class OutpassRules extends StatefulWidget {
  const OutpassRules({super.key});

  @override
  State<OutpassRules> createState() => _OutpassRulesState();
}

class _OutpassRulesState extends State<OutpassRules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: drawerMenuFunction(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Rules for applying for an Outpass',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Column(
                    children: [
                      Text(
                        '1. Students must choose the correct type of outpass.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0),
                        child: Text(
                            '1.1. Regular Outpass: This outpass is issued during allowed outpass timings.'),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0),
                        child: Text(
                            '1.2. Emergency Outpass: This outpass is issued for emergencies like medical emergencies and family emergencies.'),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0),
                        child: Text(
                            '1.3. Special Outpass: This outpass is issued outside the allowed outpass timings.'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '2. At the gate the QR code is scanned when going out and coming back in.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '3. Any efforts to tamper with app or the QR code will result in severe disciplinary action.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
