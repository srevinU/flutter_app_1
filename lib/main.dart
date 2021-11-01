import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'backEnd/data/persons.dart';
import './backEnd//entities/person.dart';

void main() {
  runApp(const MypeopleApp());
}

class MypeopleApp extends StatelessWidget {
  const MypeopleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Hello !",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People App"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        width: 400,
        child: PeopleCardList(),
      ),
      // body: Center(
      //   child: WtfList(),
      // ),
    );
  }
}

class PeopleCardList extends StatelessWidget {
  PeopleCardList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _personData = getPersonData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _personData.length,
        itemBuilder: (BuildContext context, int index) {
          return PeopleCard(person: Person.fromJson(_personData[index]));
        });
  }
}

class PeopleCard extends StatelessWidget {
  final Person person;
  PeopleCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(10.0),
      color: Colors.blue[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        width: 20,
        height: 200,
        child: Center(
          child: Text(person.name),
        ),
      ),
    );
  }
}
