import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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

  Future<List<Map<String, dynamic>>> getPersonData() async {
    RepoPerson repoPerson = RepoPerson();
    try {
      final result = await repoPerson.getRecords();
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    RepoPerson repoPerson = RepoPerson();
    return FutureBuilder(
        future: getPersonData(),
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
                      person: Person.fromJson(snapshot.data![index]['person']));
                });
          }
        });
  }
}

class PeopleCard extends StatelessWidget {
  final Person person;
  const PeopleCard({Key? key, required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      // margin: EdgeInsets.all(10.0),
      color: Colors.blue[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(person.name),
            subtitle: Text(person.phone),
          )
        ],
      ),
    ));
  }
}
