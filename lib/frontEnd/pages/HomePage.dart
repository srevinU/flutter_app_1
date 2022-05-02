import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/repository/RepoCatagory.dart';
import 'package:flutter_application_1/backEnd/repository/RepoPerson.dart';
import 'package:flutter_application_1/frontEnd/utils/ListGeneric.dart';

class MyHomePage extends StatefulWidget {
  // final Function addFunction;
  final int currentIndex;

  const MyHomePage({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String searchString = "";
  RepoPerson repoPerson = RepoPerson();
  RepoCategory repoCategory = RepoCategory();

  @override
  Widget build(BuildContext context) {
    // Take size of the current devise used by end-user
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.10,
              child: Stack(
                children: <Widget>[
                  Container(
                    // 15% of the current devise used by end-user
                    height: size.height * 0.30,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  // Position help to position the child at a different place
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      // Will create a padding symmetric for the both side of the widget
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (inputValue) {
                          // List search function
                          setState(() {
                            searchString = inputValue;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(
                              color: Colors.lightBlue.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: const Icon(Icons.search)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: 400,
          height: size.height * 0.67,
          color: Colors.transparent,
          child: getBody(),
        ),
      ],
    );
  }

  Widget? getBody() {
    String searchString = "";
    switch (widget.currentIndex) {
      case 0:
        // return Body(addFunction: addOnePeople);
        return ListGeneric(inputSearch: "", repositoryObject: repoPerson);
      case 1:
        return ListGeneric(inputSearch: "", repositoryObject: repoCategory);
      default:
        return const SizedBox.shrink();
    }
  }
}
