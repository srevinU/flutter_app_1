import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/category.dart';

enum ActionForm { read, add, save }

class AppFormCategory extends StatefulWidget {
  final ActionForm actionForm;
  final Category record;
  final Object repositoryObject;

  const AppFormCategory(
      {Key? key,
      required this.actionForm,
      required this.record,
      required this.repositoryObject})
      : super(key: key);

  @override
  State<AppFormCategory> createState() => _AppFormCategoryState();
}

class _AppFormCategoryState extends State<AppFormCategory> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
