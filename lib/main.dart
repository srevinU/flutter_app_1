import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/person.dart';
import 'package:flutter_application_1/form.dart';
import './backEnd/repository/repo_person.dart';
import 'list.dart';
import 'form.dart';

void main() {
  runApp(const MypeopleApp());
}

class MypeopleApp extends StatelessWidget {
  const MypeopleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Hello !",
      home: PeopleHomePage(
        title: 'Peoples',
      ),
    );
  }
}

class PeopleHomePage extends StatefulWidget {
  const PeopleHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<PeopleHomePage> createState() => _PeopleHomePageState();
}

class _PeopleHomePageState extends State<PeopleHomePage> {
  RepoPerson repoPerson = RepoPerson();

  // void addOnePeople() {
  //   setState(() {
  //     repoPerson.insertRecord(repoPerson.getRecordTest());
  //   });
  // }

  Future<void> addOnePeople(Object record) async {
    List<Map<String, dynamic>> recordMapped =
        record as List<Map<String, dynamic>>;
    await repoPerson.insertRecord(recordMapped);
    if (mounted) {
      setState(() {});
    }
  }

  // To continue
  Future<void> savePeopleData(Object record) async {
    List<Map<String, dynamic>> recordMapped =
        record as List<Map<String, dynamic>>;
    await repoPerson.updateRecord(recordMapped);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> delOnePeople(sysUuid) async {
    await repoPerson.deleteRecord(sysUuid);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peoples"),
        backgroundColor: Colors.black,
        leading: const Icon(Icons.account_circle_rounded),
        actions: const [Icon(Icons.more_vert_rounded)],
      ),
      body: Container(
        alignment: Alignment.center,
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 400,
              height: 660,
              decoration: const BoxDecoration(color: Colors.white),
              child: PeopleCardList(
                  getPeoples: repoPerson.getRecords,
                  delOnePeople: delOnePeople),
            ),
            Container(
              padding: const EdgeInsets.only(right: 25),
              width: 400,
              height: 60,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
              child: Row(
                // textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text("Future Search field")],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          onPressed: () => Navigator.push(
                              // addOnePeople
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleForm(
                                      type: Type.add,
                                      addOrSaveFunction: addOnePeople))),
                          tooltip: 'Add people',
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
