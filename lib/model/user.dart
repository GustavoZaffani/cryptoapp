import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  const User({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  final String? id;
  final String? name;
  final String? email;

  @JsonKey(defaultValue: '')
  final String? password;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}