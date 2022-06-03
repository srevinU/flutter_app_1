import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';

class PictureTaker extends StatefulWidget {
  final CameraDescription? camera;

  const PictureTaker({Key? key, this.camera}) : super(key: key);

  @override
  State<PictureTaker> createState() => _PictureTakerState();
}

class _PictureTakerState extends State<PictureTaker> {
  bool _isCameraAvailable = false;
  late CameraController _controller;
  late CameraDescription _cameraSelected;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    if (widget.camera != null) {
      _isCameraAvailable = true;
      _cameraSelected = widget.camera!;
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        _cameraSelected,
        // Define the resolution to use.
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      _initializeControllerFuture = _controller.initialize();
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Take a picture')),
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: _isCameraAvailable
            ? FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  print("snapshot: $snapshot");
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.error_sharp,
                    color: Colors.red,
                  ),
                  Text(
                    "\rNo camera devise found.",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialize
              await _initializeControllerFuture;
              // Attempt to take a picture and get the file `image`
              // where it was saved.
              printSucess("Trigger! 2");
              final image = await _controller.takePicture();
              printSucess("Trigger! 3");
              // If the picture was taken, display it on a new screen.
              printSucess(image.path);
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(
                    // Pass the automatically generated path to
                    // the DisplayPictureScreen widget.
                    imagePath: image.path,
                  ),
                ),
              );
            } catch (e) {
              // If an error occurs, log the error to the console.
              printError(e);
            }
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
      /* body: Column(
        children: [
          Image.file(File(imagePath)),
          ElevatedButton(
            onPressed: () => {},
            child: const Text("Save"),
          ),
        ],
      ), */
    );
  }
}
