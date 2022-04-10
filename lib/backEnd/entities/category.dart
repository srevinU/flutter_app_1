import 'package:flutter_application_1/backend/entities/entity.dart';

class Category extends Entity {
  @override
  // ignore: overridden_fields
  String? sysUuid;
  String name;
  String ?color;
  String? description;

  Category({this.sysUuid, required this.name, required this.color, this.description})
      : super(sysUuid: sysUuid);

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    Category result = Category(
        sysUuid: (parsedJson['sys_uuid'] ?? "") as String,
        name: (parsedJson['u_name'] ?? "") as String,
        color: (parsedJson['u_color'] ?? "") as String,
        description: (parsedJson['u_description'] ?? "") as String);
    return result;
  }

  @override
  Map<String, dynamic> toJson() => {
    "sys_uuid": sysUuid,
    "u_name": name,
    "u_color": color,
    "u_description": description
  };


}
