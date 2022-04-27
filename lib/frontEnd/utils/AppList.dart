import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/category.dart';
import 'package:flutter_application_1/backEnd/entities/person.dart';
import 'package:flutter_application_1/frontEnd/utils/AppCardCategory.dart';
import 'package:flutter_application_1/frontEnd/utils/AppCardPerson.dart';

class AppList extends StatefulWidget {
  final Object entity;
  final Object repositoryObject;
  final String inputSearch;

  const AppList({
    Key? key,
    required this.entity,
    required this.repositoryObject,
    required this.inputSearch,
  }) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  late dynamic _currentEntity;
  late dynamic _currentRepository;

  @override
  Widget build(BuildContext context) {
    _currentEntity = widget.entity;
    _currentRepository = widget.repositoryObject;

    print("test ${_currentRepository.getRecords()}");
    return FutureBuilder(
      future: _currentRepository.getRecords(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data![index][_currentRepository.table];
                if (item['u_name'].contains(widget.inputSearch)) {
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
                    child: _currentRepository.table == "t_person"
                        ? AppCardPerson(
                            index: index,
                            record: Person.fromJson(item),
                            repositoryObject: _currentRepository,
                          )
                        : AppCardCategory(
                            index: index,
                            record: Category.fromJson(item),
                            repositoryObject: _currentRepository),
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
}
