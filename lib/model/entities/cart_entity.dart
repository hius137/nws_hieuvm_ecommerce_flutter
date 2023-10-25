class CartEntity {
  CartEntity({
    this.idUser,
    this.nameProduct,
    this.imageProduct,
    this.price,
    this.quantity,
  });

  CartEntity.fromJson(dynamic json) {
    idUser = json['idUser'];
    nameProduct = json['nameProduct'];
    imageProduct = json['imageProduct'];
    price = json['price'];
    quantity = json['quantity'];
  }

  int? idUser;
  String? nameProduct;
  String? imageProduct;
  int? price;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idUser'] = idUser;
    map['nameProduct'] = nameProduct;
    map['imageProduct'] = imageProduct;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }
}
