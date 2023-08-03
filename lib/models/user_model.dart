// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  String uid;
  String name;
  String avatar;
  int sex;
  int trendsCount;
  int attentionsCount;
  int fansCount;

  UserModel(
      {required this.uid,
      required this.name,
      required this.avatar,
      required this.sex,
      required this.trendsCount,
      required this.attentionsCount,
      required this.fansCount});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        avatar: json["avatar"],
        sex: json["sex"],
        trendsCount: json["trendsCount"],
        attentionsCount: json["attentionsCount"],
        fansCount: json["fansCount"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "avatar": avatar,
        "sex": sex,
        "trendsCount": trendsCount,
        "attentionsCount": attentionsCount,
        "fansCount": fansCount
      };

  @override
  // TODO: implement props
  List<Object?> get props => [uid, name, avatar, sex, trendsCount, attentionsCount, fansCount];
}
