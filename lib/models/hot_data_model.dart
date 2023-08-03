// To parse this JSON data, do
//
//     final hotDataModel = hotDataModelFromJson(jsonString);

import 'dart:convert';

HotDataModel hotDataModelFromJson(String str) => HotDataModel.fromJson(json.decode(str));

String hotDataModelToJson(HotDataModel data) => json.encode(data.toJson());

class HotDataModel {
  int aid;
  int videos;
  int tid;
  String tname;
  int copyright;
  String pic;
  String title;
  int pubdate;
  int ctime;
  String desc;
  int state;
  int duration;
  int? missionId;
  Rights rights;
  Owner owner;
  Stat stat;
  String hotDataModelDynamic;
  int cid;
  Dimension dimension;
  String shortLinkV2;
  String firstFrame;
  String? pubLocation;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  int enableVt;
  RcmdReason rcmdReason;

  HotDataModel({
    required this.aid,
    required this.videos,
    required this.tid,
    required this.tname,
    required this.copyright,
    required this.pic,
    required this.title,
    required this.pubdate,
    required this.ctime,
    required this.desc,
    required this.state,
    required this.duration,
    this.missionId,
    required this.rights,
    required this.owner,
    required this.stat,
    required this.hotDataModelDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLinkV2,
    required this.firstFrame,
    this.pubLocation,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    this.ogvInfo,
    required this.enableVt,
    required this.rcmdReason,
  });

  factory HotDataModel.fromJson(Map<String, dynamic> json) => HotDataModel(
    aid: json["aid"],
    videos: json["videos"],
    tid: json["tid"],
    tname: json["tname"],
    copyright: json["copyright"],
    pic: json["pic"],
    title: json["title"],
    pubdate: json["pubdate"],
    ctime: json["ctime"],
    desc: json["desc"],
    state: json["state"],
    duration: json["duration"],
    missionId: json["mission_id"],
    rights: Rights.fromJson(json["rights"]),
    owner: Owner.fromJson(json["owner"]),
    stat: Stat.fromJson(json["stat"]),
    hotDataModelDynamic: json["dynamic"],
    cid: json["cid"],
    dimension: Dimension.fromJson(json["dimension"]),
    shortLinkV2: json["short_link_v2"],
    firstFrame: json["first_frame"],
    pubLocation: json["pub_location"],
    bvid: json["bvid"],
    seasonType: json["season_type"],
    isOgv: json["is_ogv"],
    ogvInfo: json["ogv_info"],
    enableVt: json["enable_vt"],
    rcmdReason: RcmdReason.fromJson(json["rcmd_reason"]),
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "videos": videos,
    "tid": tid,
    "tname": tname,
    "copyright": copyright,
    "pic": pic,
    "title": title,
    "pubdate": pubdate,
    "ctime": ctime,
    "desc": desc,
    "state": state,
    "duration": duration,
    "mission_id": missionId,
    "rights": rights.toJson(),
    "owner": owner.toJson(),
    "stat": stat.toJson(),
    "dynamic": hotDataModelDynamic,
    "cid": cid,
    "dimension": dimension.toJson(),
    "short_link_v2": shortLinkV2,
    "first_frame": firstFrame,
    "pub_location": pubLocation,
    "bvid": bvid,
    "season_type": seasonType,
    "is_ogv": isOgv,
    "ogv_info": ogvInfo,
    "enable_vt": enableVt,
    "rcmd_reason": rcmdReason.toJson(),
  };
}

class Dimension {
  int width;
  int height;
  int rotate;

  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
    width: json["width"],
    height: json["height"],
    rotate: json["rotate"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "rotate": rotate,
  };
}

class Owner {
  int mid;
  String name;
  String face;

  Owner({
    required this.mid,
    required this.name,
    required this.face,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    mid: json["mid"],
    name: json["name"],
    face: json["face"],
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "name": name,
    "face": face,
  };
}

class RcmdReason {
  String content;
  int cornerMark;

  RcmdReason({
    required this.content,
    required this.cornerMark,
  });

  factory RcmdReason.fromJson(Map<String, dynamic> json) => RcmdReason(
    content: json["content"],
    cornerMark: json["corner_mark"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "corner_mark": cornerMark,
  };
}

class Stat {
  int aid;
  int view;
  int danmaku;
  int reply;
  int favorite;
  int coin;
  int share;
  int nowRank;
  int hisRank;
  int like;
  int dislike;
  int vt;
  int vv;

  Stat({
    required this.aid,
    required this.view,
    required this.danmaku,
    required this.reply,
    required this.favorite,
    required this.coin,
    required this.share,
    required this.nowRank,
    required this.hisRank,
    required this.like,
    required this.dislike,
    required this.vt,
    required this.vv,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    aid: json["aid"],
    view: json["view"],
    danmaku: json["danmaku"],
    reply: json["reply"],
    favorite: json["favorite"],
    coin: json["coin"],
    share: json["share"],
    nowRank: json["now_rank"],
    hisRank: json["his_rank"],
    like: json["like"],
    dislike: json["dislike"],
    vt: json["vt"],
    vv: json["vv"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "view": view,
    "danmaku": danmaku,
    "reply": reply,
    "favorite": favorite,
    "coin": coin,
    "share": share,
    "now_rank": nowRank,
    "his_rank": hisRank,
    "like": like,
    "dislike": dislike,
    "vt": vt,
    "vv": vv,
  };
}

class Rights {
  int bp;
  int elec;
  int download;
  int movie;
  int pay;
  int hd5;
  int noReprint;
  int autoplay;
  int ugcPay;
  int isCooperation;
  int ugcPayPreview;
  int noBackground;
  int arcPay;
  int payFreeWatch;

  Rights({
    required this.bp,
    required this.elec,
    required this.download,
    required this.movie,
    required this.pay,
    required this.hd5,
    required this.noReprint,
    required this.autoplay,
    required this.ugcPay,
    required this.isCooperation,
    required this.ugcPayPreview,
    required this.noBackground,
    required this.arcPay,
    required this.payFreeWatch,
  });

  factory Rights.fromJson(Map<String, dynamic> json) => Rights(
    bp: json["bp"],
    elec: json["elec"],
    download: json["download"],
    movie: json["movie"],
    pay: json["pay"],
    hd5: json["hd5"],
    noReprint: json["no_reprint"],
    autoplay: json["autoplay"],
    ugcPay: json["ugc_pay"],
    isCooperation: json["is_cooperation"],
    ugcPayPreview: json["ugc_pay_preview"],
    noBackground: json["no_background"],
    arcPay: json["arc_pay"],
    payFreeWatch: json["pay_free_watch"],
  );

  Map<String, dynamic> toJson() => {
    "bp": bp,
    "elec": elec,
    "download": download,
    "movie": movie,
    "pay": pay,
    "hd5": hd5,
    "no_reprint": noReprint,
    "autoplay": autoplay,
    "ugc_pay": ugcPay,
    "is_cooperation": isCooperation,
    "ugc_pay_preview": ugcPayPreview,
    "no_background": noBackground,
    "arc_pay": arcPay,
    "pay_free_watch": payFreeWatch,
  };
}
