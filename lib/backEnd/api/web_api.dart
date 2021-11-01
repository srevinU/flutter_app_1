import 'dart:convert';
import 'package:http/http.dart' as http;
import '../common/printer.dart';

class WebApi {
  // Valriable
  String httpAppPth;
  // Constructor
  WebApi(this.httpAppPth);

  Future<http.Response> get(String tableName) async {
    http.Response result;
    try {
      result = await http.get(Uri.parse(httpAppPth + tableName));
    } catch (err) {
      printError(err);
      rethrow;
    }
    return result;
  }
  /*
  Future<http.Response> post(tableName) async {
    final response;
    try {
      response = await http.post(Uri.parse(httpAppPth + tableName));
    } catch (err) {
      throw err;
    }
    return response;
  }

  Future<http.Response> put(tableName) async {
    final response;
    try {
      response = await http.put(Uri.parse(httpAppPth + tableName));
    } catch (err) {
      throw err;
    }
    return response;
  }

  Future<http.Response> delete(tableName) async {
    final response;
    try {
      response = await http.delete(Uri.parse(httpAppPth + tableName));
    } catch (err) {
      throw err;
    }
    return response;
  }
  */
}

Future<void> main() async {
  WebApi WebApiObj = WebApi(
      "http://localhost:8080/test"); // "https://jsonplaceholder.typicode.com/albums/1"
  http.Response data = await WebApiObj.get("");
  print(json.decode(data.body));
}
