import '../repository/repo_person.dart';
import 'dart:math';
import 'package:random_date/random_date.dart';
import 'dart:io';

class RecordGenerator {
  void generatePerson(int numberOfPerson) {
    RepoPerson repoPerson = RepoPerson();
    List<Map<String, dynamic>> personToGenerate = List.generate(
        numberOfPerson, (int index) => _generateRandomJsonPerson());
    for (var person in personToGenerate) {
      repoPerson.insertRecord([person]);
    }
  }

  List<String> _generateImagesFileName() {
    List<String> result = [];
      Directory dir = Directory('/Users/cedric/dev/perso/flutter/flutter_app_1/assets/persons');
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
      "u_phone": _generateRamdomPhoneNumber(),
      "u_email": email,
      "u_gender": ["Male", "Female"][Random().nextInt(2)],
      "u_street_address": _generateRandomAddress(),
      "u_country": _generateRandomString(5),
      "u_postal_code": _generateRandomePostalCode(),
      "sys_type": "person",
      "u_photo": imagesFileName[Random().nextInt(imagesFileName.length)]
    };
  }

  String _generateRandomString(int len) {
    const _chars = 'abcdefghijklmnopqrstuvwxyz';
    return List.generate(
        len, (index) => _chars[Random().nextInt(_chars.length)]).join();
  }

  String _generateRamdomPhoneNumber() {
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

  String _generateRandomePostalCode() {
    return List.generate(5, (index) => Random().nextInt(9)).join();
  }

}

main(List<String> args) {
  RecordGenerator test = RecordGenerator();
  test.generatePerson(10);
}
