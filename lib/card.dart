import 'form.dart';
import 'package:flutter/material.dart';
import 'backEnd/entities/person.dart';
import 'backEnd/common/generator.dart';
import 'dart:math';

class PeopleCard extends StatelessWidget {
  final Person person;
  final int index;
  final Function savePeopleModified;

  const PeopleCard(
      {Key? key,
      required this.person,
      required this.index,
      required this.savePeopleModified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecordGenerator Generator = RecordGenerator();
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          // onTap: () => print("Open contact ${index}"),
          onTap: () => Navigator.push(
            /*peopleForm */
            context,
            MaterialPageRoute(
              builder: (context) => PeopleForm(
                type: Type.read,
                record: person,
                addOrSaveFunction: savePeopleModified,
              ),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.black12,
                ),
              ],
            ),
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2),
                  height: 105,
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 27,
                        child: CircleAvatar(
                          radius: 25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image(
                                image: AssetImage(
                                    "assets/persons/${person.photo}")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  height: 80,
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(person.name),
                      Text(person.phone),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  height: 80,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Other info")],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
