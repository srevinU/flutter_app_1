import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/repository/RepoCatagory.dart';
import 'package:flutter_application_1/backEnd/repository/RepoPerson.dart';
import 'package:flutter_application_1/frontEnd/utils/Body.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _currentIndex = 0;
  RepoPerson repoPerson = RepoPerson();
  RepoCategory repoCategory = RepoCategory();

  Future<void> addOnePeople(Object record) async {
    List<Map<String, dynamic>> recordMapped =
        record as List<Map<String, dynamic>>;
    await repoPerson.insertRecord(recordMapped);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> addOneCategory(Object record) async {
    List<Map<String, dynamic>> recordMapped =
        record as List<Map<String, dynamic>>;
    await repoCategory.insertRecord(recordMapped);
    if (mounted) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        title: Text(
          getAppBarTitle(),
          style: const TextStyle(fontSize: 28),
        ),
        elevation: 0,
        backgroundColor: Colors.cyan,
      ),
      body: Body(currentIndex: _currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "",
            activeIcon: Icon(
              Icons.people,
              color: Colors.cyan,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "",
            activeIcon: Icon(
              Icons.list,
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }

  String getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return "My Contact App";
      case 1:
        return "Categories";
      default:
        return "";
    }
  }
}