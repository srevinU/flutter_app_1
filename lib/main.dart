import 'package:flutter/material.dart';
import 'body.dart';
import 'form.dart';
import './backEnd/repository/repo_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "myApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  RepoPerson repoPerson = RepoPerson();

  Future<void> addOnePeople(Object record) async {
    List<Map<String, dynamic>> recordMapped =
    record as List<Map<String, dynamic>>;
    await repoPerson.insertRecord(recordMapped);
    if (mounted) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
        ],
      ),
    );
  }

  Widget? getBody () {
    switch (_currentIndex) {
      case 0:
        return Body(addFunction: this.addOnePeople);
      case 1:
        return PeopleForm(
            type: Type.add,
            addOrSaveFunction: addOnePeople);
      case 2:
        return const SizedBox.shrink();
    }
  }
}


