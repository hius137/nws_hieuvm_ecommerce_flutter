import 'package:json_annotation/json_annotation.dart';

part 'token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  @JsonKey()
  String accessToken;
  @JsonKey()
  String refreshToken;

  TokenEntity({
    this.accessToken = '',
    this.refreshToken = '',
  });

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);


  // TokenEntity copyWith(
  //     {int? id,
  //       String? accessToken,
  //       String? refreshToken,
  //     }) =>
  //     TokenEntity(
  //       accessToken: accessToken ?? this.accessToken,
  //       refreshToken: refreshToken ?? this.refreshToken,
  //     );
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['accessToken'] = accessToken;
  //   map['refreshToken'] = refreshToken;
  //   return map;
  // }
  //
  // TokenEntity.fromJson(dynamic json) {
  //   accessToken = json['accessToken'];
  //   refreshToken = json['refreshToken'];
  // }
}
