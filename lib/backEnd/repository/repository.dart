import '../data_base/pg_db.dart';
import '../common/printer.dart';

class Repository {
  String table = "Repository";

  //********************************************************* Data event *****\\

  Future<List<Map<String, dynamic>>> getRecords() async {
    PgDb myDb = PgDb();
    try {
      await myDb.open();
      return await myDb.mappedResultsQuery(getGetQuery());
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

  String getGetQuery() {
    printError("Not Defined for $table");
    return "";
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

  void runTest() {
    printError("Not defined");
  }
}
