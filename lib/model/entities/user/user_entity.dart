class UserEntity {
  UserEntity({
      this.email, 
      this.password, 
      this.name, 
      this.avatar, 
      this.role, 
      this.id, 
      this.creationAt, 
      this.updatedAt,});

  UserEntity.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['role'];
    id = json['id'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  String? email;
  String? password;
  String? name;
  String? avatar;
  String? role;
  int? id;
  String? creationAt;
  String? updatedAt;
UserEntity copyWith({  String? email,
  String? password,
  String? name,
  String? avatar,
  String? role,
  int? id,
  String? creationAt,
  String? updatedAt,
}) => UserEntity(  email: email ?? this.email,
  password: password ?? this.password,
  name: name ?? this.name,
  avatar: avatar ?? this.avatar,
  role: role ?? this.role,
  id: id ?? this.id,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['avatar'] = avatar;
    map['role'] = role;
    map['id'] = id;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}