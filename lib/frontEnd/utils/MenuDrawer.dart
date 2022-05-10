import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.cyan,
                    radius: 65,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/persons/generated_photos_5dd0849adef8b400084c4aa8.png"),
                      radius: 60,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("My Name"),
                ]),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _logOut(),
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, elevation: 0),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (exp) {
      printError(exp);
    }
    ;
  }
}
