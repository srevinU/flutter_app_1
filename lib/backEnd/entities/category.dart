import 'package:flutter_application_1/backend/entities/entity.dart';

class Category extends Entity {
  @override
  // ignore: overridden_fields
  String? sysUuid;
  String name;
  Map<String, String> color = {
    "blue": "blue",
    "red": "red",
    "purple": "purple",
    "white": "white"
  };
  String? description;

  Category({this.sysUuid, required this.name, this.description})
      : super(sysUuid: sysUuid);

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    Category result = Category(
        sysUuid: (parsedJson['sys_uuid'] ?? "") as String,
        name: (parsedJson['u_name'] ?? "") as String,
        description: (parsedJson['u_description'] ?? "") as String);
    return result;
  }
}
