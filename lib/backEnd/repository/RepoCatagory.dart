import 'package:flutter_application_1/backEnd/entities/category.dart';
import 'package:flutter_application_1/backEnd/Repository/Repository.dart';

class RepoCategory extends Repository {
  @override
  // ignore: overridden_fields
  String table = "t_category";

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
    return ["u_name", "u_color", "u_description"];
  }

  //************************************************************** Tests *****\\
  // Nested in Repository parent
  // runTest()
  @override
  List<Map<String, dynamic>> getRecordTest() {
    return [
      {
        "u_name": "Category test",
        "u_color": "Blue",
        "u_description": "This is a category unit test"
      }
    ];
  }
}

Future<void> main() async {
  RepoCategory rep = RepoCategory();
  rep.runTest();
}
