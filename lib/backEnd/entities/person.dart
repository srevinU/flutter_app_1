import 'package:flutter_application_1/backEnd/entities/entity.dart';

class Person extends Entity {
  @override
  // ignore: overridden_fields
  String? sysUuid;
  String name;
  String birthDate;
  String phone;
  String email;
  String gender;
  String streetAddress;
  String country;
  String postalCode;

  Person(
      {this.sysUuid,
      required this.name,
      required this.birthDate,
      required this.phone,
      required this.email,
      required this.gender,
      required this.streetAddress,
      required this.country,
      required this.postalCode})
      : super(sysUuid: sysUuid);

  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    Person result = Person(
      sysUuid: (parsedJson['sys_uuid'] ?? "") as String,
      name: (parsedJson['u_name'] ?? "") as String,
      phone: (parsedJson['u_phone'] ?? "") as String,
      email: (parsedJson['u_email'] ?? "") as String,
      gender: (parsedJson['u_gender'] ?? "") as String,
      streetAddress: (parsedJson['u_street_address'] ?? "") as String,
      country: (parsedJson['u_country'] ?? "") as String,
      postalCode: (parsedJson['u_postal_code'] ?? "") as String,
      birthDate: (parsedJson['u_birth_date'].toString()),
    );
    return result;
  }

  @override
  Map<String, dynamic> toJson() => {
        "sys_uuid": sysUuid,
        "u_name": name,
        "u_birth_date": birthDate,
        "u_phone": phone,
        "u_email": email,
        "u_gender": gender,
        "u_street_address": streetAddress,
        "u_country": country,
        "u_postal_code": postalCode,
        "sys_type": "person"
      };
}
