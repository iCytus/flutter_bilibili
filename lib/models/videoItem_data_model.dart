// To parse this JSON data, do
//
//     final videoItemDataModel = videoItemDataModelFromJson(jsonString);

/*
* {
    "av_feature": null,
    "business_info": null,
    "bvid": "BV1VN411e7fx",
    "cid": 1204318572,
    "comic_detail_info": null,
    "duration": 762,
    "enable_vt": 0,
    "game_detail_info": null,
    "goto": "av",
    "id": 488717716,
    "is_followed": 0,
    "is_stock": 0,
    "ogv_info": null,
    "owner": {
        "face": "https://i1.hdslb.com/bfs/face/c1bd55cb5107fc644bd496ca6f92a575554c44af.jpg",
        "mid": 1968595,
        "name": "鹦鹉梨"
    },
    "pic": "http://i1.hdslb.com/bfs/archive/8c7efc87eeeb404272ed043f17be588726fca79f.jpg",
    "pos": 0,
    "pubdate": 1689915600,
    "rcmd_reason": null,
    "room_info": null,
    "show_info": 0,
    "stat": {
        "danmaku": 2577,
        "like": 55036,
        "view": 682967,
        "vt": 0
    },
    "title": "再不穿凉快点儿 我就正式确诊为烤肉了！平价国牌小丽专题测评 163cm53kg 连衣裙/包臀裙/春夏",
    "track_id": "",
    "uri": "https://www.bilibili.com/video/BV1VN411e7fx"
}
* */

import 'dart:convert';

VideoItemDataModel videoItemDataModelFromJson(String str) => VideoItemDataModel.fromJson(json.decode(str));

String videoItemDataModelToJson(VideoItemDataModel data) => json.encode(data.toJson());

class VideoItemDataModel {
  dynamic avFeature;
  dynamic businessInfo;
  String bvid;  // BV号
  int cid;
  dynamic comicDetailInfo;
  int duration;  // 视频时长 单位：秒
  int enableVt;
  dynamic gameDetailInfo;
  String goto;
  int id;
  int isFollowed;  // 是否关注
  int isStock;
  dynamic ogvInfo;
  Owner owner;  // up主的信息
  String pic;  // 封面
  int pos;
  int pubdate;  // 上传时间
  dynamic rcmdReason;
  dynamic roomInfo;
  int showInfo;
  Stat stat;  // 播放量，点赞，弹幕数，投票数
  String title;  // 标题
  String trackId;
  String uri;  // 视频地址

  VideoItemDataModel({
    this.avFeature,
    this.businessInfo,
    required this.bvid,
    required this.cid,
    this.comicDetailInfo,
    required this.duration,
    required this.enableVt,
    this.gameDetailInfo,
    required this.goto,
    required this.id,
    required this.isFollowed,
    required this.isStock,
    this.ogvInfo,
    required this.owner,
    required this.pic,
    required this.pos,
    required this.pubdate,
    this.rcmdReason,
    this.roomInfo,
    required this.showInfo,
    required this.stat,
    required this.title,
    required this.trackId,
    required this.uri,
  });

  factory VideoItemDataModel.fromJson(Map<String, dynamic> json) => VideoItemDataModel(
    avFeature: json["av_feature"],
    businessInfo: json["business_info"],
    bvid: json["bvid"],
    cid: json["cid"],
    comicDetailInfo: json["comic_detail_info"],
    duration: json["duration"],
    enableVt: json["enable_vt"],
    gameDetailInfo: json["game_detail_info"],
    goto: json["goto"],
    id: json["id"],
    isFollowed: json["is_followed"],
    isStock: json["is_stock"],
    ogvInfo: json["ogv_info"],
    owner: Owner.fromJson(json["owner"]),
    pic: json["pic"],
    pos: json["pos"],
    pubdate: json["pubdate"],
    rcmdReason: json["rcmd_reason"],
    roomInfo: json["room_info"],
    showInfo: json["show_info"],
    stat: Stat.fromJson(json["stat"]),
    title: json["title"],
    trackId: json["track_id"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "av_feature": avFeature,
    "business_info": businessInfo,
    "bvid": bvid,
    "cid": cid,
    "comic_detail_info": comicDetailInfo,
    "duration": duration,
    "enable_vt": enableVt,
    "game_detail_info": gameDetailInfo,
    "goto": goto,
    "id": id,
    "is_followed": isFollowed,
    "is_stock": isStock,
    "ogv_info": ogvInfo,
    "owner": owner.toJson(),
    "pic": pic,
    "pos": pos,
    "pubdate": pubdate,
    "rcmd_reason": rcmdReason,
    "room_info": roomInfo,
    "show_info": showInfo,
    "stat": stat.toJson(),
    "title": title,
    "track_id": trackId,
    "uri": uri,
  };
}

class Owner {
  String face;
  int mid;
  String name;

  Owner({
    required this.face,
    required this.mid,
    required this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    face: json["face"],
    mid: json["mid"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "face": face,
    "mid": mid,
    "name": name,
  };
}

class Stat {
  int danmaku;
  int like;
  int view;
  int vt;

  Stat({
    required this.danmaku,
    required this.like,
    required this.view,
    required this.vt,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    danmaku: json["danmaku"],
    like: json["like"],
    view: json["view"],
    vt: json["vt"],
  );

  Map<String, dynamic> toJson() => {
    "danmaku": danmaku,
    "like": like,
    "view": view,
    "vt": vt,
  };
}
