import 'dart:async';

class NotificationEntity {
  NotificationEntity({
    this.idUser,
    this.nameProduct,
    this.imageProduct,
    this.message,
    this.time,
  });

  NotificationEntity.fromJson(dynamic json) {
    idUser = json['idUser'];
    nameProduct = json['nameProduct'];
    imageProduct = json['imageProduct'];
    message = json['message'];
    time = json['time'];
  }

  int? idUser;
  String? nameProduct;
  String? imageProduct;
  String? message;
  Timer? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idUser'] = idUser;
    map['nameProduct'] = nameProduct;
    map['imageProduct'] = imageProduct;
    map['message'] = message;
    map['time'] = time;
    return map;
  }
}