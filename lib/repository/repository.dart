import '../data_base/pg_db.dart';
import '../common/printer.dart';

class Repository {
  String table = "Repository";

  //*** Data base ***\\
  Future<PgDb?> connectDb() async {
    try {
      return PgDb();
    } catch (err) {
      printError(err);
    }
  }

  //*** Data event ****\\
  Future<void> getRecords() async {
    var myDb = PgDb();
    try {
      await myDb.open();
      List<Map<String, Map<String, dynamic>>> results =
          await myDb.mappedResultsQuery(getQuery("GET"));
      printSucess(results);
    } catch (err) {
      printError(err);
    } finally {
      myDb.close();
    }
  }

  Future<void> insertRecord(String record) async {
    var myDb = PgDb();
    try {
      await myDb.open();
      List<Map<String, Map<String, dynamic>>> results =
          await myDb.mappedResultsQuery(getQuery("INSERT", record));
      printSucess(results);
    } catch (err) {
      printError(err);
    } finally {
      myDb.close();
    }
  }

  void updateRecord(record) {}

  void deleteRecod(record) {}

  //*** Queries ****\\
  String getQuery(String type, [String? data]) {
    switch (type) {
      case "GET":
        return "SELECT * FROM " + table;

      case "INSERT":
        if (data != null) {
          return "INSERT INTO " +
              table +
              "(" +
              getParams().join(",") +
              ") " +
              "VALUES (" +
              data +
              ")";
        }
        printError("Argument missing, data");
        return "";

      case "UPDATE":
        return "UPDATE ";

      case "DELETE":
        return "DELETE";

      default:
        return "";
    }
  }

  //*** Params ****\\
  List<String> getParams() {
    return [];
  }
}
