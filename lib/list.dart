import 'package:flutter/material.dart';
import './backEnd/entities/person.dart';
import 'card.dart';

class PeopleCardList extends StatefulWidget {
  PeopleCardList(
      {Key? key, required this.getPeoples, required this.delOnePeople})
      : super(key: key);
  final Function getPeoples;
  Function delOnePeople;
  @override
  State<PeopleCardList> createState() => _PeopleCardList();
}

class _PeopleCardList extends State<PeopleCardList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.getPeoples(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Icon(Icons.error));
          } else if (snapshot.hasData) {
            final items = snapshot.data;
            return ListView.builder(
                itemCount: items?.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items![index]['person'];
                  return Dismissible(
                      key: ValueKey<String>(item['sys_uuid']),
                      onDismissed: (DismissDirection direction) {
                        widget.delOnePeople(item['sys_uuid']);
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
                          person: Person.fromJson(item), index: index));
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
