class Entity {
  String? sysUuid;
  Entity({this.sysUuid});

  Map<String, dynamic> toJson() => {"sysUuid": sysUuid};
}
