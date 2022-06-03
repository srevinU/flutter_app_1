import 'package:flutter_application_1/backEnd/Repository/Repository.dart';
import 'dart:ui';

class RepoPerson extends Repository {
  @override
  // ignore: overridden_fields
  String table = "t_person";

  //********************************************************* Data event *****\\
  // Nested in Repository parent
  // getRecords()
  // insertRecord()
  // updateRecord()
  // deleteRecord()
  //************************************************************ Queries *****\\
  // Nested in Repository parent
  // _getGetQuery()
  // getInsertQuery()
  // getUpdateQuery()
  //  getDeleteQuery()
  //****************************************************** Params&Values *****\\
  @override
  List<String> getParams() {
    return [
      "u_name",
      "u_birth_date",
      "u_phone",
      "u_email",
      "u_gender",
      "u_street_address",
      "u_country",
      "u_postal_code",
      "u_photo",
      "sys_type"
    ];
  }

  //************************************************************** Tests *****\\
  // Nested in Repository parent
  // runTest()
  @override
  List<Map<String, dynamic>> getRecordTest() {
    return [
      {
        "context": "https://schema.org",
        "sys_type": "Person",
        "u_street_address": "100 Main Street",
        "u_country": "America",
        "u_postal_code": "80840",
        "u_email": "info@example.com",
        "sys_image":
            "https://www.pinclipart.com/picdir/big/218-2189254_free-online-avatars-kid-characters-family-vector-for.png",
        "u_job_title": "Research Assistant",
        "u_name": "Jane Doe TEST**",
        "alumniOf": "Dartmouth",
        "u_birth_date": "1979-10-12",
        "u_gender": "female",
        "u_phone": "(123) 456-6789",
        "sys_url": "http://www.example.com",
        "u_photo": ""
      }
    ];
  }
}

Future<void> main() async {
  RepoPerson rep = RepoPerson();
  rep.runTest();
}
