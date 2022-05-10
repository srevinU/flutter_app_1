import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';
import 'package:flutter_application_1/backEnd/entities/Message.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  String? _fieldValidator(String? value) {
    return value == null || value.isEmpty ? 'Please enter some text' : null;
  }

  TextEditingController emailCtler = TextEditingController();
  TextEditingController passwordCtler = TextEditingController();

  @override
  void dispose() {
    emailCtler.dispose();
    passwordCtler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.8,
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailCtler,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) => _fieldValidator(value),
                    autofocus: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordCtler,
                    decoration: const InputDecoration(labelText: "Password"),
                    validator: (value) => _fieldValidator(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text("Sign In"),
                      onPressed: () {
                        print("Sign In Test: ${emailCtler.text}");
                      }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text("Log In"),
                      onPressed: () async {
                        Message login = await logIn();
                        if (login.code != 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(login.description),
                            )
                          );
                        };
                      }),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

    Future<Message> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtler.text.trim(),
        password: passwordCtler.text.trim(),
      );
      return Message(code: 200, type: "Sign In", description: "");
    } on FirebaseAuthException catch (exp) {
      if (exp.code == 'user-not-found') {
        return Message(code: 1, type: "Sign In", description: "No user found for that email.");
      } else if (exp.code == 'wrong-password') {
        return Message(code: 2, type: "Sign In", description: "Wrong password provided for that user.");
      } else if (exp.code == 'invalid-email') {
        return Message(code: 3, type: "Sign In", description: "Wrong email provided.");
      } else {
        return Message(code: 4, type: "Sign In", description: "$exp");
      }
    } catch (exp) {
      return Message(code: 5, type: "Sign In", description: "$exp");
    }
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtler.text.trim(),
        password: passwordCtler.text.trim(),
      );
    } on FirebaseAuthException catch (exp) {
      if (exp.code == 'weak-password') {
        printError('The password provided is too weak.');
      } else if (exp.code == 'email-already-in-use') {
        printError('The account already exists for that email.');
      } else {
        printError(exp);
      }
    } catch (exp) {
      printError(exp);
    }
  }

}
