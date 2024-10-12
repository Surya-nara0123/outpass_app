import 'package:flutter/material.dart';
import 'package:outpass_app/src/components/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Center(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Surya Narayanan C',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0BCFF),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFD0BCFF),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () => print('Apply for Outpass'),
                          splashColor: const Color(0xFFBFABEE).withOpacity(1.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.app_registration,
                                size: 64.0,
                                color: Colors.black,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Apply for Outpass',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0BCFF),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFD0BCFF),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () => print('See Outpass Timings'),
                          splashColor: const Color(0xFFBFABEE).withOpacity(1.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 64.0,
                                color: Colors.black,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Outpass Timings',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD0BCFF),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFFD0BCFF),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () => print('See Outpass Timings'),
                          splashColor: const Color(0xFFBFABEE).withOpacity(1.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner_sharp,
                                size: 64.0,
                                color: Colors.black,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Scan outpass',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
