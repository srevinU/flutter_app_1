import 'package:flutter_application_1/backEnd/common/printer.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PgDb extends PostgreSQLConnection {
  String myHost, myDatabaseName, userName, passWord, timeZ;
  int myPort, timeoutInSec, queryTimeoutInSec;
  bool useSsl, isUnixSockett;

  PgDb(
      {required this.myHost,
      required this.myPort,
      required this.myDatabaseName,
      required this.userName,
      required this.passWord,
      final this.timeZ = 'UTC',
      final this.timeoutInSec = 10000,
      final this.queryTimeoutInSec = 10000,
      final this.useSsl = false,
      final this.isUnixSockett = false})
      : super(myHost, myPort, myDatabaseName,
            username: userName /* ?? dotenv.env['USERNAME']!*/,
            password: passWord,
            timeoutInSeconds: timeoutInSec,
            queryTimeoutInSeconds: queryTimeoutInSec,
            timeZone: timeZ,
            useSSL: useSsl,
            isUnixSocket: isUnixSockett);

  static Future<PgDb> init() async {
    try {
      await dotenv.load(fileName: ".env");
      return PgDb(
          myHost: dotenv.env['HOST']!,
          userName: dotenv.env['USERNAME']!,
          myDatabaseName: dotenv.env['DATABASENAME']!,
          myPort: int.parse(dotenv.env['PORT']!),
          passWord: dotenv.env['PASSWORD']!);
    } catch (exp) {
      printError(exp);
      rethrow;
    }
  }
}
