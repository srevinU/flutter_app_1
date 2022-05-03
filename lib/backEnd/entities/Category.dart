import 'package:flutter_application_1/backend/entities/Entity.dart';

class Category extends Entity {
  @override
  // ignore: overridden_fields
  String? sysUuid;
  String name;
  String? color;
  String? description;

  Category(
      {this.sysUuid, required this.name, required this.color, this.description})
      : super(sysUuid: sysUuid);

  @override
  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
        sysUuid: (parsedJson['sys_uuid'] ?? ""),
        name: (parsedJson['u_name'] ?? ""),
        color: (parsedJson['u_color'] ?? ""),
        description: (parsedJson['u_description'] ?? ""));
  }

  @override
  Map<String, dynamic> toJson() => {
        "sys_uuid": sysUuid,
        "u_name": name,
        "u_color": color,
        "u_description": description
      };
}
