import 'dart:io';
import 'dart:math';

import '../repository/RepoPerson.dart';
import '../repository/RepoCatagory.dart';
import 'package:random_date/random_date.dart';

class RecordGenerator {
  void generatePerson(int numberOfPerson) {
    RepoPerson repoPerson = RepoPerson();
    List<Map<String, dynamic>> personToGenerate = List.generate(
        numberOfPerson, (int index) => _generateRandomJsonPerson());
    for (var person in personToGenerate) {
      repoPerson.insertRecord([person]);
    }
  }

  void generateCategory(int numberOfCategory) {
    RepoCategory repoCategory = RepoCategory();
    List<Map<String, dynamic>> categoryToGenerate = List.generate(
        numberOfCategory, (int index) => _generateRandomJsonCategory());
    for (var category in categoryToGenerate) {
      repoCategory.insertRecord([category]);
    }
  }

  List<String> _generateImagesFileName() {
    List<String> result = [];
    Directory dir = Directory('/Users/cedric/dev/perso/flutter/flutter_app_1');
    // /Users/cedric/dev/perso/flutter/flutter_app_1
    // /Users/cedricsegura/dev/perso/flutter_p/flutter_app_1/assets/persons
    List images = dir.listSync();
    for (var image in images) {
      result.add(image.path.split("/").last);
    }
    return result;
  }

  Map<String, dynamic> _generateRandomJsonPerson() {
    String name = _generateRandomString(Random().nextInt(10));
    String email = name + "@gmail.com";
    List<String> imagesFileName = _generateImagesFileName();
    print(imagesFileName.first);
    return {
      "u_name": name,
      "u_birth_date": RandomDate.withRange(1950, DateTime.now().year)
          .random()
          .toString()
          .substring(0, 10)
          .replaceAll('-', '/'),
      "u_phone": _generateRandomPhoneNumber(),
      "u_email": email,
      "u_gender": ["Male", "Female"][Random().nextInt(2)],
      "u_street_address": _generateRandomAddress(),
      "u_country": _generateRandomString(5),
      "u_postal_code": _generateRandomPostalCode(),
      "sys_type": "person",
      "u_photo": imagesFileName[Random().nextInt(imagesFileName.length)]
    };
  }

  Map<String, dynamic> _generateRandomJsonCategory() {
    String name = _generateRandomString(Random().nextInt(10));
    return {
      "u_name": name,
      "u_color": "No Color",
      "u_description": "Category for test"
    };
  }

  String _generateRandomString(int len) {
    const _chars = 'abcdefghijklmnopqrstuvwxyz';
    return List.generate(
        len, (index) => _chars[Random().nextInt(_chars.length)]).join();
  }

  String _generateRandomPhoneNumber() {
    return List.generate(
            5,
            (index) =>
                Random().nextInt(9).toString() + Random().nextInt(9).toString())
        .join(" ");
  }

  String _generateRandomAddress() {
    return Random().nextInt(100).toString() +
        " " +
        _generateRandomString(10) +
        " Street";
  }

  String _generateRandomPostalCode() {
    return List.generate(5, (index) => Random().nextInt(9)).join();
  }

  String _generateRandomColor() {
    List<String> colors = [
      "red",
      "blue",
      "green",
      "yellow",
      "purple",
      "orange"
    ];
    // return colors[];
    return List.generate(5, (index) => Random().nextInt(9)).join();
  }
}

main(List<String> args) {
  RecordGenerator test = RecordGenerator();
  // test.generatePerson(10);
  test.generateCategory(10);
}
