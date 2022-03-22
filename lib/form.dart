import 'package:flutter/material.dart';
import 'backEnd/entities/person.dart';

enum Type { read, add, save }

class PeopleForm extends StatefulWidget {
  final Type type;
  final Person? record;
  final Function? addOrSaveFunction;

  const PeopleForm(
      {Key? key, required this.type, this.record, this.addOrSaveFunction})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Peopleform();
  }
}

class _Peopleform extends State<PeopleForm> {
  final _formKey = GlobalKey<FormState>();

  String? _fieldValidator(String? value) {
    return value == null || value.isEmpty ? 'Please enter some text' : null;
  }

  TextEditingController personSysUuidCtler = TextEditingController();
  TextEditingController personNameCtler = TextEditingController();
  TextEditingController birthDateCtler = TextEditingController();
  TextEditingController phoneCtler = TextEditingController();
  TextEditingController emailCtler = TextEditingController();
  TextEditingController genderCtler = TextEditingController();
  TextEditingController streetAddressCtler = TextEditingController();
  TextEditingController countryCtler = TextEditingController();
  TextEditingController postalCodeCtler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.type == Type.read) {
      personSysUuidCtler.text = widget.record!.sysUuid!;
      personNameCtler.text = widget.record!.name;
      birthDateCtler.text = widget.record!.birthDate;
      phoneCtler.text = widget.record!.phone;
      emailCtler.text = widget.record!.email;
      genderCtler.text = widget.record!.gender;
      streetAddressCtler.text = widget.record!.streetAddress;
      countryCtler.text = widget.record!.country;
      postalCodeCtler.text = widget.record!.postalCode;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextFormField(
                controller: personNameCtler,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: birthDateCtler,
                decoration:
                    const InputDecoration(labelText: "Birth Date YYYY/MM/DD"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: phoneCtler,
                decoration: const InputDecoration(labelText: "Phone"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: emailCtler,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: genderCtler,
                decoration: const InputDecoration(labelText: "Gender"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: streetAddressCtler,
                decoration: const InputDecoration(labelText: "Street address"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: countryCtler,
                decoration: const InputDecoration(labelText: "Country"),
                validator: (value) => _fieldValidator(value),
              ),
              TextFormField(
                controller: postalCodeCtler,
                decoration: const InputDecoration(labelText: "Postal code"),
                validator: (value) => _fieldValidator(value),
              ),
              Align(
                child: ElevatedButton(
                  child: (widget.type == Type.add)
                      ? const Text("Add")
                      : const Text("Save"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        (widget.type == Type.add)
                            ? const SnackBar(
                                content: Text('Submiting new person...'),
                              )
                            : const SnackBar(content: Text('Saving...')),
                      );
                      Person myTestPers = Person(
                          sysUuid: (widget.type == Type.add)
                              ? null
                              : personSysUuidCtler.text,
                          name: personNameCtler.text,
                          birthDate: birthDateCtler.text,
                          phone: phoneCtler.text,
                          email: emailCtler.text,
                          gender: genderCtler.text.toLowerCase(),
                          streetAddress: streetAddressCtler.text,
                          country: countryCtler.text,
                          postalCode: postalCodeCtler.text);

                      widget.addOrSaveFunction!([myTestPers.toJson()]);
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }
}
