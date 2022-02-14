import 'package:flutter_application_1/backEnd/entities/entity.dart';
import 'package:flutter_application_1/backend/common/printer.dart';

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
    printError("Issue from Person object");
    printWarning("parsedJson: ${parsedJson}");
    printWarning("Street address: ${parsedJson['u_birthDate']}");
    Person result = Person(
      sysUuid: (parsedJson['sys_uuid'] ?? "") as String,
      name: (parsedJson['u_name'] ?? "") as String,
      phone: (parsedJson['u_phone'] ?? "") as String,
      email: (parsedJson['u_email'] ?? "") as String,
      gender: (parsedJson['u_gender'] ?? "") as String,
      streetAddress: (parsedJson['u_streetAddress'] ?? "") as String,
      country: (parsedJson['u_country'] ?? "") as String,
      postalCode: (parsedJson['u_postalCode'] ?? "") as String,
      birthDate: (parsedJson['u_birthDate'] ?? "") as String,
    );
    return result;
  }

  @override
  Map<String, dynamic> toJson() => {
        "sys_uuid": sysUuid,
        "u_name": name,
        "u_birthDate": birthDate,
        "u_phone": phone,
        "u_email": email,
        "u_gender": gender,
        "u_streetAddress": streetAddress,
        "u_country": country,
        "u_postalCode": postalCode,
        "sys_type": "person"
      };
}
