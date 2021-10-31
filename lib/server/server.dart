import 'dart:io';
import 'package:http/http.dart';

import '../common/printer.dart';

Future main() async {
  HttpServer server;
  try {
    server = await HttpServer.bind('127.0.0.1', 8080);
    printSucess("Listening on Localhost: ${server.port}");
  } catch (err) {
    printError(err);
    exit(-1);
  }

  await for (var req in server) {
    print(req.uri.path);
  }
}
