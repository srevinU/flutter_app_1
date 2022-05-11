import '../dataBases/PgDb.dart';
import '../common/printer.dart';

class Repository {
  String table = "Repository";

  //********************************************************* Data event *****\\

  Future<List<Map<String, dynamic>>> getRecords() async {
    PgDb myDb = await PgDb.init();
    try {
      await myDb.open();
      return await myDb.mappedResultsQuery(_getGetQuery());
    } catch (err) {
      rethrow;
    } finally {
      myDb.close();
    }
  }

  dynamic insertRecord(List<Map<String, dynamic>> record) async {
    PgDb myDb = await PgDb.init();
    try {
      await myDb.open();
      return await myDb.query(getInsertQuery(),
          substitutionValues: record.first);
    } catch (err) {
      printError("From repo: $err");
      rethrow;
    } finally {
      myDb.close();
    }
  }

  dynamic updateRecord(List<Map<String, dynamic>>? record) async {
    PgDb myDb = await PgDb.init();
    try {
      await myDb.open();
      return await myDb.query(getUpdateQuery(), substitutionValues: record?[0]);
    } catch (err) {
      rethrow;
    } finally {
      myDb.close();
    }
  }

  dynamic deleteRecord(String sysUuid) async {
    PgDb myDb = await PgDb.init();
    try {
      await myDb.open();
      return await myDb
          .query(getDeleteQuery(), substitutionValues: {"sysUuid": sysUuid});
    } catch (err) {
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
    String params = getParams().join(",");
    String values = getParams().map((field) => "@$field").join(',');
    return "INSERT INTO $table ($params) VALUES ($values) RETURNING sys_uuid";
  }

  String getUpdateQuery() {
    String params = getParams().map((field) => field + '=@' + field).join(',');
    return "UPDATE $table SET $params WHERE sys_uuid=@sys_uuid RETURNING sys_uuid";
  }

  String getDeleteQuery() {
    return "DELETE FROM $table WHERE sys_uuid=@sysUuid RETURNING sys_uuid";
  }

  //************************************************************* Params *****\\

  List<String> getParams() {
    return [];
  }

  //************************************************************** Tests *****\\

  List<Map<String, dynamic>> getRecordTest() {
    return [
      {"sys_type": null}
    ];
  }

  void runTest() async {
    List<Map<String, dynamic>> record = getRecordTest();
    try {
      // GET
      var data = await getRecords();
      // print(inspect(data));
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
      deleteRecord(record[0]["sys_uuid"]);
      printSucess("deleteRecord()");
    } catch (err) {
      printError(err);
    }
  }
}
