import 'package:flutter/material.dart';
import 'package:outpass_app/src/components/appbar.dart';
import 'package:outpass_app/src/components/drawer_function.dart';

class OutpassRequests extends StatefulWidget {
  const OutpassRequests({super.key});

  @override
  State<OutpassRequests> createState() => _OutpassRequestsState();
}

class _OutpassRequestsState extends State<OutpassRequests> {
  final List<List<String>> outpassRequests = [
    [
      'Surya Narayanan C', // Name
      'Regular', // Type
      'Going to home', // Remarks
      '18th October 2024', // outdate
      '3.00 PM', // outtime
      '20th October 2024', // indate
      '8.00 AM', // intime
      '1234567890', // parents phone
      '0987654321', // student phone
      '23110035', // roll number
      'CSE', // department
      '3rd year', // year
      '4 Block', // block
      'D-404', // room
      'Chennai', //location
    ],
    [
      'Surya Narayanan C', // Name
      'Emergency', // Type
      'Going to hospital', // Remarks
      '18th October 2024', // outdate
      '3.00 PM', // outtime
      '20th October 2024', // indate
      '8.00 AM', // intime
      '1234567890', // parents phone
      '0987654321', // student phone
      '23110035', // roll number
      'CSE', // department
      '3rd year', // year
      '4 Block', // block
      'D-404', // room
      'Chennai', //location
    ],
    [
      'Surya Narayanan C', // Name
      'Special', // Type
      'Going to home', // Remarks
      '18th October 2024', // outdate
      '3.00 PM', // outtime
      '20th October 2024', // indate
      '8.00 AM', // intime
      '1234567890', // parents phone
      '0987654321', // student phone
      '23110035', // roll number
      'CSE', // department
      '3rd year', // year
      '4 Block', // block
      'D-404', // room
      'Chennai', //location
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        drawer: drawerMenuFunction(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Outpass Requests',
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
                  for (final request in outpassRequests)
                    request[1] != 'Special'
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Material(
                              elevation: 2.5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.all(10.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment
                                          .topRight, // Aligns the icons to the top right
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Stack(
                                            alignment: Alignment
                                                .center, // Align the tick in the middle of the box
                                            children: [
                                              Material(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: const Color(0xFFD0BCFF),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  onTap: () {
                                                    print("object");
                                                  },
                                                  splashColor:
                                                      const Color(0xFF000000)
                                                          .withOpacity(1.0),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: const Color(
                                                          0xFFD0BCFF), // Green
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Icon(Icons.check_rounded,
                                                  size: 30,
                                                  color: Colors.black),
                                            ],
                                          ), // Green for approval
                                          const SizedBox(
                                              width:
                                                  8), // Space between the icons
                                          const Icon(Icons.close_rounded,
                                              size: 30,
                                              color: Color(
                                                  0xFFF44336)), // Red for rejection
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Name: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              request[0],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Remarks: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              request[2],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Outdate:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    request[3],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    request[4],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Indate:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    request[5],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    request[6],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Phone Numbers:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Parent: ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        request[7],
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Student: ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        request[8],
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Roll Number: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              request[9],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Department: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              request[10],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Year: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              request[11],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Hostel Details:',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Hostel: ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        request[12],
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Room: ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        request[13],
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Location: ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              request[14],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container()
                ],
              ),
            )
          ]),
        ));
  }
}
