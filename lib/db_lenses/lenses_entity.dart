import 'dart:typed_data';

class LensesEntity {
  int id;
  DateTime createdTime;
  Uint8List leftImage;
  Uint8List rightImage;
  int type;
  String colorStr;
  String degree;
  String diameter;
  int isOpen;

  LensesEntity({
    required this.id,
    required this.createdTime,
    required this.leftImage,
    required this.rightImage,
    required this.type,
    required this.colorStr,
    required this.degree,
    required this.diameter,
    required this.isOpen,
  });

  factory LensesEntity.fromJson(Map<String, dynamic> json) {
    return LensesEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      leftImage: json['leftImage'],
      rightImage: json['rightImage'],
      type: json['type'],
      colorStr: json['colorStr'],
      degree: json['degree'],
      diameter: json['diameter'],
      isOpen: json['isOpen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'leftImage': leftImage,
      'rightImage': rightImage,
      'type': type,
      'colorStr': colorStr,
      'degree': degree,
      'diameter': diameter,
      'isOpen': isOpen,
    };
  }
}