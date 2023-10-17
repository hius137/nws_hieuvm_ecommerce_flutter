class CategoriesEntity {
  CategoriesEntity(
      {this.id,
      this.name,
      this.image,
      this.totalProducts});

  CategoriesEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  int? id;
  String? name;
  String? image;
  int? totalProducts;

  CategoriesEntity copyWith(
          {int? id,
          String? name,
          String? image,
          int? totalProducts}) =>
      CategoriesEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        totalProducts: totalProducts ?? this.totalProducts,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
