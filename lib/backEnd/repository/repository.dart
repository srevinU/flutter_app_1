import '../data_base/pg_db.dart';
import '../common/printer.dart';

class Repository {
  String table = "Repository";

  //********************************************************* Data event *****\\

  Future<List<Map<String, dynamic>>> getRecords() async {
    PgDb myDb = PgDb();
    try {
      await myDb.open();
      return await myDb.mappedResultsQuery(_getGetQuery());
    } catch (err) {
      rethrow;
    } finally {
      myDb.close();
    }
  }

  dynamic insertRecord(List<Map<String, dynamic>>? record) async {
    PgDb myDb = PgDb();
    try {
      await myDb.open();
      return await myDb.query(getInsertQuery(),
          substitutionValues: record?.first);
    } catch (err) {
      // printError(err);
      rethrow;
    } finally {
      myDb.close();
    }
  }

  dynamic updateRecord(List<Map<String, dynamic>>? record) async {
    PgDb myDb = PgDb();
    try {
      await myDb.open();
      return await myDb.query(getUpdateQuery(), substitutionValues: record?[0]);
    } catch (err) {
      // printError(err);
      rethrow;
    } finally {
      myDb.close();
    }
  }

  dynamic deleteRecord(List<Map<String, dynamic>>? record) async {
    PgDb myDb = PgDb();
    try {
      await myDb.open();
      return await myDb.query(getDeleteQuery(),
          substitutionValues: record?.first);
    } catch (err) {
      // printError(err);
      rethrow;
    } finally {
      myDb.close();
    }
  }

  //************************************************************ Queries *****\\

  String _getGetQuery() {
    return "SELECT * FROM $table";
  }

  String getInsertQuery() {
    printError("Not Defined for $table");
    return "";
  }

  String getUpdateQuery() {
    printError("Not Defined for $table");
    return "";
  }

  String getDeleteQuery() {
    printError("Not Defined for $table");
    return "";
  }

  //************************************************************* Params *****\\

  List<String> getParams() {
    return [];
  }

//**************************************************************** Tests *****\\

  List<Map<String, dynamic>> getRecordTest() {
    return [
      {"sys_type": null}
    ];
  }

  @override
  void runTest() async {
    List<Map<String, dynamic>> record = getRecordTest();
    // print(record);
    try {
      // GET
      var data = await getRecords();
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
