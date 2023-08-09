part of 'video_play_bloc.dart';

abstract class VideoPlayEvent extends Equatable {
  bool isShow;
  bool isPlaying;

  VideoPlayEvent(this.isShow, this.isPlaying);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// 隐藏/显示 视频的control按钮(这个可能还得单独一个bloc)
class VideoPlayController extends VideoPlayEvent {
  VideoPlayController(super.isShow, super.isPlaying);
}

class VideoPlayOrPauseEvent extends VideoPlayEvent {
  final VideoPlayerController? videoPlayerController;
  VideoPlayOrPauseEvent(super.isShow, super.isPlaying, this.videoPlayerController);
}

// 视频信息文本 more ，即标题下方的详情文本
class VideoMoreInfoEvent extends VideoPlayEvent {
  VideoMoreInfoEvent(super.isShow, super.isPlaying);
}

// 关注按钮点击
class FollowAuthorEvent extends VideoPlayEvent {
  FollowAuthorEvent(super.isShow, super.isPlaying);
}

// 点赞按钮点击
class LikeVideoClickEvent extends VideoPlayEvent {
  LikeVideoClickEvent(super.isShow, super.isPlaying);
}

// 长按点赞，一键三连
class LikeVideoLongpressEvent extends VideoPlayEvent {
  LikeVideoLongpressEvent(super.isShow, super.isPlaying);
}

// 投币按钮点击
class CoiningEvent extends VideoPlayEvent {
  CoiningEvent(super.isShow, super.isPlaying);
}

// 收藏按钮点击
class CollectVideoEvent extends VideoPlayEvent {
  CollectVideoEvent(super.isShow, super.isPlaying);
}

// 不喜欢按钮点击
class UnLikeVideoEvent extends VideoPlayEvent {
  UnLikeVideoEvent(super.isShow, super.isPlaying);
}

// 转发按钮点击
class ForwordVideoEvent extends VideoPlayEvent {
  ForwordVideoEvent(super.isShow, super.isPlaying);
}

// 评论按钮点击
class CommentVideoEvent extends VideoPlayEvent {
  CommentVideoEvent(super.isShow, super.isPlaying);
}

// 打开/关闭 弹幕按钮点击
class DanmakuVideoEvent extends VideoPlayEvent {
  final bool isDanmukaOpen;
  final AnimationController animationController;
  DanmakuVideoEvent(super.isShow, super.isPlaying, {required this.isDanmukaOpen, required this.animationController});
}

// 输入弹幕（同时要暂停视频）
class DanmakuInputEvent extends VideoPlayEvent {
  final bool isReadyInput;
  DanmakuInputEvent(super.isShow, super.isPlaying, {required this.isReadyInput});
}
