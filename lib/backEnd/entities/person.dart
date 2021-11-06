import 'package:flutter_application_1/backEnd/entities/entity.dart';

class Person extends Entity {
  @override
  // ignore: overridden_fields
  String uuid;
  String name;
  String birthDate;
  String phone;
  String email;
  String gender;
  String streetAddress;
  String country;
  String postalCode;

  Person(
      {required this.uuid,
      required this.name,
      required this.birthDate,
      required this.phone,
      required this.email,
      required this.gender,
      required this.streetAddress,
      required this.country,
      required this.postalCode})
      : super(uuid: uuid);

  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    return Person(
        uuid: (parsedJson['sys_uuid'] ?? "") as String,
        name: (parsedJson['u_name'] ?? "") as String,
        birthDate: (parsedJson['u_birthDate'] ?? "") as String,
        phone: (parsedJson['u_phone'] ?? "") as String,
        email: (parsedJson['u_email'] ?? "") as String,
        gender: (parsedJson['u_gender'] ?? "") as String,
        streetAddress: (parsedJson['u_streetAddress'] ?? "") as String,
        country: (parsedJson['u_country'] ?? "") as String,
        postalCode: (parsedJson['u_postalCode'] ?? "") as String);
  }
}
