import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';
import 'package:flutter_application_1/backEnd/dataBases/firebase/firebase_options.dart';
import 'package:flutter_application_1/backEnd/entities/Message.dart';

class FireDb {
  FireDb();

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    } catch (exp) {
      printError(exp);
    }
  }

  static Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (exp) {
      printError(exp);
    }
  }

  Future<Message> logIn(email, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Message(code: 200, type: "Log In", description: "");
    } on FirebaseAuthException catch (exp) {
      switch (exp.code) {
        case 'user-not-found':
          {
            return Message(
                code: 1,
                type: "Log In",
                description: "No user found for that email.");
          }

        case 'wrong-password':
          {
            return Message(
                code: 2,
                type: "Log In",
                description: "Wrong password provided for that user.");
          }

        case 'invalid-email':
          {
            return Message(
                code: 3, type: "Log In", description: "Wrong email provided.");
          }

        default:
          {
            return Message(code: 4, type: "Log In", description: "$exp");
          }
      }
    } catch (exp) {
      return Message(code: 5, type: "Log In", description: "$exp");
    }
  }

  Future<Message> signIn(email, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Message(code: 200, type: "Sign In", description: "");
    } on FirebaseAuthException catch (exp) {
      switch (exp.code) {
        case 'weak-password':
          {
            return Message(
                code: 1,
                type: "Sign In",
                description: "The password provided is too weak.");
          }

        case 'email-already-in-use':
          {
            return Message(
                code: 2,
                type: "Sign In",
                description: "The account already exists for that email.");
          }

        default:
          {
            return Message(code: 3, type: "Sign In", description: "$exp");
          }
      }
    } catch (exp) {
      return Message(code: 4, type: "Sign In", description: "$exp");
    }
  }
}
