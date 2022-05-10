import 'package:flutter_application_1/backend/entities/Entity.dart';

class Message extends Entity {
  @override
  // ignore: overridden_fields
  String? sysUuid;
  int code;
  String type;
  String description;

  Message(
      {this.sysUuid,
      required this.code,
      required this.type,
      required this.description})
      : super(sysUuid: sysUuid);

  @override
  factory Message.fromJson(Map<String, dynamic> parsedJson) {
    return Message(
        sysUuid: (parsedJson['sys_uuid'] ?? ""),
        code: (parsedJson['u_name'] ?? ""),
        type: (parsedJson['u_type'] ?? ""),
        description: (parsedJson['u_color'] ?? ""));
  }

  @override
  Map<String, dynamic> toJson() => {
        "sys_uuid": sysUuid,
        "u_code": code,
        "u_type": type,
        "u_description": description,
      };
}
