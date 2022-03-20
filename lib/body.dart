import 'package:flutter/material.dart';
import 'header.dart';
import 'list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Take size of the current devise used by end-user
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Header(),
        Container(
          padding: const EdgeInsets.all(10),
          width: 400,
          height: 566.6,
          color: Colors.transparent,
          child: const PeopleCardList(),
        ),
      ],
    );
  }
}

