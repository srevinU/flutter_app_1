import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/Category.dart';
import 'package:flutter_application_1/backEnd/entities/Person.dart';
import 'package:flutter_application_1/frontEnd/utils/CardCategory.dart';
import 'package:flutter_application_1/frontEnd/utils/CardPerson.dart';

class ListGeneric extends StatefulWidget {
  final Object repositoryObject;
  final String inputSearch;

  const ListGeneric({
    Key? key,
    required this.repositoryObject,
    required this.inputSearch,
  }) : super(key: key);

  @override
  State<ListGeneric> createState() => _ListGenericState();
}

class _ListGenericState extends State<ListGeneric> {
  late dynamic _currentRepository;

  Future<void> savePeopleData(List<Map<String, dynamic>> record) async {
    await _currentRepository.updateRecord(record);
    if (mounted) {
      setState(() => {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _currentRepository = widget.repositoryObject;
    return FutureBuilder(
      future: _currentRepository.getRecords(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data![index][_currentRepository.table];
                if (item != null &&
                    item['u_name'].contains(widget.inputSearch)) {
                  return Dismissible(
                    key: ValueKey<String>(item['sys_uuid']),
                    direction: DismissDirection.endToStart,
                    onDismissed: (DismissDirection direction) {
                      _currentRepository.deleteRecord(item['sys_uuid']);
                      item.removeAt(index);
                    },
                    background: Container(
                      padding: const EdgeInsets.only(right: 15),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: Colors.red,
                      ),
                    ),
                    child: getCard(index, _currentRepository.table,
                        _currentRepository, item),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        } else if (snapshot.hasError) {
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getCard(int index, String tableName, Object repository,
      Map<String, dynamic> record) {
    switch (tableName) {
      case "t_person":
        return AppCardPerson(
            index: index,
            record: Person.fromJson(record),
            repositoryObject: _currentRepository,
            saveFunction: savePeopleData);

      case "t_category":
        return AppCardCategory(
            index: index,
            record: Category.fromJson(record),
            repositoryObject: _currentRepository,
            saveFunction: savePeopleData);

      default:
        return const SizedBox.shrink();
    }
  }
}
