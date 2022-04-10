import 'package:flutter/material.dart';
import 'backEnd/entities/category.dart';
import 'CategoryForm.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final Category category;
  final Function saveCategoryModified;

  const CategoryCard(
      {Key? key,
      required this.category,
      required this.index,
      required this.saveCategoryModified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          // onTap: () => print("Open contact ${index}"),
          onTap: () => Navigator.push(
            /*peopleForm */
            context,
            MaterialPageRoute(
              builder: (context) => CategoryForm(
                  typeCategoryForm: TypeCategoryForm.read,
                  record: category,
                  addOrSaveFunction: saveCategoryModified,
                  ),
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
                          child: Image(
                            image: AssetImage(
                                "assets/persons/${"No need to have category photo"}"),
                          ),
                        ),
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
                              category.name,
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
                            category.name,
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
