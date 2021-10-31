import 'package:postgres/postgres.dart';
import '../common/printer.dart';

class PgDb extends PostgreSQLConnection {
  PgDb(
      {final String myHost = "localhost",
      final int myPort = 5432,
      final String myDatabaseName = "flutter_app_db",
      final String userName = "postgres",
      final String passWord = "",
      final String timeZ = 'UTC',
      final int timeoutInSec = 10000,
      final int queryTimeoutInSec = 10000,
      final bool useSsl = false,
      final bool isUnixSockett = false})
      : super(myHost, myPort, myDatabaseName,
            username: userName,
            password: passWord,
            timeoutInSeconds: timeoutInSec,
            queryTimeoutInSeconds: queryTimeoutInSec,
            timeZone: timeZ,
            useSSL: useSsl,
            isUnixSocket: isUnixSockett);
}

Future<void> main() async {
  var myDb = PgDb();
  try {
    await myDb.open();
    List<Map<String, Map<String, dynamic>>> results =
        await myDb.mappedResultsQuery("SELECT * FROM person");
    printSucess(results);
  } catch (err) {
    printError(err);
  } finally {
    myDb.close();
  }
}
