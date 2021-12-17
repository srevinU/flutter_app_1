import 'package:flutter/material.dart';
import 'main.dart';
import 'field_form.dart';

class PeopleForm extends StatefulWidget {
  final Function addOnePeople;
  const PeopleForm({Key? key, required this.addOnePeople}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Peopleform();
  }
}

class _Peopleform extends State<PeopleForm> {
  final _formKey = GlobalKey<FormState>();

  // _redirect() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const MypeopleApp()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People Form"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const FieldForm(labelField: 'First Name'),
              const FieldForm(labelField: 'Last Name'),
              const FieldForm(labelField: 'Phone'),
              const FieldForm(labelField: 'Email'),
              Align(
                child: ElevatedButton(
                  child: const Text("Add"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      widget.addOnePeople();
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
