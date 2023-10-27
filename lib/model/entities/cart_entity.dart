import 'dart:async';

class CartEntity {
  CartEntity({
    this.idUser,
    this.nameProduct,
    this.imageProduct,
    this.price,
    this.quantity,
    this.timeOrder,
  });

  CartEntity.fromJson(dynamic json) {
    idUser = json['idUser'];
    nameProduct = json['nameProduct'];
    imageProduct = json['imageProduct'];
    price = json['price'];
    quantity = json['quantity'];
    timeOrder = json['time'];
  }

  int? idUser;
  String? nameProduct;
  String? imageProduct;
  int? price;
  int? quantity;
  String? timeOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idUser'] = idUser;
    map['nameProduct'] = nameProduct;
    map['imageProduct'] = imageProduct;
    map['price'] = price;
    map['quantity'] = quantity;
    map['time'] = timeOrder;
    return map;
  }
}
