import 'package:flutter/material.dart';
import 'PeopleCard.dart';
import 'backEnd/entities/person.dart';
import 'backEnd/repository/RepoPerson.dart';

class PeopleCardList extends StatefulWidget {
  final String inputSearch;
  final Function addOnePeople;

  const PeopleCardList({
    Key? key,
    required this.inputSearch,
    required this.addOnePeople,
  }) : super(key: key);

  @override
  State<PeopleCardList> createState() => _PeopleCardList();
}

class _PeopleCardList extends State<PeopleCardList> {
  RepoPerson repoPerson = RepoPerson();

  Future<void> savePeopleData(Object record) async {
    List<Map<String, dynamic>> recordMapped =
        record as List<Map<String, dynamic>>;
    await repoPerson.updateRecord(recordMapped);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> delOnePeople(sysUuid) async {
    await repoPerson.deleteRecord(sysUuid);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repoPerson.getRecords(),
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
                if (item['u_name'].contains(widget.inputSearch)) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    key: ValueKey<String>(item['sys_uuid']),
                    onDismissed: (DismissDirection direction) {
                      delOnePeople(item['sys_uuid']);
                      items.removeAt(index);
                    },
                    background: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.red,
                      ),
                      padding: const EdgeInsets.only(right: 15),
                      margin: const EdgeInsets.only(bottom: 5),
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
                      savePeopleModified: savePeopleData,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
