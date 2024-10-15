import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

import 'package:outpass_app/src/components/appbar.dart';
import 'package:outpass_app/src/components/drawer_function.dart';

class ScanOutpassPage extends StatefulWidget {
  const ScanOutpassPage({
    super.key,
    // required this.camera,
  });

  // final CameraDescription camera;

  @override
  ScanOutpassState createState() => ScanOutpassState();
}

class ScanOutpassState extends State<ScanOutpassPage> {
  // late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    // _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      // widget.camera,
      // Define the resolution to use.
      // ResolutionPreset.veryHigh,
    // );

    // Next, initialize the controller. This returns a Future.
    // _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        drawer: drawerMenuFunction(context),
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 657.0,
            width: double.infinity,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return Container(
                    // rounded corners
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFD0BCFF),
                        width: 8,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(children: [
                        // CameraPreview(
                          // _controller,
                        // ),
                        Center(
                          child: SizedBox(
                            width: 220,
                            height: 220,
                            child: Center(
                              child: Container(
                                height: 2.0,
                                // width: double.infinity,
                                color: Colors.green, // Green line color
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.53, -0.29),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                              // border of only topside and right side
                              border: Border(
                                top: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                                right: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.53, 0.29),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                                right: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(-0.53, -0.29),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                                left: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(-0.53, 0.29),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                                left: BorderSide(
                                  color: Colors.green, // Green border color
                                  width: 4.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                      ]),
                    ),
                  );
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
