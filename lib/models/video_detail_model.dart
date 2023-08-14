// To parse this JSON data, do
//
//     final videoDetailModel = videoDetailModelFromJson(jsonString);

import 'dart:convert';

import 'custom_data_model.dart';

VideoDetailModel videoDetailModelFromJson(String str) => VideoDetailModel.fromJson(json.decode(str));

String videoDetailModelToJson(VideoDetailModel data) => json.encode(data.toJson());

class VideoDetailModel {
  int aid;
  String bvid;
  int cid;
  int copyright;
  int ctime;
  String desc;
  List<DescV2> descV2;
  Dimension dimension;
  bool disableShowUpInfo;
  int duration;
  String videoDetailModelDynamic;
  int enableVt;
  HonorReply honorReply;
  bool isChargeableSeason;
  bool isSeasonDisplay;
  bool isStory;
  bool isUpowerExclusive;
  bool isUpowerPlay;
  String likeIcon;
  int missionId;
  bool needJumpBv;
  bool noCache;
  Owner owner;
  List<Page> pages;
  String pic;
  dynamic premiere;
  int pubdate;
  Map<String, int> rights;
  int seasonId;
  Stat stat;
  int state;
  Subtitle subtitle;
  int teenageMode;
  int tid;
  String title;
  String tname;
  UgcSeason? ugcSeason;
  UserGarb userGarb;
  int videos;

  VideoDetailModel({
    required this.aid,
    required this.bvid,
    required this.cid,
    required this.copyright,
    required this.ctime,
    required this.desc,
    required this.descV2,
    required this.dimension,
    required this.disableShowUpInfo,
    required this.duration,
    required this.videoDetailModelDynamic,
    required this.enableVt,
    required this.honorReply,
    required this.isChargeableSeason,
    required this.isSeasonDisplay,
    required this.isStory,
    required this.isUpowerExclusive,
    required this.isUpowerPlay,
    required this.likeIcon,
    required this.missionId,
    required this.needJumpBv,
    required this.noCache,
    required this.owner,
    required this.pages,
    required this.pic,
    this.premiere,
    required this.pubdate,
    required this.rights,
    required this.seasonId,
    required this.stat,
    required this.state,
    required this.subtitle,
    required this.teenageMode,
    required this.tid,
    required this.title,
    required this.tname,
    required this.ugcSeason,
    required this.userGarb,
    required this.videos,
  });

  factory VideoDetailModel.fromJson(Map<String, dynamic> json) => VideoDetailModel(
    aid: json["aid"],
    bvid: json["bvid"],
    cid: json["cid"],
    copyright: json["copyright"],
    ctime: json["ctime"],
    desc: json["desc"],
    descV2: List<DescV2>.from(json["desc_v2"].map((x) => DescV2.fromJson(x))),
    dimension: Dimension.fromJson(json["dimension"]),
    disableShowUpInfo: json["disable_show_up_info"],
    duration: json["duration"],
    videoDetailModelDynamic: json["dynamic"],
    enableVt: json["enable_vt"],
    honorReply: HonorReply.fromJson(json["honor_reply"]),
    isChargeableSeason: json["is_chargeable_season"],
    isSeasonDisplay: json["is_season_display"],
    isStory: json["is_story"],
    isUpowerExclusive: json["is_upower_exclusive"],
    isUpowerPlay: json["is_upower_play"],
    likeIcon: json["like_icon"],
    missionId: json["mission_id"],
    needJumpBv: json["need_jump_bv"],
    noCache: json["no_cache"],
    owner: Owner.fromJson(json["owner"]),
    pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
    pic: json["pic"],
    premiere: json["premiere"],
    pubdate: json["pubdate"],
    rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
    seasonId: json["season_id"],
    stat: Stat.fromJson(json["stat"]),
    state: json["state"],
    subtitle: Subtitle.fromJson(json["subtitle"]),
    teenageMode: json["teenage_mode"],
    tid: json["tid"],
    title: json["title"],
    tname: json["tname"],
    ugcSeason: json["ugc_season"].keys.length > 0 ? UgcSeason.fromJson(json["ugc_season"]) : null,
    userGarb: UserGarb.fromJson(json["user_garb"]),
    videos: json["videos"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "bvid": bvid,
    "cid": cid,
    "copyright": copyright,
    "ctime": ctime,
    "desc": desc,
    "desc_v2": List<dynamic>.from(descV2.map((x) => x.toJson())),
    "dimension": dimension.toJson(),
    "disable_show_up_info": disableShowUpInfo,
    "duration": duration,
    "dynamic": videoDetailModelDynamic,
    "enable_vt": enableVt,
    "honor_reply": honorReply.toJson(),
    "is_chargeable_season": isChargeableSeason,
    "is_season_display": isSeasonDisplay,
    "is_story": isStory,
    "is_upower_exclusive": isUpowerExclusive,
    "is_upower_play": isUpowerPlay,
    "like_icon": likeIcon,
    "mission_id": missionId,
    "need_jump_bv": needJumpBv,
    "no_cache": noCache,
    "owner": owner.toJson(),
    "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
    "pic": pic,
    "premiere": premiere,
    "pubdate": pubdate,
    "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "season_id": seasonId,
    "stat": stat.toJson(),
    "state": state,
    "subtitle": subtitle.toJson(),
    "teenage_mode": teenageMode,
    "tid": tid,
    "title": title,
    "tname": tname,
    "user_garb": userGarb.toJson(),
    "videos": videos,
  };
}

class DescV2 {
  int bizId;
  String rawText;
  int type;

  DescV2({
    required this.bizId,
    required this.rawText,
    required this.type,
  });

  factory DescV2.fromJson(Map<String, dynamic> json) => DescV2(
    bizId: json["biz_id"],
    rawText: json["raw_text"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "biz_id": bizId,
    "raw_text": rawText,
    "type": type,
  };
}

class Dimension {
  int height;
  int rotate;
  int width;

  Dimension({
    required this.height,
    required this.rotate,
    required this.width,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
    height: json["height"],
    rotate: json["rotate"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "rotate": rotate,
    "width": width,
  };
}

class HonorReply {
  HonorReply();

  factory HonorReply.fromJson(Map<dynamic, dynamic> json) => HonorReply(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Page {
  int cid;
  Dimension dimension;
  int duration;
  String? firstFrame;
  String from;
  int page;
  String pagePart;
  String vid;
  String weblink;

  Page({
    required this.cid,
    required this.dimension,
    required this.duration,
    this.firstFrame,
    required this.from,
    required this.page,
    required this.pagePart,
    required this.vid,
    required this.weblink,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    cid: json["cid"],
    dimension: Dimension.fromJson(json["dimension"]),
    duration: json["duration"],
    firstFrame: json["first_frame"],
    from: json["from"],
    page: json["page"],
    pagePart: json["part"],
    vid: json["vid"],
    weblink: json["weblink"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "dimension": dimension.toJson(),
    "duration": duration,
    "first_frame": firstFrame,
    "from": from,
    "page": page,
    "part": pagePart,
    "vid": vid,
    "weblink": weblink,
  };
}

class Stat {
  int aid;
  String argueMsg;
  int coin;
  int danmaku;
  int dislike;
  String evaluation;
  int favorite;
  int hisRank;
  int like;
  int nowRank;
  int reply;
  int share;
  int view;
  int vt;

  Stat({
    required this.aid,
    required this.argueMsg,
    required this.coin,
    required this.danmaku,
    required this.dislike,
    required this.evaluation,
    required this.favorite,
    required this.hisRank,
    required this.like,
    required this.nowRank,
    required this.reply,
    required this.share,
    required this.view,
    required this.vt,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    aid: json["aid"],
    argueMsg: json["argue_msg"],
    coin: json["coin"],
    danmaku: json["danmaku"],
    dislike: json["dislike"],
    evaluation: json["evaluation"],
    favorite: json["favorite"] ?? json["fav"],
    hisRank: json["his_rank"],
    like: json["like"],
    nowRank: json["now_rank"],
    reply: json["reply"],
    share: json["share"],
    view: json["view"],
    vt: json["vt"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "argue_msg": argueMsg,
    "coin": coin,
    "danmaku": danmaku,
    "dislike": dislike,
    "evaluation": evaluation,
    "favorite": favorite,
    "his_rank": hisRank,
    "like": like,
    "now_rank": nowRank,
    "reply": reply,
    "share": share,
    "view": view,
    "vt": vt,
  };
}

class Subtitle {
  bool allowSubmit;
  List<dynamic> list;

  Subtitle({
    required this.allowSubmit,
    required this.list,
  });

  factory Subtitle.fromJson(Map<String, dynamic> json) => Subtitle(
    allowSubmit: json["allow_submit"],
    list: List<dynamic>.from(json["list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "allow_submit": allowSubmit,
    "list": List<dynamic>.from(list.map((x) => x)),
  };
}

class UgcSeason {
  int attribute;
  String cover;
  int enableVt;
  int epCount;
  int id;
  String intro;
  bool isPaySeason;
  int mid;
  int seasonType;
  List<Section> sections;
  int signState;
  Map<String, int> stat;
  String title;

  UgcSeason({
    required this.attribute,
    required this.cover,
    required this.enableVt,
    required this.epCount,
    required this.id,
    required this.intro,
    required this.isPaySeason,
    required this.mid,
    required this.seasonType,
    required this.sections,
    required this.signState,
    required this.stat,
    required this.title,
  });

  factory UgcSeason.fromJson(Map<String, dynamic> json) => UgcSeason(
    attribute: json["attribute"],
    cover: json["cover"],
    enableVt: json["enable_vt"],
    epCount: json["ep_count"],
    id: json["id"],
    intro: json["intro"],
    isPaySeason: json["is_pay_season"],
    mid: json["mid"],
    seasonType: json["season_type"],
    sections: List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    signState: json["sign_state"],
    stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "attribute": attribute,
    "cover": cover,
    "enable_vt": enableVt,
    "ep_count": epCount,
    "id": id,
    "intro": intro,
    "is_pay_season": isPaySeason,
    "mid": mid,
    "season_type": seasonType,
    "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
    "sign_state": signState,
    "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "title": title,
  };
}

class Section {
  List<Episode> episodes;
  int id;
  int seasonId;
  String title;
  int type;

  Section({
    required this.episodes,
    required this.id,
    required this.seasonId,
    required this.title,
    required this.type,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    id: json["id"],
    seasonId: json["season_id"],
    title: json["title"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
    "id": id,
    "season_id": seasonId,
    "title": title,
    "type": type,
  };
}

class Episode {
  int aid;
  Arc arc;
  int attribute;
  String bvid;
  int cid;
  int id;
  Page page;
  int seasonId;
  int sectionId;
  String title;

  Episode({
    required this.aid,
    required this.arc,
    required this.attribute,
    required this.bvid,
    required this.cid,
    required this.id,
    required this.page,
    required this.seasonId,
    required this.sectionId,
    required this.title,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    aid: json["aid"],
    arc: Arc.fromJson(json["arc"]),
    attribute: json["attribute"],
    bvid: json["bvid"],
    cid: json["cid"],
    id: json["id"],
    page: Page.fromJson(json["page"]),
    seasonId: json["season_id"],
    sectionId: json["section_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "arc": arc.toJson(),
    "attribute": attribute,
    "bvid": bvid,
    "cid": cid,
    "id": id,
    "page": page.toJson(),
    "season_id": seasonId,
    "section_id": sectionId,
    "title": title,
  };
}

class Arc {
  int aid;
  Owner author;
  int copyright;
  int ctime;
  String desc;
  dynamic descV2;
  Dimension dimension;
  int duration;
  String arcDynamic;
  int enableVt;
  bool isBlooper;
  bool isChargeableSeason;
  String pic;
  int pubdate;
  Map<String, int> rights;
  Stat stat;
  int state;
  String title;
  int typeId;
  String typeName;
  int videos;

  Arc({
    required this.aid,
    required this.author,
    required this.copyright,
    required this.ctime,
    required this.desc,
    this.descV2,
    required this.dimension,
    required this.duration,
    required this.arcDynamic,
    required this.enableVt,
    required this.isBlooper,
    required this.isChargeableSeason,
    required this.pic,
    required this.pubdate,
    required this.rights,
    required this.stat,
    required this.state,
    required this.title,
    required this.typeId,
    required this.typeName,
    required this.videos,
  });

  factory Arc.fromJson(Map<String, dynamic> json) => Arc(
    aid: json["aid"],
    author: Owner.fromJson(json["author"]),
    copyright: json["copyright"],
    ctime: json["ctime"],
    desc: json["desc"],
    descV2: json["desc_v2"],
    dimension: Dimension.fromJson(json["dimension"]),
    duration: json["duration"],
    arcDynamic: json["dynamic"],
    enableVt: json["enable_vt"],
    isBlooper: json["is_blooper"],
    isChargeableSeason: json["is_chargeable_season"],
    pic: json["pic"],
    pubdate: json["pubdate"],
    rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
    stat: Stat.fromJson(json["stat"]),
    state: json["state"],
    title: json["title"],
    typeId: json["type_id"],
    typeName: json["type_name"],
    videos: json["videos"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "author": author.toJson(),
    "copyright": copyright,
    "ctime": ctime,
    "desc": desc,
    "desc_v2": descV2,
    "dimension": dimension.toJson(),
    "duration": duration,
    "dynamic": arcDynamic,
    "enable_vt": enableVt,
    "is_blooper": isBlooper,
    "is_chargeable_season": isChargeableSeason,
    "pic": pic,
    "pubdate": pubdate,
    "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "stat": stat.toJson(),
    "state": state,
    "title": title,
    "type_id": typeId,
    "type_name": typeName,
    "videos": videos,
  };
}

class UserGarb {
  String urlImageAniCut;

  UserGarb({
    required this.urlImageAniCut,
  });

  factory UserGarb.fromJson(Map<String, dynamic> json) => UserGarb(
    urlImageAniCut: json["url_image_ani_cut"],
  );

  Map<String, dynamic> toJson() => {
    "url_image_ani_cut": urlImageAniCut,
  };
}
