class WorkOrderServiceRegionModel {
  final List<ServiceRegion>? serviceRegion;

  WorkOrderServiceRegionModel({
    this.serviceRegion,
  });

  WorkOrderServiceRegionModel copyWith({
    List<ServiceRegion>? data,
  }) =>
      WorkOrderServiceRegionModel(
        serviceRegion: data ?? this.serviceRegion,
      );

  factory WorkOrderServiceRegionModel.fromJson(Map<String, dynamic> json) => WorkOrderServiceRegionModel(
        serviceRegion: json["data"] == null ? [] : List<ServiceRegion>.from(json["data"]!.map((x) => ServiceRegion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": serviceRegion == null ? [] : List<dynamic>.from(serviceRegion!.map((x) => x.toJson())),
      };
}

class ServiceRegion {
  final int? id;
  final String? name;
  final String? regionCode;
  final String? regionType;

  ServiceRegion({
    this.id,
    this.name,
    this.regionCode,
    this.regionType,
  });

  ServiceRegion copyWith({
    int? id,
    String? name,
    String? regionCode,
    String? regionType,
  }) =>
      ServiceRegion(
        id: id ?? this.id,
        name: name ?? this.name,
        regionCode: regionCode ?? this.regionCode,
        regionType: regionType ?? this.regionType,
      );

  factory ServiceRegion.fromJson(Map<String, dynamic> json) => ServiceRegion(
        id: json["id"],
        name: json["name"],
        regionCode: json["region_code"],
        regionType: json["region_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region_code": regionCode,
        "region_type": regionType,
      };
}
