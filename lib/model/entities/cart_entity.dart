
class CartEntity {
  CartEntity({
    this.idUser,
    this.idProduct,
    this.nameProduct,
    this.imageProduct,
    this.price,
    this.quantity,
  });

  CartEntity.fromJson(dynamic json) {
    idUser = json['idUser'];
    idProduct = json['idProduct'];
    nameProduct = json['nameProduct'];
    imageProduct = json['imageProduct'];
    price = json['price'];
    quantity = json['quantity'];
  }

  int? idUser;
  int? idProduct;
  String? nameProduct;
  String? imageProduct;
  int? price;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idUser'] = idUser;
    map['idProduct'] = idProduct;
    map['nameProduct'] = nameProduct;
    map['imageProduct'] = imageProduct;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }
}
