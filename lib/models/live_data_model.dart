// To parse this JSON data, do
//
//     final liveDataModel = liveDataModelFromJson(jsonString);

import 'dart:convert';

LiveDataModel liveDataModelFromJson(String str) => LiveDataModel.fromJson(json.decode(str));

String liveDataModelToJson(LiveDataModel data) => json.encode(data.toJson());

class LiveDataModel {
  int areaId;
  String areaName;
  int areaV2Id;
  String areaV2Name;
  int areaV2ParentId;
  String areaV2ParentName;
  String clickCallback;
  String cover;
  String face;
  int flag;
  int groupId;
  dynamic headBox;
  int headBoxType;
  int isAutoPlay;
  int isNft;
  String link;
  String nftDmark;
  int online;
  int parentId;
  String parentName;
  PendantInfo? pendantInfo;
  int pkId;
  int roomid;
  String sessionId;
  String showCallback;
  String showCover;
  String systemCover;
  String title;
  int uid;
  String uname;
  String userCover;
  int userCoverFlag;
  Verify verify;
  WatchedShow watchedShow;
  String webPendent;

  LiveDataModel({
    required this.areaId,
    required this.areaName,
    required this.areaV2Id,
    required this.areaV2Name,
    required this.areaV2ParentId,
    required this.areaV2ParentName,
    required this.clickCallback,
    required this.cover,
    required this.face,
    required this.flag,
    required this.groupId,
    this.headBox,
    required this.headBoxType,
    required this.isAutoPlay,
    required this.isNft,
    required this.link,
    required this.nftDmark,
    required this.online,
    required this.parentId,
    required this.parentName,
    this.pendantInfo,
    required this.pkId,
    required this.roomid,
    required this.sessionId,
    required this.showCallback,
    required this.showCover,
    required this.systemCover,
    required this.title,
    required this.uid,
    required this.uname,
    required this.userCover,
    required this.userCoverFlag,
    required this.verify,
    required this.watchedShow,
    required this.webPendent,
  });

  factory LiveDataModel.fromJson(Map<String, dynamic> json) => LiveDataModel(
    areaId: json["area_id"],
    areaName: json["area_name"],
    areaV2Id: json["area_v2_id"],
    areaV2Name: json["area_v2_name"],
    areaV2ParentId: json["area_v2_parent_id"],
    areaV2ParentName: json["area_v2_parent_name"],
    clickCallback: json["click_callback"],
    cover: json["cover"],
    face: json["face"],
    flag: json["flag"],
    groupId: json["group_id"],
    headBox: json["head_box"],
    headBoxType: json["head_box_type"],
    isAutoPlay: json["is_auto_play"],
    isNft: json["is_nft"],
    link: json["link"],
    nftDmark: json["nft_dmark"],
    online: json["online"],
    parentId: json["parent_id"],
    parentName: json["parent_name"],
    pendantInfo: json["pendant_info"].keys.length != 0 ? PendantInfo.fromJson(json["pendant_info"].values.first) : null,
    pkId: json["pk_id"],
    roomid: json["roomid"],
    sessionId: json["session_id"],
    showCallback: json["show_callback"],
    showCover: json["show_cover"],
    systemCover: json["system_cover"],
    title: json["title"],
    uid: json["uid"],
    uname: json["uname"],
    userCover: json["user_cover"],
    userCoverFlag: json["user_cover_flag"],
    verify: Verify.fromJson(json["verify"]),
    watchedShow: WatchedShow.fromJson(json["watched_show"]),
    webPendent: json["web_pendent"],
  );

  Map<String, dynamic> toJson() => {
    "area_id": areaId,
    "area_name": areaName,
    "area_v2_id": areaV2Id,
    "area_v2_name": areaV2Name,
    "area_v2_parent_id": areaV2ParentId,
    "area_v2_parent_name": areaV2ParentName,
    "click_callback": clickCallback,
    "cover": cover,
    "face": face,
    "flag": flag,
    "group_id": groupId,
    "head_box": headBox,
    "head_box_type": headBoxType,
    "is_auto_play": isAutoPlay,
    "is_nft": isNft,
    "link": link,
    "nft_dmark": nftDmark,
    "online": online,
    "parent_id": parentId,
    "parent_name": parentName,
    "pendant_info": pendantInfo?.toJson(),
    "pk_id": pkId,
    "roomid": roomid,
    "session_id": sessionId,
    "show_callback": showCallback,
    "show_cover": showCover,
    "system_cover": systemCover,
    "title": title,
    "uid": uid,
    "uname": uname,
    "user_cover": userCover,
    "user_cover_flag": userCoverFlag,
    "verify": verify.toJson(),
    "watched_show": watchedShow.toJson(),
    "web_pendent": webPendent,
  };
}

class PendantInfo {
  String color;
  String content;
  String name;
  int pendentId;
  String pic;
  int position;
  String type;

  PendantInfo({
    required this.color,
    required this.content,
    required this.name,
    required this.pendentId,
    required this.pic,
    required this.position,
    required this.type,
  });

  factory PendantInfo.fromJson(Map<String, dynamic> json) => PendantInfo(
    color: json["color"],
    content: json["content"],
    name: json["name"],
    pendentId: json["pendent_id"],
    pic: json["pic"],
    position: json["position"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "content": content,
    "name": name,
    "pendent_id": pendentId,
    "pic": pic,
    "position": position,
    "type": type,
  };
}

class Verify {
  String desc;
  int role;
  int type;

  Verify({
    required this.desc,
    required this.role,
    required this.type,
  });

  factory Verify.fromJson(Map<String, dynamic> json) => Verify(
    desc: json["desc"],
    role: json["role"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "desc": desc,
    "role": role,
    "type": type,
  };
}

class WatchedShow {
  String icon;
  int iconLocation;
  String iconWeb;
  int num;
  bool watchedShowSwitch;
  String textLarge;
  String textSmall;

  WatchedShow({
    required this.icon,
    required this.iconLocation,
    required this.iconWeb,
    required this.num,
    required this.watchedShowSwitch,
    required this.textLarge,
    required this.textSmall,
  });

  factory WatchedShow.fromJson(Map<String, dynamic> json) => WatchedShow(
    icon: json["icon"],
    iconLocation: json["icon_location"],
    iconWeb: json["icon_web"],
    num: json["num"],
    watchedShowSwitch: json["switch"],
    textLarge: json["text_large"],
    textSmall: json["text_small"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "icon_location": iconLocation,
    "icon_web": iconWeb,
    "num": num,
    "switch": watchedShowSwitch,
    "text_large": textLarge,
    "text_small": textSmall,
  };
}
