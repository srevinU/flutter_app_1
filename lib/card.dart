import 'package:flutter/material.dart';
import 'backEnd/entities/person.dart';
import 'form.dart';

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
    return Center(
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
            color: Colors.lightBlue,
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
                  children: const <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            "https://www.pinclipart.com/picdir/big/218-2189254_free-online-avatars-kid-characters-family-vector-for.png"),
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
    );
  }
}
