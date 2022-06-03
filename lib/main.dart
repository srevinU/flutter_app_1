import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';
import 'package:flutter_application_1/frontEnd/pages/Home.dart';
import 'package:flutter_application_1/frontEnd/pages/SignIn.dart';
import 'package:flutter_application_1/backEnd/dataBases/firebase/FireDb.dart';
import 'package:flutter_application_1/frontEnd/utils/PictureTaker.dart';

void main() async {
  CameraDescription? camera;
  WidgetsFlutterBinding.ensureInitialized();
  await FireDb.init();
  List<CameraDescription> cameras = await availableCameras();
  printSucess(cameras);
  if (cameras.isNotEmpty) {
   camera = cameras.first;
  }
  // runApp(PictureTaker(cameras: cameras));
  runApp(MyApp(camera: camera));
}

class MyApp extends StatelessWidget {
  final CameraDescription? camera;
  const MyApp({Key? key, this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myApp",
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home(camera: camera);
          } else {
            return const SignIn();
          }
        },
      ),
    );
  }
}
