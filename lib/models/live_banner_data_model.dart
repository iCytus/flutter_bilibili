// To parse this JSON data, do
//
//     final liveBannerDataModel = liveBannerDataModelFromJson(jsonString);

import 'dart:convert';

LiveBannerDataModel liveBannerDataModelFromJson(String str) => LiveBannerDataModel.fromJson(json.decode(str));

String liveBannerDataModelToJson(LiveBannerDataModel data) => json.encode(data.toJson());

class LiveBannerDataModel {
  dynamic adTransparentContent;
  int areaId;
  int avId;
  int id;
  bool isAd;
  String link;
  int liveStatus;
  String location;
  int parentAreaId;
  String pic;
  int position;
  int roomId;
  bool showAdIcon;
  String title;
  int upId;
  int weight;

  LiveBannerDataModel({
    this.adTransparentContent,
    required this.areaId,
    required this.avId,
    required this.id,
    required this.isAd,
    required this.link,
    required this.liveStatus,
    required this.location,
    required this.parentAreaId,
    required this.pic,
    required this.position,
    required this.roomId,
    required this.showAdIcon,
    required this.title,
    required this.upId,
    required this.weight,
  });

  factory LiveBannerDataModel.fromJson(Map<String, dynamic> json) => LiveBannerDataModel(
    adTransparentContent: json["ad_transparent_content"],
    areaId: json["area_id"],
    avId: json["av_id"],
    id: json["id"],
    isAd: json["is_ad"],
    link: json["link"],
    liveStatus: json["live_status"],
    location: json["location"],
    parentAreaId: json["parent_area_id"],
    pic: json["pic"],
    position: json["position"],
    roomId: json["room_id"],
    showAdIcon: json["show_ad_icon"],
    title: json["title"],
    upId: json["up_id"],
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "ad_transparent_content": adTransparentContent,
    "area_id": areaId,
    "av_id": avId,
    "id": id,
    "is_ad": isAd,
    "link": link,
    "live_status": liveStatus,
    "location": location,
    "parent_area_id": parentAreaId,
    "pic": pic,
    "position": position,
    "room_id": roomId,
    "show_ad_icon": showAdIcon,
    "title": title,
    "up_id": upId,
    "weight": weight,
  };
}
