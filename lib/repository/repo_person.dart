import 'package:flutter_application_1/Repository/repository.dart';

class RepoPerson extends Repository {
  @override
  // ignore: overridden_fields
  String table = "person";

  @override
  void updateRecord(record) {}

  @override
  List<String> getParams() {
    return [
      "sys_context",
      "sys_type",
      "u_streetAddress",
      "u_country",
      "u_postalCode",
      "u_email",
      "sys_image",
      "u_jobTitle",
      "u_name",
      "u_birthPlace",
      "u_birthDate",
      "u_height",
      "u_gender",
      "u_nationality",
      "u_phone",
      "sys_url"
    ];
  }
}

Future<void> main() async {
  RepoPerson rep = RepoPerson();
  print(rep.getQuery("INSERT", "TEST"));
}
