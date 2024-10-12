// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:outpass_app/src/components/appbar.dart';
import 'package:outpass_app/src/tabs/apply_outpass.dart';
import 'package:outpass_app/src/tabs/apply_outpass_emergency.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

void _showPopupMenu(BuildContext context, Offset tapPosition) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        tapPosition & const Size(40, 40), // Popup position size
        Offset.zero & overlay.size, // Screen size
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      menuPadding: const EdgeInsets.all(10.0),
      items: [
        PopupMenuItem(
          padding: const EdgeInsets.only(bottom: 10.0),
          labelTextStyle: const WidgetStatePropertyAll(
            TextStyle(color: Colors.black),
            ),
          value: 1,
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xFFD0BCFF),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Center(child: Text('Emergency Outpass'))
            ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.only(bottom: 10.0),
          labelTextStyle: const WidgetStatePropertyAll(
            TextStyle(color: Colors.black),
            ),
          value: 2,
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xFFD0BCFF),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Center(child: Text('Regular Timing Outpass'))
            ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.only(bottom: 00.0),
          labelTextStyle: const WidgetStatePropertyAll(
            TextStyle(color: Colors.black),
            ),
          value: 2,
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xFFD0BCFF),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Center(child: Text('Special Timing Outpass'))
            ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        // Handle selection of options
        if (value == 1) {
          context.mounted ?
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ApplyOutpassEmergency(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Start from the right
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ):null;
        }
        if (value == 2) {
          context.mounted ?
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ApplyOutpass(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Start from the right
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ):null;
        }
        if (value == 3) {
          context.mounted ?
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ApplyOutpass(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Start from the right
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ):null;
        }
      }
    });
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
                          onTapUp: (details) => 
                            _showPopupMenu(context, details.globalPosition),
                          onTap: () {
                            // Navigator.of(context).push(
                            //   PageRouteBuilder(
                            //     pageBuilder:
                            //         (context, animation, secondaryAnimation) =>
                            //             const ApplyOutpass(),
                            //     transitionsBuilder: (context, animation,
                            //         secondaryAnimation, child) {
                            //       const begin =
                            //           Offset(1.0, 0.0); // Start from the right
                            //       const end = Offset.zero;
                            //       const curve = Curves.ease;

                            //       var tween = Tween(begin: begin, end: end)
                            //           .chain(CurveTween(curve: curve));
                            //       var offsetAnimation = animation.drive(tween);

                            //       return SlideTransition(
                            //         position: offsetAnimation,
                            //         child: child,
                            //       );
                            //     },
                            //   ),
                            // );
                          },
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
                          onTap: () {},
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
