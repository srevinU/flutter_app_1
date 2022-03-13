import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Take size of the current devise used by end-user
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.12,
          child: Stack(
            children: <Widget>[
              Container(
                // 15% of the current devise used by end-user
                height: size.height * 0.10,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
              ),
              // Position help to position the child at a different place
              Positioned(
                bottom: 0,
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
                        blurRadius: 50,
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (inputValue) {
                      /* Future search function */
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
    );
  }
}

