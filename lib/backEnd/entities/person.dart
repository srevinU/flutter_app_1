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
        uuid: parsedJson['sys_uuid'],
        name: parsedJson['u_name'],
        birthDate: parsedJson['u_birthDate'],
        phone: parsedJson['u_phone'],
        email: parsedJson['u_email'],
        gender: parsedJson['u_gender'],
        streetAddress: parsedJson['u_streetAddress'],
        country: parsedJson['u_country'],
        postalCode: parsedJson['u_postalCode']);
  }
}
