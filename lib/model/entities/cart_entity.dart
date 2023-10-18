class CartEntity {
  CartEntity({
    this.idUser,
    this.nameProduct,
    this.imageProduct,
    this.totalPrice,
    this.quantity,
  });

  CartEntity.fromJson(dynamic json) {
    idUser = json['idUser'];
    nameProduct = json['nameProduct'];
    imageProduct = json['imageProduct'];
    totalPrice = json['totalPrice'];
    quantity = json['quantity'];
  }

  int? idUser;
  String? nameProduct;
  String? imageProduct;
  int? totalPrice;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idUser'] = idUser;
    map['nameProduct'] = nameProduct;
    map['imageProduct'] = imageProduct;
    map['totalPrice'] = totalPrice;
    map['quantity'] = quantity;
    return map;
  }
}
