import 'package:flutter/material.dart';
import 'header.dart';
import 'list.dart';

class Body extends StatefulWidget {
  final Function addFunction;
  const Body({Key? key, required this.addFunction}) : super(key: key);

  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  String searchString = "";

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
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 10),
                            // blurRadius: 50,
                            color: Colors.lightBlue,
                          ),
                        ],
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
          child: PeopleCardList(inputSearch: searchString, addOnePeople: widget.addFunction),
        ),
      ],
    );
  }
}
