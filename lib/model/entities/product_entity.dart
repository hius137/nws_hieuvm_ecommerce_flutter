class ProductEntity {
  ProductEntity({
      this.id, 
      this.title, 
      this.price, 
      this.description, 
      this.images,
      this.category,});

  ProductEntity.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  Category? category;
ProductEntity copyWith({  int? id,
  String? title,
  int? price,
  String? description,
  List<String>? images,
  String? creationAt,
  String? updatedAt,
  Category? category,
}) => ProductEntity(  id: id ?? this.id,
  title: title ?? this.title,
  price: price ?? this.price,
  description: description ?? this.description,
  images: images ?? this.images,
  category: category ?? this.category,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['images'] = images;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

class Category {
  Category({
      this.id, 
      this.name, 
      this.image,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
Category copyWith({  num? id,
  String? name,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => Category(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}