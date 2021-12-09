import 'package:flutter/material.dart';
import './backEnd/entities/person.dart';

class PeopleCard extends StatelessWidget {
  final Person person;
  final int index;
  const PeopleCard({Key? key, required this.person, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: Colors.blue[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(person.name),
            // subtitle: Text(person.phone),
            subtitle: Text(index.toString()),
          )
        ],
      ),
    ));
  }
}
