import 'package:flutter_application_1/backEnd/Repository/repository.dart';

class RepoPerson extends Repository {
  @override
  // ignore: overridden_fields
  String table = "person";

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
      "u_birthDate",
      "u_phone",
      "u_email",
      "u_gender",
      "u_streetAddress",
      "u_country",
      "u_postalCode",
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
        "u_streetAddress": "100 Main Street",
        "u_country": "America",
        "u_postalCode": "80840",
        "u_email": "info@example.com",
        "image": "janedoe.jpg",
        "jobTitle": "Research Assistant",
        "u_name": "Jane Doe TEST**",
        "alumniOf": "Dartmouth",
        "birthPlace": "Philadelphia, PA",
        "u_birthDate": "1979-10-12",
        "height": "72 inches",
        "u_gender": "female",
        "memberOf": "Republican Party",
        "nationality": "Albanian",
        "u_phone": "(123) 456-6789",
        "url": "http://www.example.com",
      }
    ];
  }
}

Future<void> main() async {
  RepoPerson rep = RepoPerson();
  rep.runTest();
}
