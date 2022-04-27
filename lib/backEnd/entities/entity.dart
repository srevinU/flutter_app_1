class Entity {
  String? sysUuid;

  Entity({this.sysUuid});

  factory Entity.fromJson(Map<String, String> parsedJson) =>
      Entity(sysUuid: (parsedJson['sys_uuid'] ?? ""));

  Map<String, dynamic> toJson() => {"sysUuid": sysUuid};
}
