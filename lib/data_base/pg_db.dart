import 'package:postgres/postgres.dart';
import '../common/printer.dart';

class PgDb extends PostgreSQLConnection {
  String myHost = "localhost";
  String myDatabaseName = "flutter_app_db";
  int myPort = 5432;
  String? userName = "postgres";
  String? passWord = "Akpg*";
  String timeZ = 'UTC';
  int timeoutInSec = 10000;
  int queryTimeoutInSec = 10000;
  bool useSsl = false;
  bool isUnixSockett = false;

  PgDb(
      {required myHost,
      required myPort,
      required myDatabaseName,
      required userName,
      required passWord,
      required timeZ,
      required timeoutInSec,
      required queryTimeoutInSec,
      required useSsl,
      required isUnixSockett})
      : super(myHost, myPort, myDatabaseName,
            username: userName,
            password: passWord,
            timeoutInSeconds: timeoutInSec,
            queryTimeoutInSeconds: queryTimeoutInSec,
            timeZone: timeZ,
            useSSL: useSsl,
            isUnixSocket: isUnixSockett);

  Future<PgDb> connect() async {
    try {
      var pg = await open();
      printSucess("DataBase Connected");
      return pg;
    } catch (err) {
      printError(err);
      rethrow;
    }
  }
}

Future<void> main() async {
  var myDb = PgDb();
  myDb.connect();
}




// Future<void> main() async {
//   PostgreSQLConnection myDbToTest = await PgDb().connect();
//   try {
//     List<Map<String, Map<String, dynamic>>> results =
//         await myDbToTest.mappedResultsQuery("SELECT * FROM person");
//     printSucess(results);
//   } catch (err) {
//     printError(err);
//   } finally {
//     myDbToTest.close();
//   }
// }