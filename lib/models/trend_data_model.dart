// To parse this JSON data, do
//
//     final trendDataModel = trendDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

TrendDataModel trendDataModelFromJson(String str) => TrendDataModel.fromJson(json.decode(str));

String trendDataModelToJson(TrendDataModel data) => json.encode(data.toJson());

class TrendDataModel extends Equatable {
  Basic basic;
  String idStr;
  Modules modules;
  Orig? orig;
  String type;
  bool visible;

  TrendDataModel({
    required this.basic,
    required this.idStr,
    required this.modules,
    this.orig,
    required this.type,
    required this.visible,
  });

  factory TrendDataModel.fromJson(Map<String, dynamic> json) => TrendDataModel(
        basic: Basic.fromJson(json["basic"]),
        idStr: json["id_str"],
        modules: Modules.fromJson(json["modules"]),
        orig: json.keys.contains("orig") ? Orig.fromJson(json["orig"]) : null,
        type: json["type"],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "basic": basic.toJson(),
        "id_str": idStr,
        "modules": modules.toJson(),
        "orig": orig?.toJson(),
        "type": type,
        "visible": visible,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [basic, idStr, modules, orig, type, visible];
}

class Orig {
  Basic basic;
  String idStr;
  Modules modules;
  String type;
  bool visible;

  Orig({
    required this.basic,
    required this.idStr,
    required this.modules,
    required this.type,
    required this.visible,
  });

  factory Orig.fromJson(Map<String, dynamic> json) => Orig(
        basic: Basic.fromJson(json["basic"]),
        idStr: json["id_str"],
        modules: Modules.fromJson(json["modules"]),
        type: json["type"],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "basic": basic.toJson(),
        "id_str": idStr,
        "modules": modules.toJson(),
        "type": type,
        "visible": visible,
      };
}

class Basic {
  String commentIdStr;
  int commentType;
  LikeIcon likeIcon;
  String ridStr;

  Basic({
    required this.commentIdStr,
    required this.commentType,
    required this.likeIcon,
    required this.ridStr,
  });

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
        commentIdStr: json["comment_id_str"],
        commentType: json["comment_type"],
        likeIcon: LikeIcon.fromJson(json["like_icon"]),
        ridStr: json["rid_str"],
      );

  Map<String, dynamic> toJson() => {
        "comment_id_str": commentIdStr,
        "comment_type": commentType,
        "like_icon": likeIcon.toJson(),
        "rid_str": ridStr,
      };
}

class LikeIcon {
  String actionUrl;
  String endUrl;
  int id;
  String startUrl;

  LikeIcon({
    required this.actionUrl,
    required this.endUrl,
    required this.id,
    required this.startUrl,
  });

  factory LikeIcon.fromJson(Map<String, dynamic> json) => LikeIcon(
        actionUrl: json["action_url"],
        endUrl: json["end_url"],
        id: json["id"],
        startUrl: json["start_url"],
      );

  Map<String, dynamic> toJson() => {
        "action_url": actionUrl,
        "end_url": endUrl,
        "id": id,
        "start_url": startUrl,
      };
}

class Modules {
  ModuleAuthor moduleAuthor;
  ModuleDynamic moduleDynamic;
  ModuleMore? moduleMore;
  ModuleStat? moduleStat;

  Modules({
    required this.moduleAuthor,
    required this.moduleDynamic,
    this.moduleMore,
    this.moduleStat,
  });

  factory Modules.fromJson(Map<String, dynamic> json) => Modules(
        moduleAuthor: ModuleAuthor.fromJson(json["module_author"]),
        moduleDynamic: ModuleDynamic.fromJson(json["module_dynamic"]),
        moduleMore: json.keys.contains("module_more") ? ModuleMore.fromJson(json["module_more"]) : null,
        moduleStat: json.keys.contains("module_stat") ? ModuleStat.fromJson(json["module_stat"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "module_author": moduleAuthor.toJson(),
        "module_dynamic": moduleDynamic.toJson(),
        "module_more": moduleMore?.toJson(),
        "module_stat": moduleStat?.toJson(),
      };
}

class ModuleAuthor {
  Avatar avatar;
  String face;
  bool faceNft;
  bool? following;
  String jumpUrl;
  String label;
  int mid;
  String name;
  OfficialVerify officialVerify;
  Pendant pendant;
  String pubAction;
  String? pubLocationText;
  String pubTime;
  int pubTs;
  String type;
  Vip vip;

  ModuleAuthor({
    required this.avatar,
    required this.face,
    required this.faceNft,
    required this.following,
    required this.jumpUrl,
    required this.label,
    required this.mid,
    required this.name,
    required this.officialVerify,
    required this.pendant,
    required this.pubAction,
    this.pubLocationText,
    required this.pubTime,
    required this.pubTs,
    required this.type,
    required this.vip,
  });

  factory ModuleAuthor.fromJson(Map<String, dynamic> json) => ModuleAuthor(
        avatar: Avatar.fromJson(json["avatar"]),
        face: json["face"],
        faceNft: json["face_nft"],
        following: json["following"],
        jumpUrl: json["jump_url"],
        label: json["label"],
        mid: json["mid"],
        name: json["name"],
        officialVerify: OfficialVerify.fromJson(json["official_verify"]),
        pendant: Pendant.fromJson(json["pendant"]),
        pubAction: json["pub_action"],
        pubLocationText: json.keys.contains("pub_location_text") ? json["pub_location_text"] : null,
        pubTime: json["pub_time"],
        pubTs: json["pub_ts"],
        type: json["type"],
        vip: Vip.fromJson(json["vip"]),
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar.toJson(),
        "face": face,
        "face_nft": faceNft,
        "following": following,
        "jump_url": jumpUrl,
        "label": label,
        "mid": mid,
        "name": name,
        "official_verify": officialVerify.toJson(),
        "pendant": pendant.toJson(),
        "pub_action": pubAction,
        "pub_location_text": pubLocationText,
        "pub_time": pubTime,
        "pub_ts": pubTs,
        "type": type,
        "vip": vip.toJson(),
      };
}

class Avatar {
  ContainerSize containerSize;
  FallbackLayers fallbackLayers;
  String mid;

  Avatar({
    required this.containerSize,
    required this.fallbackLayers,
    required this.mid,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        containerSize: ContainerSize.fromJson(json["container_size"]),
        fallbackLayers: FallbackLayers.fromJson(json["fallback_layers"]),
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

class FallbackLayers {
  bool isCriticalGroup;
  List<Layer> layers;

  FallbackLayers({
    required this.isCriticalGroup,
    required this.layers,
  });

  factory FallbackLayers.fromJson(Map<String, dynamic> json) => FallbackLayers(
        isCriticalGroup: json["is_critical_group"],
        layers: List<Layer>.from(json["layers"].map((x) => Layer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is_critical_group": isCriticalGroup,
        "layers": List<dynamic>.from(layers.map((x) => x.toJson())),
      };
}

class Layer {
  GeneralSpec generalSpec;
  LayerConfig layerConfig;
  Resource resource;
  bool visible;

  Layer({
    required this.generalSpec,
    required this.layerConfig,
    required this.resource,
    required this.visible,
  });

  factory Layer.fromJson(Map<String, dynamic> json) => Layer(
        generalSpec: GeneralSpec.fromJson(json["general_spec"]),
        layerConfig: LayerConfig.fromJson(json["layer_config"]),
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

class LayerConfig {
  bool? isCritical;
  Tags tags;

  LayerConfig({
    this.isCritical,
    required this.tags,
  });

  factory LayerConfig.fromJson(Map<String, dynamic> json) => LayerConfig(
        isCritical: json.keys.contains("is_critical") ? json["is_critical"] : null,
        tags: Tags.fromJson(json["tags"]),
      );

  Map<String, dynamic> toJson() => {
        "is_critical": isCritical,
        "tags": tags.toJson(),
      };
}

class Tags {
  AvatarLayer? avatarLayer;
  GeneralCfg? generalCfg;

  Tags({
    this.avatarLayer,
    this.generalCfg,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        // avatarLayer: AvatarLayer.fromJson(json["AVATAR_LAYER"]),
        avatarLayer: json.keys.contains("AVATAR_LAYER") && json["AVATAR_LAYER"].keys.length != 0
            ? AvatarLayer.fromJson(json["AVATAR_LAYER"].values.first)
            : null,
        generalCfg:
            json.keys.contains("GENERAL_CFG") && json["GENERAL_CFG"].keys.length != 0 ? GeneralCfg.fromJson(json["GENERAL_CFG"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "AVATAR_LAYER": avatarLayer?.toJson(),
        "GENERAL_CFG": generalCfg?.toJson(),
      };
}

class AvatarLayer {
  AvatarLayer();

  factory AvatarLayer.fromJson(Map<String, dynamic> json) => AvatarLayer();

  Map<String, dynamic> toJson() => {};
}

class GeneralCfg {
  int configType;
  GeneralConfig generalConfig;

  GeneralCfg({
    required this.configType,
    required this.generalConfig,
  });

  factory GeneralCfg.fromJson(Map<String, dynamic> json) => GeneralCfg(
        configType: json["config_type"],
        generalConfig: GeneralConfig.fromJson(json["general_config"]),
      );

  Map<String, dynamic> toJson() => {
        "config_type": configType,
        "general_config": generalConfig.toJson(),
      };
}

class GeneralConfig {
  WebCssStyle webCssStyle;

  GeneralConfig({
    required this.webCssStyle,
  });

  factory GeneralConfig.fromJson(Map<String, dynamic> json) => GeneralConfig(
        webCssStyle: WebCssStyle.fromJson(json["web_css_style"]),
      );

  Map<String, dynamic> toJson() => {
        "web_css_style": webCssStyle.toJson(),
      };
}

class WebCssStyle {
  String borderRadius;

  WebCssStyle({
    required this.borderRadius,
  });

  factory WebCssStyle.fromJson(Map<String, dynamic> json) => WebCssStyle(
        borderRadius: json["borderRadius"],
      );

  Map<String, dynamic> toJson() => {
        "borderRadius": borderRadius,
      };
}

class Resource {
  ResImage resImage;
  int resType;

  Resource({
    required this.resImage,
    required this.resType,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        resImage: ResImage.fromJson(json["res_image"]),
        resType: json["res_type"],
      );

  Map<String, dynamic> toJson() => {
        "res_image": resImage.toJson(),
        "res_type": resType,
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

  ImageSrc({
    this.placeholder,
    this.remote,
    required this.srcType,
  });

  factory ImageSrc.fromJson(Map<String, dynamic> json) => ImageSrc(
        placeholder: json.keys.contains("placeholder") ? json["placeholder"] : null,
        remote: json.keys.contains("remote") ? Remote.fromJson(json["remote"]) : null,
        srcType: json["src_type"],
      );

  Map<String, dynamic> toJson() => {
        "placeholder": placeholder,
        "remote": remote?.toJson(),
        "src_type": srcType,
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

class Vip {
  int avatarSubscript;
  String avatarSubscriptUrl;
  int dueDate;
  Label label;
  String nicknameColor;
  int status;
  int themeType;
  int type;

  Vip({
    required this.avatarSubscript,
    required this.avatarSubscriptUrl,
    required this.dueDate,
    required this.label,
    required this.nicknameColor,
    required this.status,
    required this.themeType,
    required this.type,
  });

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        avatarSubscript: json["avatar_subscript"],
        avatarSubscriptUrl: json["avatar_subscript_url"],
        dueDate: json["due_date"],
        label: Label.fromJson(json["label"]),
        nicknameColor: json["nickname_color"],
        status: json["status"],
        themeType: json["theme_type"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_subscript": avatarSubscript,
        "avatar_subscript_url": avatarSubscriptUrl,
        "due_date": dueDate,
        "label": label.toJson(),
        "nickname_color": nicknameColor,
        "status": status,
        "theme_type": themeType,
        "type": type,
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

class ModuleDynamic {
  dynamic additional;
  Desc? desc;
  Major? major;
  Topic? topic;

  ModuleDynamic({
    this.additional,
    this.desc,
    this.major,
    this.topic,
  });

  factory ModuleDynamic.fromJson(Map<String, dynamic> json) => ModuleDynamic(
        additional: json["additional"],
        desc: json["desc"] != null && json["desc"].keys.length != 0 ? Desc.fromJson(json["desc"]) : null,
        major: json["major"] != null && json["major"].keys.length != 0 ? Major.fromJson(json["major"]) : null,
        topic: json["topic"] != null && json["topic"].keys.length != 0 ? Topic.fromJson(json["topic"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "additional": additional,
        "desc": desc,
        "major": major?.toJson(),
        "topic": topic?.toJson(),
      };
}

class Desc {
  List<RichTextNode> richTextNodes;
  String text;

  Desc({
    required this.richTextNodes,
    required this.text,
  });

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        richTextNodes: List<RichTextNode>.from(json["rich_text_nodes"].map((x) => RichTextNode.fromJson(x))),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "rich_text_nodes": List<dynamic>.from(richTextNodes.map((x) => x.toJson())),
        "text": text,
      };
}

class RichTextNode {
  String origText;
  String text;
  String type;
  Emoji? emoji;

  RichTextNode({
    required this.origText,
    required this.text,
    required this.type,
    this.emoji,
  });

  factory RichTextNode.fromJson(Map<String, dynamic> json) => RichTextNode(
        origText: json["orig_text"],
        text: json["text"],
        type: json["type"],
        emoji: json["emoji"] == null ? null : Emoji.fromJson(json["emoji"]),
      );

  Map<String, dynamic> toJson() => {
        "orig_text": origText,
        "text": text,
        "type": type,
        "emoji": emoji?.toJson(),
      };
}

class Emoji {
  String iconUrl;
  int size;
  String text;
  int type;

  Emoji({
    required this.iconUrl,
    required this.size,
    required this.text,
    required this.type,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) => Emoji(
        iconUrl: json["icon_url"],
        size: json["size"],
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "size": size,
        "text": text,
        "type": type,
      };
}

class Major {
  Archive? archive;
  Draw? draw;
  String type;

  Major({
    this.archive,
    this.draw,
    required this.type,
  });

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        archive: json.keys.contains("archive") && json["archive"].keys.length != 0 ? Archive.fromJson(json["archive"]) : null,
        draw: json.keys.contains("draw") && json["draw"].keys.length != 0 ? Draw.fromJson(json["draw"]) : null,
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "archive": archive?.toJson(),
        "draw": draw?.toJson(),
        "type": type,
      };
}

class Archive {
  String aid;
  Badge badge;
  String bvid;
  String cover;
  String desc;
  int disablePreview;
  String durationText;
  String jumpUrl;
  Stat stat;
  String title;
  int type;

  Archive({
    required this.aid,
    required this.badge,
    required this.bvid,
    required this.cover,
    required this.desc,
    required this.disablePreview,
    required this.durationText,
    required this.jumpUrl,
    required this.stat,
    required this.title,
    required this.type,
  });

  factory Archive.fromJson(Map<String, dynamic> json) => Archive(
        aid: json["aid"],
        badge: Badge.fromJson(json["badge"]),
        bvid: json["bvid"],
        cover: json["cover"],
        desc: json["desc"],
        disablePreview: json["disable_preview"],
        durationText: json["duration_text"],
        jumpUrl: json["jump_url"],
        stat: Stat.fromJson(json["stat"]),
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "badge": badge.toJson(),
        "bvid": bvid,
        "cover": cover,
        "desc": desc,
        "disable_preview": disablePreview,
        "duration_text": durationText,
        "jump_url": jumpUrl,
        "stat": stat.toJson(),
        "title": title,
        "type": type,
      };
}

class Badge {
  String bgColor;
  String color;
  dynamic iconUrl;
  String text;

  Badge({
    required this.bgColor,
    required this.color,
    this.iconUrl,
    required this.text,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        bgColor: json["bg_color"],
        color: json["color"],
        iconUrl: json["icon_url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "bg_color": bgColor,
        "color": color,
        "icon_url": iconUrl,
        "text": text,
      };
}

class Stat {
  String danmaku;
  String play;

  Stat({
    required this.danmaku,
    required this.play,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        danmaku: json["danmaku"],
        play: json["play"],
      );

  Map<String, dynamic> toJson() => {
        "danmaku": danmaku,
        "play": play,
      };
}

class Draw {
  int id;
  List<Item> items;

  Draw({
    required this.id,
    required this.items,
  });

  factory Draw.fromJson(Map<String, dynamic> json) => Draw(
        id: json["id"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  int height;
  double size;
  String src;
  List<dynamic> tags;
  int width;

  Item({
    required this.height,
    required this.size,
    required this.src,
    required this.tags,
    required this.width,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        height: json["height"],
        size: json["size"]?.toDouble(),
        src: json["src"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "size": size,
        "src": src,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "width": width,
      };
}

class Topic {
  int id;
  String jumpUrl;
  String name;

  Topic({
    required this.id,
    required this.jumpUrl,
    required this.name,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        jumpUrl: json["jump_url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jump_url": jumpUrl,
        "name": name,
      };
}

class ModuleMore {
  List<ThreePointItem> threePointItems;

  ModuleMore({
    required this.threePointItems,
  });

  factory ModuleMore.fromJson(Map<String, dynamic> json) => ModuleMore(
        threePointItems: List<ThreePointItem>.from(json["three_point_items"].map((x) => ThreePointItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "three_point_items": List<dynamic>.from(threePointItems.map((x) => x.toJson())),
      };
}

class ThreePointItem {
  String label;
  String type;

  ThreePointItem({
    required this.label,
    required this.type,
  });

  factory ThreePointItem.fromJson(Map<String, dynamic> json) => ThreePointItem(
        label: json["label"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "type": type,
      };
}

class ModuleStat {
  Comment comment;
  Comment forward;
  Like like;

  ModuleStat({
    required this.comment,
    required this.forward,
    required this.like,
  });

  factory ModuleStat.fromJson(Map<String, dynamic> json) => ModuleStat(
        comment: Comment.fromJson(json["comment"]),
        forward: Comment.fromJson(json["forward"]),
        like: Like.fromJson(json["like"]),
      );

  Map<String, dynamic> toJson() => {
        "comment": comment.toJson(),
        "forward": forward.toJson(),
        "like": like.toJson(),
      };
}

class Comment {
  int count;
  bool forbidden;

  Comment({
    required this.count,
    required this.forbidden,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        count: json["count"],
        forbidden: json["forbidden"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "forbidden": forbidden,
      };
}

class Like {
  int count;
  bool forbidden;
  bool status;

  Like({
    required this.count,
    required this.forbidden,
    required this.status,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        count: json["count"],
        forbidden: json["forbidden"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "forbidden": forbidden,
        "status": status,
      };
}
