import 'package:flutter/material.dart';
import './backEnd/repository/repo_person.dart';
import './backEnd/entities/person.dart';

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

  void addOnePeople() {
    setState(() {
      repoPerson.insertRecord(repoPerson.getRecordTest());
    });
  }

  void delOnePeople(String sysUuid) {
    setState(() {
      repoPerson.deleteRecord(sysUuid);
    });
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
                          onPressed: addOnePeople,
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

class PeopleCardList extends StatelessWidget {
  PeopleCardList(
      {Key? key, required this.getPeoples, required this.delOnePeople})
      : super(key: key);
  final Function getPeoples;
  Function delOnePeople;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPeoples(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return PeopleCard(
                    person: Person.fromJson(snapshot.data![index]['person']),
                    delOnePeople: delOnePeople,
                  );
                });
          }
        });
  }
}

class PeopleCard extends StatelessWidget {
  final Person person;
  final Function delOnePeople;
  const PeopleCard({Key? key, required this.person, required this.delOnePeople})
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
            onTap: () =>
                delOnePeople(person.sysUuid), // delOnePeople(person.sysUuid),
            leading: const Icon(Icons.person),
            title: Text(person.name),
            subtitle: Text(person.phone),
          )
        ],
      ),
    ));
  }
}
