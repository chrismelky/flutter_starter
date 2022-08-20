import 'dart:convert';

List<FacilityType> facilityTypeListFromJson(List<dynamic> data) =>
    List<FacilityType>.from(data.map((x) => FacilityType.fromJson(x)));

FacilityType facilityTypeFromJson(Map<String, dynamic> data) =>
    FacilityType.fromJson(data);

String facilityTypeToJson(FacilityType data) => json.encode(data.toJson());

class FacilityType {
  FacilityType({
    this.id,
    this.name,
    this.code,
  });

  int? id;
  String? name;
  String? code;

  factory FacilityType.fromJson(Map<String, dynamic> json) => FacilityType(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}
