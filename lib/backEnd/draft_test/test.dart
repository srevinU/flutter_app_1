import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/backEnd/repository/RepoPerson.dart';

void main() async {
  RepoPerson myObj = RepoPerson();
  var myData = await myObj.getRecords();
  inspect(myData);
  print(myData);
  print("test");
}