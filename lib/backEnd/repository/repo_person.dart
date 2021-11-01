import 'package:flutter_application_1/backEnd/Repository/repository.dart';
import 'package:flutter_application_1/backEnd/common/printer.dart';
import '../data/persons.dart';

class RepoPerson extends Repository {
  @override
  // ignore: overridden_fields
  String table = "person";

  //********************************************************* Data event *****\\
  // Nested in Repository parent
  //************************************************************ Queries *****\\
  @override
  String getGetQuery() {
    return "SELECT * FROM $table";
  }

  @override
  String getInsertQuery() {
    return "INSERT INTO $table (u_name, u_birthdate, u_phone, u_email, u_gender, u_streetaddress, u_country, u_postalCode, sys_type) VALUES (@u_name, @u_birthDate, @u_phone, @u_email, @u_gender, @u_streetAddress, @u_country, @u_postalCode, @type) RETURNING sys_uuid";
  }

  @override
  String getUpdateQuery() {
    return "UPDATE $table SET u_name=@u_name, u_birthdate=@u_birthDate, u_phone=@u_phone, u_email=@u_email, u_gender=@u_gender, u_streetaddress=@u_streetAddress, u_country=@u_country, u_postalCode=@u_postalCode, sys_type=@type WHERE sys_uuid=@sys_uuid RETURNING sys_uuid";
  }

  @override
  String getDeleteQuery() {
    return "DELETE FROM $table WHERE sys_uuid=@sys_uuid RETURNING sys_uuid";
  }

  //************************************************************ Params *****\\
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

  @override
  void runTest() async {
    List<Map<String, dynamic>> record = getPersonData();
    try {
      // GET
      await getRecords();
      printSucess("getRecords()");
      // INSERT
      var uuidReturned = await insertRecord(record);
      record[0]["sys_uuid"] = uuidReturned[0][0];
      record[0]["u_name"] = "From test";
      printSucess("insertRecord()");
      //UPDATE
      await updateRecord(record);
      printSucess("updateRecord()");
      // DELETE
      await deleteRecord(record);
      printSucess("deleteRecod()");
    } catch (err) {
      printError(err);
    }
  }
}

Future<void> main() async {
  RepoPerson rep = RepoPerson();
  rep.runTest();
}
