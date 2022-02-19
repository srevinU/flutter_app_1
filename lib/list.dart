import 'package:flutter/material.dart';
import './backEnd/entities/person.dart';
import 'card.dart';

class PeopleCardList extends StatelessWidget {
  final Function getPeoples;
  final Function delOnePeople;
  final Function savePeople;
  const PeopleCardList(
      {Key? key,
      required this.getPeoples,
      required this.delOnePeople,
      required this.savePeople})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPeoples(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.error_sharp,
                    color: Colors.red,
                  ),
                  Text(
                    "\rPlease, try to connect later.",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            final items = snapshot.data;
            return ListView.builder(
                itemCount: items?.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items![index]['t_person'];
                  return Dismissible(
                    key: ValueKey<String>(item['sys_uuid']),
                    onDismissed: (DismissDirection direction) {
                      delOnePeople(item['sys_uuid']);
                      items.removeAt(index);
                    },
                    background: Container(
                      padding: const EdgeInsets.only(right: 15),
                      color: Colors.red,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: PeopleCard(
                      person: Person.fromJson(item),
                      index: index,
                      savePeopleModified: savePeople,
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
