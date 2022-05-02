import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/person.dart';

enum ActionForm { read, add, save }

class FormPerson extends StatefulWidget {
  final ActionForm actionForm;
  final Person record;
  final Object repositoryObject;
  final Function saveOrAddFunc;

  const FormPerson(
      {Key? key,
      required this.actionForm,
      required this.record,
      required this.repositoryObject,
      required this.saveOrAddFunc})
      : super(key: key);

  @override
  State<FormPerson> createState() => _FormPersonState();
}

class _FormPersonState extends State<FormPerson> {
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
    if (widget.actionForm == ActionForm.read) {
      personSysUuidCtler.text = widget.record.sysUuid!;
      personNameCtler.text = widget.record.name;
      birthDateCtler.text = widget.record.birthDate;
      phoneCtler.text = widget.record.phone;
      emailCtler.text = widget.record.email;
      genderCtler.text = widget.record.gender;
      streetAddressCtler.text = widget.record.streetAddress;
      countryCtler.text = widget.record.country;
      postalCodeCtler.text = widget.record.postalCode;
    }

    String photoLink =
        widget.record.photo ?? "deer_jumping_silhouette_animal.jpeg";

    return Scaffold(
      appBar: (widget.actionForm == ActionForm.read)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.lightBlue,
            )
          : null,
      body: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: AssetImage("assets/persons/$photoLink"),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextFormField(
                  controller: personNameCtler,
                  decoration: const InputDecoration(
                      labelText: "Name", counter: SizedBox.shrink()),
                  maxLength: 15,
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
                  decoration:
                      const InputDecoration(labelText: "Street address"),
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
                    child: (widget.actionForm == ActionForm.add)
                        ? const Text("Add")
                        : const Text("Save"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          (widget.actionForm == ActionForm.add)
                              ? const SnackBar(
                                  content: Text('Submiting new record...'),
                                )
                              : const SnackBar(content: Text('Saving...')),
                        );

                        Person myTestPers = Person(
                            sysUuid: (widget.actionForm == ActionForm.add)
                                ? null
                                : personSysUuidCtler.text,
                            name: personNameCtler.text,
                            birthDate: birthDateCtler.text,
                            phone: phoneCtler.text,
                            email: emailCtler.text,
                            gender: genderCtler.text.toLowerCase(),
                            streetAddress: streetAddressCtler.text,
                            country: countryCtler.text,
                            postalCode: postalCodeCtler.text,
                            photo: photoLink);

                        if (widget.actionForm == ActionForm.add) {
                          widget.saveOrAddFunc([myTestPers.toJson()]);
                        } else {
                          widget.saveOrAddFunc([myTestPers.toJson()]);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
