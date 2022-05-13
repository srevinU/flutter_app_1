import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/frontEnd/pages/Home.dart';
import 'package:flutter_application_1/frontEnd/pages/SignIn.dart';
import 'package:flutter_application_1/backEnd/dataBases/firebase/FireDb.dart';
import 'package:flutter_application_1/frontEnd/utils/PictureTaker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FireDb.init();
  final List<CameraDescription> cameras = await availableCameras();
  runApp(PictureTaker(cameras: cameras));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myApp",
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const SignIn();
          }
        },
      ),
    );
  }
}
