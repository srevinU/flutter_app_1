import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/category.dart';
import 'package:flutter_application_1/frontEnd/utils/FormCategory.dart';

class AppCardCategory extends StatelessWidget {
  final int index;
  final Category record;
  final Object repositoryObject;
  final Function saveFunction;

  const AppCardCategory(
      {Key? key,
      required this.index,
      required this.record,
      required this.repositoryObject,
      required this.saveFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String logoInitialFromName = record.name.isNotEmpty
        ? record.name.split(" ").map((name) => name[0]).join("").toUpperCase()
        : "";

    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          // onTap: () => print("Open contact ${index}"),
          onTap: () => Navigator.push(
            /*peopleForm */
            context,
            MaterialPageRoute(
              builder: (context) => FormCategory(
                  actionForm: ActionForm.read,
                  record: record,
                  logoInitial : logoInitialFromName,
                  repositoryObject: repositoryObject,
                  saveOrAddFunc: saveFunction),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.white,
              /* boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.black12,
                ),
              ], */
            ),
            margin: const EdgeInsets.only(bottom: 1),
            child: Row(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                  height: 90,
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 35,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Text(
                              logoInitialFromName,
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 80,
                  width: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              record.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            record.name,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  height: 80,
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Other info")],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}