
class NotificationEntity {
  NotificationEntity({
    this.idUser,
    this.nameProduct,
    this.imageProduct,
    this.message,
    this.timeOrder,
  });

  NotificationEntity.fromJson(dynamic json) {
    idUser = json['idUser'];
    nameProduct = json['nameProduct'];
    imageProduct = json['imageProduct'];
    message = json['message'];
    timeOrder = json['timeOrder'];
  }

  int? idUser;
  String? nameProduct;
  String? imageProduct;
  String? message;
  String? timeOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idUser'] = idUser;
    map['nameProduct'] = nameProduct;
    map['imageProduct'] = imageProduct;
    map['message'] = message;
    map['timeOrder'] = timeOrder;
    return map;
  }
}