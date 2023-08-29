// To parse this JSON data, do
//
//     final commentDetailModel = commentDetailModelFromJson(jsonString);

import 'dart:convert';

CommentDetailModel commentDetailModelFromJson(String str) => CommentDetailModel.fromJson(json.decode(str));

String commentDetailModelToJson(CommentDetailModel data) => json.encode(data.toJson());

class CommentDetailModel {
  int action;
  int assist;
  int attr;
  Content content;
  int count;
  int ctime;
  int dialog;
  String dynamicIdStr;
  int fansgrade;
  Folder folder;
  bool invisible;
  int like;
  CommentDetailModelMember member;
  int mid;
  int oid;
  int parent;
  String parentStr;
  int rcount;
  List<Reply>? replies;
  CommentDetailModelReplyControl replyControl;
  int root;
  String rootStr;
  int rpid;
  String rpidStr;
  int state;
  int type;
  UpAction upAction;

  CommentDetailModel({
    required this.action,
    required this.assist,
    required this.attr,
    required this.content,
    required this.count,
    required this.ctime,
    required this.dialog,
    required this.dynamicIdStr,
    required this.fansgrade,
    required this.folder,
    required this.invisible,
    required this.like,
    required this.member,
    required this.mid,
    required this.oid,
    required this.parent,
    required this.parentStr,
    required this.rcount,
    this.replies,
    required this.replyControl,
    required this.root,
    required this.rootStr,
    required this.rpid,
    required this.rpidStr,
    required this.state,
    required this.type,
    required this.upAction,
  });

  factory CommentDetailModel.fromJson(Map<String, dynamic> json) => CommentDetailModel(
    action: json["action"],
    assist: json["assist"],
    attr: json["attr"],
    content: Content.fromJson(json["content"]),
    count: json["count"],
    ctime: json["ctime"],
    dialog: json["dialog"],
    dynamicIdStr: json["dynamic_id_str"],
    fansgrade: json["fansgrade"],
    folder: Folder.fromJson(json["folder"]),
    invisible: json["invisible"],
    like: json["like"],
    member: CommentDetailModelMember.fromJson(json["member"]),
    mid: json["mid"],
    oid: json["oid"],
    parent: json["parent"],
    parentStr: json["parent_str"],
    rcount: json["rcount"],
    replies: json["replies"] != null ? List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))) : null,
    replyControl: CommentDetailModelReplyControl.fromJson(json["reply_control"]),
    root: json["root"],
    rootStr: json["root_str"],
    rpid: json["rpid"],
    rpidStr: json["rpid_str"],
    state: json["state"],
    type: json["type"],
    upAction: UpAction.fromJson(json["up_action"]),
  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "assist": assist,
    "attr": attr,
    "content": content.toJson(),
    "count": count,
    "ctime": ctime,
    "dialog": dialog,
    "dynamic_id_str": dynamicIdStr,
    "fansgrade": fansgrade,
    "folder": folder.toJson(),
    "invisible": invisible,
    "like": like,
    "member": member.toJson(),
    "mid": mid,
    "oid": oid,
    "parent": parent,
    "parent_str": parentStr,
    "rcount": rcount,
    "replies": replies != null ? List<dynamic>.from(replies!.map((x) => x.toJson())) : null,
    "reply_control": replyControl.toJson(),
    "root": root,
    "root_str": rootStr,
    "rpid": rpid,
    "rpid_str": rpidStr,
    "state": state,
    "type": type,
    "up_action": upAction.toJson(),
  };
}

class Content {
  Map<String, int>? atNameToMid;
  int maxLine;
  List<MemberElement> members;
  String message;
  Emote? emote;

  Content({
    this.atNameToMid,
    required this.maxLine,
    required this.members,
    required this.message,
    this.emote,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    atNameToMid: json["at_name_to_mid"],
    maxLine: json["max_line"],
    members: List<MemberElement>.from(json["members"].map((x) => MemberElement.fromJson(x))),
    message: json["message"],
    emote: json["emote"] == null ? null : Emote.fromJson(json["emote"]),
  );

  Map<String, dynamic> toJson() => {
    "max_line": maxLine,
    "members": List<dynamic>.from(members.map((x) => x)),
    "message": message,
    "emote": emote?.toJson(),
  };
}

class Emote {
  Doge? doge;

  Emote({
    this.doge,
  });

  factory Emote.fromJson(Map<String, dynamic> json) => Emote(
    doge: json["[doge]"] != null ? Doge.fromJson(json["[doge]"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "[doge]": doge?.toJson(),
  };
}

class Doge {
  int attr;
  int id;
  String jumpTitle;
  Meta meta;
  int mtime;
  int packageId;
  int state;
  String text;
  int type;
  String url;

  Doge({
    required this.attr,
    required this.id,
    required this.jumpTitle,
    required this.meta,
    required this.mtime,
    required this.packageId,
    required this.state,
    required this.text,
    required this.type,
    required this.url,
  });

  factory Doge.fromJson(Map<String, dynamic> json) => Doge(
    attr: json["attr"],
    id: json["id"],
    jumpTitle: json["jump_title"],
    meta: Meta.fromJson(json["meta"]),
    mtime: json["mtime"],
    packageId: json["package_id"],
    state: json["state"],
    text: json["text"],
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "attr": attr,
    "id": id,
    "jump_title": jumpTitle,
    "meta": meta.toJson(),
    "mtime": mtime,
    "package_id": packageId,
    "state": state,
    "text": text,
    "type": type,
    "url": url,
  };
}

class Meta {
  int size;

  Meta({
    required this.size,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
  };
}

class Folder {
  bool hasFolded;
  bool isFolded;
  String rule;

  Folder({
    required this.hasFolded,
    required this.isFolded,
    required this.rule,
  });

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
    hasFolded: json["has_folded"],
    isFolded: json["is_folded"],
    rule: json["rule"],
  );

  Map<String, dynamic> toJson() => {
    "has_folded": hasFolded,
    "is_folded": isFolded,
    "rule": rule,
  };
}

class CommentDetailModelMember {
  String avatar;
  PurpleAvatarItem avatarItem;
  String contractDesc;
  int faceNftNew;
  dynamic fansDetail;
  bool isContractor;
  int isSeniorMember;
  LevelInfo levelInfo;
  String mid;
  Nameplate nameplate;
  dynamic nftInteraction;
  OfficialVerify officialVerify;
  Pendant pendant;
  String rank;
  Senior? senior;
  String sex;
  String sign;
  String uname;
  UserSailing userSailing;
  Vip vip;

  CommentDetailModelMember({
    required this.avatar,
    required this.avatarItem,
    required this.contractDesc,
    required this.faceNftNew,
    required this.fansDetail,
    required this.isContractor,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.mid,
    required this.nameplate,
    required this.nftInteraction,
    required this.officialVerify,
    required this.pendant,
    required this.rank,
    this.senior,
    required this.sex,
    required this.sign,
    required this.uname,
    required this.userSailing,
    required this.vip,
  });

  factory CommentDetailModelMember.fromJson(Map<String, dynamic> json) => CommentDetailModelMember(
    avatar: json["avatar"],
    avatarItem: PurpleAvatarItem.fromJson(json["avatar_item"]),
    contractDesc: json["contract_desc"],
    faceNftNew: json["face_nft_new"],
    fansDetail: json["fans_detail"],
    isContractor: json["is_contractor"],
    isSeniorMember: json["is_senior_member"],
    levelInfo: LevelInfo.fromJson(json["level_info"]),
    mid: json["mid"],
    nameplate: Nameplate.fromJson(json["nameplate"]),
    nftInteraction: json["nft_interaction"],
    officialVerify: OfficialVerify.fromJson(json["official_verify"]),
    pendant: Pendant.fromJson(json["pendant"]),
    rank: json["rank"],
    senior: json["senior"].keys.length>0 ? Senior.fromJson(json["senior"]) : null,
    sex: json["sex"],
    sign: json["sign"],
    uname: json["uname"],
    userSailing: UserSailing.fromJson(json["user_sailing"]),
    vip: Vip.fromJson(json["vip"]),
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "avatar_item": avatarItem.toJson(),
    "contract_desc": contractDesc,
    "face_nft_new": faceNftNew,
    "fans_detail": fansDetail,
    "is_contractor": isContractor,
    "is_senior_member": isSeniorMember,
    "level_info": levelInfo.toJson(),
    "mid": mid,
    "nameplate": nameplate.toJson(),
    "nft_interaction": nftInteraction,
    "official_verify": officialVerify.toJson(),
    "pendant": pendant.toJson(),
    "rank": rank,
    "senior": senior?.toJson(),
    "sex": sex,
    "sign": sign,
    "uname": uname,
    "user_sailing": userSailing.toJson(),
    "vip": vip.toJson(),
  };
}

class Senior {
  int status;

  Senior({
    required this.status,
  });

  factory Senior.fromJson(Map<String, dynamic> json) => Senior(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}

class PurpleAvatarItem {
  ContainerSize containerSize;
  PurpleFallbackLayers fallbackLayers;
  String mid;

  PurpleAvatarItem({
    required this.containerSize,
    required this.fallbackLayers,
    required this.mid,
  });

  factory PurpleAvatarItem.fromJson(Map<String, dynamic> json) => PurpleAvatarItem(
    containerSize: ContainerSize.fromJson(json["container_size"]),
    fallbackLayers: PurpleFallbackLayers.fromJson(json["fallback_layers"]),
    mid: json["mid"],
  );

  Map<String, dynamic> toJson() => {
    "container_size": containerSize.toJson(),
    "fallback_layers": fallbackLayers.toJson(),
    "mid": mid,
  };
}

class ContainerSize {
  double height;
  double width;

  ContainerSize({
    required this.height,
    required this.width,
  });

  factory ContainerSize.fromJson(Map<String, dynamic> json) => ContainerSize(
    height: json["height"]?.toDouble(),
    width: json["width"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
  };
}

class PurpleFallbackLayers {
  bool isCriticalGroup;
  List<PurpleLayer> layers;

  PurpleFallbackLayers({
    required this.isCriticalGroup,
    required this.layers,
  });

  factory PurpleFallbackLayers.fromJson(Map<String, dynamic> json) => PurpleFallbackLayers(
    isCriticalGroup: json["is_critical_group"],
    layers: List<PurpleLayer>.from(json["layers"].map((x) => PurpleLayer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_critical_group": isCriticalGroup,
    "layers": List<dynamic>.from(layers.map((x) => x.toJson())),
  };
}

class PurpleLayer {
  GeneralSpec generalSpec;
  PurpleLayerConfig layerConfig;
  Resource resource;
  bool visible;

  PurpleLayer({
    required this.generalSpec,
    required this.layerConfig,
    required this.resource,
    required this.visible,
  });

  factory PurpleLayer.fromJson(Map<String, dynamic> json) => PurpleLayer(
    generalSpec: GeneralSpec.fromJson(json["general_spec"]),
    layerConfig: PurpleLayerConfig.fromJson(json["layer_config"]),
    resource: Resource.fromJson(json["resource"]),
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "general_spec": generalSpec.toJson(),
    "layer_config": layerConfig.toJson(),
    "resource": resource.toJson(),
    "visible": visible,
  };
}

class GeneralSpec {
  PosSpec posSpec;
  RenderSpec renderSpec;
  ContainerSize sizeSpec;

  GeneralSpec({
    required this.posSpec,
    required this.renderSpec,
    required this.sizeSpec,
  });

  factory GeneralSpec.fromJson(Map<String, dynamic> json) => GeneralSpec(
    posSpec: PosSpec.fromJson(json["pos_spec"]),
    renderSpec: RenderSpec.fromJson(json["render_spec"]),
    sizeSpec: ContainerSize.fromJson(json["size_spec"]),
  );

  Map<String, dynamic> toJson() => {
    "pos_spec": posSpec.toJson(),
    "render_spec": renderSpec.toJson(),
    "size_spec": sizeSpec.toJson(),
  };
}

class PosSpec {
  double axisX;
  double axisY;
  int coordinatePos;

  PosSpec({
    required this.axisX,
    required this.axisY,
    required this.coordinatePos,
  });

  factory PosSpec.fromJson(Map<String, dynamic> json) => PosSpec(
    axisX: json["axis_x"]?.toDouble(),
    axisY: json["axis_y"]?.toDouble(),
    coordinatePos: json["coordinate_pos"],
  );

  Map<String, dynamic> toJson() => {
    "axis_x": axisX,
    "axis_y": axisY,
    "coordinate_pos": coordinatePos,
  };
}

class RenderSpec {
  int opacity;

  RenderSpec({
    required this.opacity,
  });

  factory RenderSpec.fromJson(Map<String, dynamic> json) => RenderSpec(
    opacity: json["opacity"],
  );

  Map<String, dynamic> toJson() => {
    "opacity": opacity,
  };
}

class PurpleLayerConfig {
  bool? isCritical;
  LayerMask? layerMask;


  PurpleLayerConfig({
    this.isCritical,
    this.layerMask,

  });

  factory PurpleLayerConfig.fromJson(Map<String, dynamic> json) => PurpleLayerConfig(
    isCritical: json["is_critical"],
    layerMask: json["layer_mask"] == null ? null : LayerMask.fromJson(json["layer_mask"]),
  );

  Map<String, dynamic> toJson() => {
    "is_critical": isCritical,
    "layer_mask": layerMask?.toJson(),
  };
}

class LayerMask {
  GeneralSpec generalSpec;
  MaskSrc maskSrc;

  LayerMask({
    required this.generalSpec,
    required this.maskSrc,
  });

  factory LayerMask.fromJson(Map<String, dynamic> json) => LayerMask(
    generalSpec: GeneralSpec.fromJson(json["general_spec"]),
    maskSrc: MaskSrc.fromJson(json["mask_src"]),
  );

  Map<String, dynamic> toJson() => {
    "general_spec": generalSpec.toJson(),
    "mask_src": maskSrc.toJson(),
  };
}

class MaskSrc {
  MaskSrcDraw draw;
  int srcType;

  MaskSrc({
    required this.draw,
    required this.srcType,
  });

  factory MaskSrc.fromJson(Map<String, dynamic> json) => MaskSrc(
    draw: MaskSrcDraw.fromJson(json["draw"]),
    srcType: json["src_type"],
  );

  Map<String, dynamic> toJson() => {
    "draw": draw.toJson(),
    "src_type": srcType,
  };
}

class MaskSrcDraw {
  PurpleColorConfig colorConfig;
  int drawType;
  int fillMode;

  MaskSrcDraw({
    required this.colorConfig,
    required this.drawType,
    required this.fillMode,
  });

  factory MaskSrcDraw.fromJson(Map<String, dynamic> json) => MaskSrcDraw(
    colorConfig: PurpleColorConfig.fromJson(json["color_config"]),
    drawType: json["draw_type"],
    fillMode: json["fill_mode"],
  );

  Map<String, dynamic> toJson() => {
    "color_config": colorConfig.toJson(),
    "draw_type": drawType,
    "fill_mode": fillMode,
  };
}

class PurpleColorConfig {
  Day day;

  PurpleColorConfig({
    required this.day,
  });

  factory PurpleColorConfig.fromJson(Map<String, dynamic> json) => PurpleColorConfig(
    day: Day.fromJson(json["day"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day.toJson(),
  };
}


class Day {
  String argb;

  Day({
    required this.argb,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    argb: json["argb"],
  );

  Map<String, dynamic> toJson() => {
    "argb": argb,
  };
}


class Resource {
  ResImage? resImage;
  int resType;
  ResNativeDraw? resNativeDraw;

  Resource({
    this.resImage,
    required this.resType,
    this.resNativeDraw,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    resImage: json["res_image"] == null ? null : ResImage.fromJson(json["res_image"]),
    resType: json["res_type"],
    resNativeDraw: json["res_native_draw"] == null ? null : ResNativeDraw.fromJson(json["res_native_draw"]),
  );

  Map<String, dynamic> toJson() => {
    "res_image": resImage?.toJson(),
    "res_type": resType,
    "res_native_draw": resNativeDraw?.toJson(),
  };
}

class ResImage {
  ImageSrc imageSrc;

  ResImage({
    required this.imageSrc,
  });

  factory ResImage.fromJson(Map<String, dynamic> json) => ResImage(
    imageSrc: ImageSrc.fromJson(json["image_src"]),
  );

  Map<String, dynamic> toJson() => {
    "image_src": imageSrc.toJson(),
  };
}

class ImageSrc {
  int? placeholder;
  Remote? remote;
  int srcType;
  int? local;

  ImageSrc({
    this.placeholder,
    this.remote,
    required this.srcType,
    this.local,
  });

  factory ImageSrc.fromJson(Map<String, dynamic> json) => ImageSrc(
    placeholder: json["placeholder"],
    remote: json["remote"] == null ? null : Remote.fromJson(json["remote"]),
    srcType: json["src_type"],
    local: json["local"],
  );

  Map<String, dynamic> toJson() => {
    "placeholder": placeholder,
    "remote": remote?.toJson(),
    "src_type": srcType,
    "local": local,
  };
}

class Remote {
  String bfsStyle;
  String url;

  Remote({
    required this.bfsStyle,
    required this.url,
  });

  factory Remote.fromJson(Map<String, dynamic> json) => Remote(
    bfsStyle: json["bfs_style"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "bfs_style": bfsStyle,
    "url": url,
  };
}

class ResNativeDraw {
  DrawSrc drawSrc;

  ResNativeDraw({
    required this.drawSrc,
  });

  factory ResNativeDraw.fromJson(Map<String, dynamic> json) => ResNativeDraw(
    drawSrc: DrawSrc.fromJson(json["draw_src"]),
  );

  Map<String, dynamic> toJson() => {
    "draw_src": drawSrc.toJson(),
  };
}

class DrawSrc {
  DrawSrcDraw draw;
  int srcType;

  DrawSrc({
    required this.draw,
    required this.srcType,
  });

  factory DrawSrc.fromJson(Map<String, dynamic> json) => DrawSrc(
    draw: DrawSrcDraw.fromJson(json["draw"]),
    srcType: json["src_type"],
  );

  Map<String, dynamic> toJson() => {
    "draw": draw.toJson(),
    "src_type": srcType,
  };
}

class DrawSrcDraw {
  FluffyColorConfig colorConfig;
  int drawType;
  int fillMode;

  DrawSrcDraw({
    required this.colorConfig,
    required this.drawType,
    required this.fillMode,
  });

  factory DrawSrcDraw.fromJson(Map<String, dynamic> json) => DrawSrcDraw(
    colorConfig: FluffyColorConfig.fromJson(json["color_config"]),
    drawType: json["draw_type"],
    fillMode: json["fill_mode"],
  );

  Map<String, dynamic> toJson() => {
    "color_config": colorConfig.toJson(),
    "draw_type": drawType,
    "fill_mode": fillMode,
  };
}

class FluffyColorConfig {
  Day day;
  bool isDarkModeAware;
  Day night;

  FluffyColorConfig({
    required this.day,
    required this.isDarkModeAware,
    required this.night,
  });

  factory FluffyColorConfig.fromJson(Map<String, dynamic> json) => FluffyColorConfig(
    day: Day.fromJson(json["day"]),
    isDarkModeAware: json["is_dark_mode_aware"],
    night: Day.fromJson(json["night"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day.toJson(),
    "is_dark_mode_aware": isDarkModeAware,
    "night": night.toJson(),
  };
}

class LevelInfo {
  int currentExp;
  int currentLevel;
  int currentMin;
  int nextExp;

  LevelInfo({
    required this.currentExp,
    required this.currentLevel,
    required this.currentMin,
    required this.nextExp,
  });

  factory LevelInfo.fromJson(Map<String, dynamic> json) => LevelInfo(
    currentExp: json["current_exp"],
    currentLevel: json["current_level"],
    currentMin: json["current_min"],
    nextExp: json["next_exp"],
  );

  Map<String, dynamic> toJson() => {
    "current_exp": currentExp,
    "current_level": currentLevel,
    "current_min": currentMin,
    "next_exp": nextExp,
  };
}

class Nameplate {
  String condition;
  String image;
  String imageSmall;
  String level;
  String name;
  int nid;

  Nameplate({
    required this.condition,
    required this.image,
    required this.imageSmall,
    required this.level,
    required this.name,
    required this.nid,
  });

  factory Nameplate.fromJson(Map<String, dynamic> json) => Nameplate(
    condition: json["condition"],
    image: json["image"],
    imageSmall: json["image_small"],
    level: json["level"],
    name: json["name"],
    nid: json["nid"],
  );

  Map<String, dynamic> toJson() => {
    "condition": condition,
    "image": image,
    "image_small": imageSmall,
    "level": level,
    "name": name,
    "nid": nid,
  };
}

class OfficialVerify {
  String desc;
  int type;

  OfficialVerify({
    required this.desc,
    required this.type,
  });

  factory OfficialVerify.fromJson(Map<String, dynamic> json) => OfficialVerify(
    desc: json["desc"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "desc": desc,
    "type": type,
  };
}

class Pendant {
  int expire;
  String image;
  String imageEnhance;
  String imageEnhanceFrame;
  String name;
  int pid;

  Pendant({
    required this.expire,
    required this.image,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
    required this.name,
    required this.pid,
  });

  factory Pendant.fromJson(Map<String, dynamic> json) => Pendant(
    expire: json["expire"],
    image: json["image"],
    imageEnhance: json["image_enhance"],
    imageEnhanceFrame: json["image_enhance_frame"],
    name: json["name"],
    pid: json["pid"],
  );

  Map<String, dynamic> toJson() => {
    "expire": expire,
    "image": image,
    "image_enhance": imageEnhance,
    "image_enhance_frame": imageEnhanceFrame,
    "name": name,
    "pid": pid,
  };
}

class UserSailing {
  Cardbg? cardbg;
  dynamic cardbgWithFocus;
  dynamic pendant;

  UserSailing({
    this.cardbg,
    required this.cardbgWithFocus,
    required this.pendant,
  });

  factory UserSailing.fromJson(Map<String, dynamic> json) => UserSailing(
    cardbg: json["cardbg"] != null ? Cardbg.fromJson(json["cardbg"]) :null,
    cardbgWithFocus: json["cardbg_with_focus"],
    pendant: json["pendant"],
  );

  Map<String, dynamic> toJson() => {
    "cardbg": cardbg?.toJson(),
    "cardbg_with_focus": cardbgWithFocus,
    "pendant": pendant,
  };
}

class Cardbg {
  Fan fan;
  int id;
  String image;
  String jumpUrl;
  String name;
  String type;

  Cardbg({
    required this.fan,
    required this.id,
    required this.image,
    required this.jumpUrl,
    required this.name,
    required this.type,
  });

  factory Cardbg.fromJson(Map<String, dynamic> json) => Cardbg(
    fan: Fan.fromJson(json["fan"]),
    id: json["id"],
    image: json["image"],
    jumpUrl: json["jump_url"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "fan": fan.toJson(),
    "id": id,
    "image": image,
    "jump_url": jumpUrl,
    "name": name,
    "type": type,
  };
}

class Fan {
  String color;
  int isFan;
  String name;
  String numDesc;
  int number;

  Fan({
    required this.color,
    required this.isFan,
    required this.name,
    required this.numDesc,
    required this.number,
  });

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
    color: json["color"],
    isFan: json["is_fan"],
    name: json["name"],
    numDesc: json["num_desc"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "is_fan": isFan,
    "name": name,
    "num_desc": numDesc,
    "number": number,
  };
}

class Vip {
  int accessStatus;
  int avatarSubscript;
  String dueRemark;
  Label label;
  String nicknameColor;
  int themeType;
  int vipDueDate;
  int vipStatus;
  String vipStatusWarn;
  int vipType;

  Vip({
    required this.accessStatus,
    required this.avatarSubscript,
    required this.dueRemark,
    required this.label,
    required this.nicknameColor,
    required this.themeType,
    required this.vipDueDate,
    required this.vipStatus,
    required this.vipStatusWarn,
    required this.vipType,
  });

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
    accessStatus: json["accessStatus"],
    avatarSubscript: json["avatar_subscript"],
    dueRemark: json["dueRemark"],
    label: Label.fromJson(json["label"]),
    nicknameColor: json["nickname_color"],
    themeType: json["themeType"],
    vipDueDate: json["vipDueDate"],
    vipStatus: json["vipStatus"],
    vipStatusWarn: json["vipStatusWarn"],
    vipType: json["vipType"],
  );

  Map<String, dynamic> toJson() => {
    "accessStatus": accessStatus,
    "avatar_subscript": avatarSubscript,
    "dueRemark": dueRemark,
    "label": label.toJson(),
    "nickname_color": nicknameColor,
    "themeType": themeType,
    "vipDueDate": vipDueDate,
    "vipStatus": vipStatus,
    "vipStatusWarn": vipStatusWarn,
    "vipType": vipType,
  };
}

class Label {
  String bgColor;
  int bgStyle;
  String borderColor;
  String imgLabelUriHans;
  String imgLabelUriHansStatic;
  String imgLabelUriHant;
  String imgLabelUriHantStatic;
  String labelTheme;
  String path;
  String text;
  String textColor;
  bool useImgLabel;

  Label({
    required this.bgColor,
    required this.bgStyle,
    required this.borderColor,
    required this.imgLabelUriHans,
    required this.imgLabelUriHansStatic,
    required this.imgLabelUriHant,
    required this.imgLabelUriHantStatic,
    required this.labelTheme,
    required this.path,
    required this.text,
    required this.textColor,
    required this.useImgLabel,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
    bgColor: json["bg_color"],
    bgStyle: json["bg_style"],
    borderColor: json["border_color"],
    imgLabelUriHans: json["img_label_uri_hans"],
    imgLabelUriHansStatic: json["img_label_uri_hans_static"],
    imgLabelUriHant: json["img_label_uri_hant"],
    imgLabelUriHantStatic: json["img_label_uri_hant_static"],
    labelTheme: json["label_theme"],
    path: json["path"],
    text: json["text"],
    textColor: json["text_color"],
    useImgLabel: json["use_img_label"],
  );

  Map<String, dynamic> toJson() => {
    "bg_color": bgColor,
    "bg_style": bgStyle,
    "border_color": borderColor,
    "img_label_uri_hans": imgLabelUriHans,
    "img_label_uri_hans_static": imgLabelUriHansStatic,
    "img_label_uri_hant": imgLabelUriHant,
    "img_label_uri_hant_static": imgLabelUriHantStatic,
    "label_theme": labelTheme,
    "path": path,
    "text": text,
    "text_color": textColor,
    "use_img_label": useImgLabel,
  };
}



class Reply {
  int action;
  int assist;
  int attr;
  Content content;
  int count;
  int ctime;
  int dialog;
  String dynamicIdStr;
  int fansgrade;
  Folder folder;
  bool invisible;
  int like;
  ReplyMember member;
  int mid;
  int oid;
  int parent;
  String parentStr;
  int rcount;
  dynamic replies;
  ReplyReplyControl replyControl;
  int root;
  String rootStr;
  int rpid;
  String rpidStr;
  int state;
  int type;
  UpAction upAction;

  Reply({
    required this.action,
    required this.assist,
    required this.attr,
    required this.content,
    required this.count,
    required this.ctime,
    required this.dialog,
    required this.dynamicIdStr,
    required this.fansgrade,
    required this.folder,
    required this.invisible,
    required this.like,
    required this.member,
    required this.mid,
    required this.oid,
    required this.parent,
    required this.parentStr,
    required this.rcount,
    required this.replies,
    required this.replyControl,
    required this.root,
    required this.rootStr,
    required this.rpid,
    required this.rpidStr,
    required this.state,
    required this.type,
    required this.upAction,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
    action: json["action"],
    assist: json["assist"],
    attr: json["attr"],
    content: Content.fromJson(json["content"]),
    count: json["count"],
    ctime: json["ctime"],
    dialog: json["dialog"],
    dynamicIdStr: json["dynamic_id_str"],
    fansgrade: json["fansgrade"],
    folder: Folder.fromJson(json["folder"]),
    invisible: json["invisible"],
    like: json["like"],
    member: ReplyMember.fromJson(json["member"]),
    mid: json["mid"],
    oid: json["oid"],
    parent: json["parent"],
    parentStr: json["parent_str"],
    rcount: json["rcount"],
    replies: json["replies"],
    replyControl: ReplyReplyControl.fromJson(json["reply_control"]),
    root: json["root"],
    rootStr: json["root_str"],
    rpid: json["rpid"],
    rpidStr: json["rpid_str"],
    state: json["state"],
    type: json["type"],
    upAction: UpAction.fromJson(json["up_action"]),
  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "assist": assist,
    "attr": attr,
    "content": content.toJson(),
    "count": count,
    "ctime": ctime,
    "dialog": dialog,
    "dynamic_id_str": dynamicIdStr,
    "fansgrade": fansgrade,
    "folder": folder.toJson(),
    "invisible": invisible,
    "like": like,
    "member": member.toJson(),
    "mid": mid,
    "oid": oid,
    "parent": parent,
    "parent_str": parentStr,
    "rcount": rcount,
    "replies": replies,
    "reply_control": replyControl.toJson(),
    "root": root,
    "root_str": rootStr,
    "rpid": rpid,
    "rpid_str": rpidStr,
    "state": state,
    "type": type,
    "up_action": upAction.toJson(),
  };
}

class ReplyMember {
  String avatar;
  FluffyAvatarItem avatarItem;
  String contractDesc;
  int faceNftNew;
  dynamic fansDetail;
  bool isContractor;
  int isSeniorMember;
  LevelInfo levelInfo;
  String mid;
  Nameplate nameplate;
  dynamic nftInteraction;
  OfficialVerify officialVerify;
  Pendant pendant;
  String rank;
  Senior? senior;
  String sex;
  String sign;
  String uname;
  dynamic userSailing;
  Vip vip;

  ReplyMember({
    required this.avatar,
    required this.avatarItem,
    required this.contractDesc,
    required this.faceNftNew,
    required this.fansDetail,
    required this.isContractor,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.mid,
    required this.nameplate,
    required this.nftInteraction,
    required this.officialVerify,
    required this.pendant,
    required this.rank,
    this.senior,
    required this.sex,
    required this.sign,
    required this.uname,
    required this.userSailing,
    required this.vip,
  });

  factory ReplyMember.fromJson(Map<String, dynamic> json) => ReplyMember(
    avatar: json["avatar"],
    avatarItem: FluffyAvatarItem.fromJson(json["avatar_item"]),
    contractDesc: json["contract_desc"],
    faceNftNew: json["face_nft_new"],
    fansDetail: json["fans_detail"],
    isContractor: json["is_contractor"],
    isSeniorMember: json["is_senior_member"],
    levelInfo: LevelInfo.fromJson(json["level_info"]),
    mid: json["mid"],
    nameplate: Nameplate.fromJson(json["nameplate"]),
    nftInteraction: json["nft_interaction"],
    officialVerify: OfficialVerify.fromJson(json["official_verify"]),
    pendant: Pendant.fromJson(json["pendant"]),
    rank: json["rank"],
    senior: json["senior"].keys.length>0 ? Senior.fromJson(json["senior"]) : null,
    sex: json["sex"],
    sign: json["sign"],
    uname: json["uname"],
    userSailing: json["user_sailing"],
    vip: Vip.fromJson(json["vip"]),
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "avatar_item": avatarItem.toJson(),
    "contract_desc": contractDesc,
    "face_nft_new": faceNftNew,
    "fans_detail": fansDetail,
    "is_contractor": isContractor,
    "is_senior_member": isSeniorMember,
    "level_info": levelInfo.toJson(),
    "mid": mid,
    "nameplate": nameplate.toJson(),
    "nft_interaction": nftInteraction,
    "official_verify": officialVerify.toJson(),
    "pendant": pendant.toJson(),
    "rank": rank,
    "senior": senior?.toJson(),
    "sex": sex,
    "sign": sign,
    "uname": uname,
    "user_sailing": userSailing,
    "vip": vip.toJson(),
  };
}

class FluffyAvatarItem {
  ContainerSize containerSize;
  FluffyFallbackLayers fallbackLayers;
  String mid;

  FluffyAvatarItem({
    required this.containerSize,
    required this.fallbackLayers,
    required this.mid,
  });

  factory FluffyAvatarItem.fromJson(Map<String, dynamic> json) => FluffyAvatarItem(
    containerSize: ContainerSize.fromJson(json["container_size"]),
    fallbackLayers: FluffyFallbackLayers.fromJson(json["fallback_layers"]),
    mid: json["mid"],
  );

  Map<String, dynamic> toJson() => {
    "container_size": containerSize.toJson(),
    "fallback_layers": fallbackLayers.toJson(),
    "mid": mid,
  };
}

class FluffyFallbackLayers {
  bool isCriticalGroup;
  List<FluffyLayer> layers;

  FluffyFallbackLayers({
    required this.isCriticalGroup,
    required this.layers,
  });

  factory FluffyFallbackLayers.fromJson(Map<String, dynamic> json) => FluffyFallbackLayers(
    isCriticalGroup: json["is_critical_group"],
    layers: List<FluffyLayer>.from(json["layers"].map((x) => FluffyLayer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_critical_group": isCriticalGroup,
    "layers": List<dynamic>.from(layers.map((x) => x.toJson())),
  };
}

class FluffyLayer {
  GeneralSpec generalSpec;
  FluffyLayerConfig layerConfig;
  Resource resource;
  bool visible;

  FluffyLayer({
    required this.generalSpec,
    required this.layerConfig,
    required this.resource,
    required this.visible,
  });

  factory FluffyLayer.fromJson(Map<String, dynamic> json) => FluffyLayer(
    generalSpec: GeneralSpec.fromJson(json["general_spec"]),
    layerConfig: FluffyLayerConfig.fromJson(json["layer_config"]),
    resource: Resource.fromJson(json["resource"]),
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "general_spec": generalSpec.toJson(),
    "layer_config": layerConfig.toJson(),
    "resource": resource.toJson(),
    "visible": visible,
  };
}

class FluffyLayerConfig {
  bool? isCritical;
  LayerMask? layerMask;


  FluffyLayerConfig({
    this.isCritical,
    this.layerMask,
  });

  factory FluffyLayerConfig.fromJson(Map<String, dynamic> json) => FluffyLayerConfig(
    isCritical: json["is_critical"],
    layerMask: json["layer_mask"] == null ? null : LayerMask.fromJson(json["layer_mask"]),
  );

  Map<String, dynamic> toJson() => {
    "is_critical": isCritical,
    "layer_mask": layerMask?.toJson(),
  };
}

class ReplyReplyControl {
  int maxLine;
  String timeDesc;

  ReplyReplyControl({
    required this.maxLine,
    required this.timeDesc,
  });

  factory ReplyReplyControl.fromJson(Map<String, dynamic> json) => ReplyReplyControl(
    maxLine: json["max_line"],
    timeDesc: json["time_desc"],
  );

  Map<String, dynamic> toJson() => {
    "max_line": maxLine,
    "time_desc": timeDesc,
  };
}

class UpAction {
  bool like;
  bool reply;

  UpAction({
    required this.like,
    required this.reply,
  });

  factory UpAction.fromJson(Map<String, dynamic> json) => UpAction(
    like: json["like"],
    reply: json["reply"],
  );

  Map<String, dynamic> toJson() => {
    "like": like,
    "reply": reply,
  };
}

class CommentDetailModelReplyControl {
  int maxLine;
  String? subReplyEntryText;
  String? subReplyTitleText;
  String timeDesc;

  CommentDetailModelReplyControl({
    required this.maxLine,
    this.subReplyEntryText,
    this.subReplyTitleText,
    required this.timeDesc,
  });

  factory CommentDetailModelReplyControl.fromJson(Map<String, dynamic> json) => CommentDetailModelReplyControl(
    maxLine: json["max_line"],
    subReplyEntryText: json["sub_reply_entry_text"],
    subReplyTitleText: json["sub_reply_title_text"],
    timeDesc: json["time_desc"],
  );

  Map<String, dynamic> toJson() => {
    "max_line": maxLine,
    "sub_reply_entry_text": subReplyEntryText,
    "sub_reply_title_text": subReplyTitleText,
    "time_desc": timeDesc,
  };
}

class MemberElement {
  String avatar;
  int faceNftNew;
  int isSeniorMember;
  LevelInfo levelInfo;
  String mid;
  Nameplate nameplate;
  OfficialVerify officialVerify;
  Pendant pendant;
  String rank;
  Senior? senior;
  String sex;
  String sign;
  String uname;
  Vip vip;

  MemberElement({
    required this.avatar,
    required this.faceNftNew,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.mid,
    required this.nameplate,
    required this.officialVerify,
    required this.pendant,
    required this.rank,
    this.senior,
    required this.sex,
    required this.sign,
    required this.uname,
    required this.vip,
  });

  factory MemberElement.fromJson(Map<String, dynamic> json) => MemberElement(
    avatar: json["avatar"],
    faceNftNew: json["face_nft_new"],
    isSeniorMember: json["is_senior_member"],
    levelInfo: LevelInfo.fromJson(json["level_info"]),
    mid: json["mid"],
    nameplate: Nameplate.fromJson(json["nameplate"]),
    officialVerify: OfficialVerify.fromJson(json["official_verify"]),
    pendant: Pendant.fromJson(json["pendant"]),
    rank: json["rank"],
    senior: json["senior"].keys.length > 0 ? Senior.fromJson(json["senior"]) : null,
    sex: json["sex"],
    sign: json["sign"],
    uname: json["uname"],
    vip: Vip.fromJson(json["vip"]),
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "face_nft_new": faceNftNew,
    "is_senior_member": isSeniorMember,
    "level_info": levelInfo.toJson(),
    "mid": mid,
    "nameplate": nameplate.toJson(),
    "official_verify": officialVerify.toJson(),
    "pendant": pendant.toJson(),
    "rank": rank,
    "senior": senior?.toJson(),
    "sex": sex,
    "sign": sign,
    "uname": uname,
    "vip": vip.toJson(),
  };
}