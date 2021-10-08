import 'dart:io';

import 'package:camera/camera.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happier2/ui/screens/board.screen.dart';
import 'package:happier2/ui/screens/login_screen.dart';
import 'package:happier2/utils/constants/colors.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    initializeCamera(selectedCamera); //Initially selectedCamera = 0
    super.initState();
  }

  late CameraController _controller; //To control the camera
  late Future<void>
      _initializeControllerFuture; //Future to wait until camera initializes
  int selectedCamera = 1;
  List<File> capturedImages = [];

  initializeCamera(int cameraIndex) async {
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.cameras[cameraIndex],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return _CameraPreview(controller: _controller);
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Flexible(
            child: Container(
              color: SECONDARY_COLOR,
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'How are you feeling today?',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Colors.grey,
                                        offset: Offset(0, 2.0),
                                      )
                                    ]),
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  await _initializeControllerFuture;
                                  var xFile = await _controller.takePicture();
                                  setState(() {
                                    capturedImages.add(File(xFile.path));
                                  });
                                },
                                child: IconButton(
                                  iconSize: 120,
                                  color: Colors.black,
                                  icon: const DecoratedIcon(
                                    Icons.camera,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: SECONDARY_COLOR,
                                      ),
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Colors.grey,
                                        offset: Offset(0, 6.0),
                                      ),
                                    ],
                                  ),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  ),
                                )),
                            Text(
                              'Press the button above to measure your mood.',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CameraPreview extends StatelessWidget {
  const _CameraPreview({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    print(controller.value.aspectRatio);
    return CameraPreview(controller);
  }
}
