import 'package:flutter/material.dart';
import 'package:flutter_application_1/backEnd/entities/entity.dart';
import 'package:flutter_application_1/backEnd/repository/Repository.dart';

enum ActionForm { read, add, save }

class appForm extends StatefulWidget {
  final ActionForm actionForm;
  final Object? record;
  final Object? repositoryObject;

  const appForm(
      {Key? key,
      required this.actionForm,
      required this.record,
      required this.repositoryObject})
      : super(key: key);

  @override
  State<appForm> createState() => _appFormState();
}

class _appFormState extends State<appForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
