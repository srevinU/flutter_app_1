import 'package:flutter_application_1/backEnd/Repository/repository.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';

class RepoPerson extends Repository {
  @override
  // ignore: overridden_fields
  String table = "person";

  //********************************************************* Data event *****\\
  // Nested in Repository parent
  //************************************************************ Queries *****\\

  @override
  String getInsertQuery() {
    String params = getParams().join(",");
    String values = getParams().map((element) {
      return "@$element";
    }).join(",");
    return "INSERT INTO $table ($params) VALUES ($values) RETURNING sys_uuid";
  }

  @override
  String getUpdateQuery() {
    return "UPDATE $table SET u_name=@u_name, u_birthdate=@u_birthDate, u_phone=@u_phone, u_email=@u_email, u_gender=@u_gender, u_streetaddress=@u_streetAddress, u_country=@u_country, u_postalCode=@u_postalCode, sys_type=@sys_type WHERE sys_uuid=@sys_uuid RETURNING sys_uuid";
  }

  @override
  String getDeleteQuery() {
    return "DELETE FROM $table WHERE sys_uuid=@sys_uuid RETURNING sys_uuid";
  }

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
        "u_name": "Jane Doe",
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
