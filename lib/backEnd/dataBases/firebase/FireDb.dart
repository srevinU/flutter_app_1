import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/backEnd/dataBases/firebase/firebase_options.dart';
import 'package:flutter_application_1/backEnd/entities/Message.dart';

class FireDb {
  final String email;
  final String password;

  FireDb(this.email, this.password);

  static Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<Message> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Message(code: 200, type: "Log In", description: "");
    } on FirebaseAuthException catch (exp) {
      if (exp.code == 'user-not-found') {
        return Message(
            code: 1,
            type: "Log In",
            description: "No user found for that email.");
      } else if (exp.code == 'wrong-password') {
        return Message(
            code: 2,
            type: "Log In",
            description: "Wrong password provided for that user.");
      } else if (exp.code == 'invalid-email') {
        return Message(
            code: 3, type: "Log In", description: "Wrong email provided.");
      } else {
        return Message(code: 4, type: "Log In", description: "$exp");
      }
    } catch (exp) {
      return Message(code: 5, type: "Log In", description: "$exp");
    }
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Message(code: 200, type: "Sign In", description: "");
    } on FirebaseAuthException catch (exp) {
      if (exp.code == 'weak-password') {
        return Message(code: 1, type: "Sign In", description: "The password provided is too weak.");
      } else if (exp.code == 'email-already-in-use') {
        return Message(code: 2, type: "Sign In", description: "The account already exists for that email.");
      } else {
        return Message(code: 3, type: "Sign In", description: "$exp");
      }
    } catch (exp) {
      return Message(code: 4, type: "Sign In", description: "$exp");
    }
  }


}
