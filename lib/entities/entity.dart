import '../data_base/pg_db.dart';

class Entity {
  String uuid;

  Entity({required this.uuid});

  //*** Data base ***\\

  connectDb() async {
    PgDb MyDb = PgDb();
    return MyDb.connect();
  }

  //*** Data ****\\
  String getSysUuid(record) {
    return uuid;
  }

  void getRecords() {}

  void insertRecord(record) {}

  void updateRecord(record) {}

  void deleteRecod(record) {}

  //*** Queries ****\\
  String getQuery(type) {
    switch (type) {
      case "add":
        return "Add query not defined";

      case "update":
        return "Update query not defined";

      case "delete":
        return "Delete query not defined";

      default:
        return "Query not found";
    }
  }

  //*** Params ****\\
  String getParams() {
    return "";
  }
}

void main() async {
  var Entity1 = Entity(uuid: "000000000");
  Entity1.connectDb();
}
