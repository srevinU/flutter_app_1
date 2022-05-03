import 'package:flutter/material.dart';

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
                      print("Sign In Test");
                    }),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Log In"),
                    onPressed: () {
                      print("Log In Test");
                    }),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
