part of 'video_play_bloc.dart';

class VideoPlayState extends Equatable {
  final bool isShow;
  final bool isPlaying;
  final bool isReadyInput;
  final bool isDanmukaOpen;
  final bool isFollow;

  final bool isLiked;
  final bool isDisliked;
  final bool isCoin;
  final bool isCollected;
  final bool isForward;
  final VideoDetailModel? model;

  final bool isShowMoreInfo;

  final VideoPlayerController? videoPlayerController;
  final ChewieController? chewieController;
  final BarrageWallController? barrageWallController;

  const VideoPlayState({
    this.isShow = true,
    this.isPlaying = false,
    this.isReadyInput = false,
    this.isDanmukaOpen = true,
    this.isFollow = false,
    this.isLiked = false,
    this.isDisliked = false,
    this.isCoin = false,
    this.isCollected = false,
    this.isForward = false,
    this.model,
    this.isShowMoreInfo = false,
    this.videoPlayerController,
    this.chewieController,
    this.barrageWallController,
  });
  @override
  List<Object> get props =>
      [isShow, isPlaying, isReadyInput, isDanmukaOpen, isFollow, isLiked, isDisliked, isCoin, isCollected, isForward, isShowMoreInfo];

  VideoPlayState copyWith({
    bool? isShow,
    bool? isPlaying,
    bool? isReadyInput,
    bool? isDanmukaOpen,
    bool? isFollow,
    bool? isLiked,
    bool? isDisliked,
    bool? isCoin,
    bool? isCollected,
    bool? isForward,
    VideoDetailModel? model,
    bool? isShowMoreInfo,
  }) {
    return VideoPlayState(
      isShow: isShow ?? this.isShow,
      isPlaying: isPlaying ?? this.isPlaying,
      isReadyInput: isReadyInput ?? this.isReadyInput,
      isDanmukaOpen: isDanmukaOpen ?? this.isDanmukaOpen,
      isFollow: isFollow ?? this.isFollow,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      isCoin: isCoin ?? this.isCoin,
      isCollected: isCollected ?? this.isCollected,
      isForward: isForward ?? this.isForward,
      model: model ?? this.model,
      isShowMoreInfo: isShowMoreInfo ?? this.isShowMoreInfo,
    );
  }
}

// 初始化视频播放页时 shimmer 效果
class VideoPlayInitial extends VideoPlayState {

}

// // 点进视频页加载视频
// class VideoPlayLoad extends VideoPlayState {
//   Model bvid;
//   VideoPlayLoad({required this.bvid});
// }

// 完成初始化
class VideoPlayInitComplete extends VideoPlayState {
  const VideoPlayInitComplete({
    super.isShow,
    super.isPlaying,
    super.isReadyInput,
    super.isDanmukaOpen,
    super.isFollow,
    super.isLiked,
    super.isDisliked,
    super.isCoin,
    super.isCollected,
    super.isForward,
    super.model,
    super.isShowMoreInfo,
    super.chewieController,
    super.videoPlayerController,
    super.barrageWallController,
  });
}

// 视频处于暂停状态，此时可以滑动过程中可以收起播放器
class VideoPlayPause extends VideoPlayState {
  const VideoPlayPause({
    super.isShow,
    super.isPlaying,
    super.isReadyInput,
    super.isDanmukaOpen,
    super.isFollow,
    super.isLiked,
    super.isDisliked,
    super.isCoin,
    super.isCollected,
    super.isForward,
    super.model,
    super.isShowMoreInfo,
    super.chewieController,
    super.videoPlayerController,
    super.barrageWallController,
  });
}

// 视频加载失败 / 断网
class VideoPlayLoadError extends VideoPlayState {}

// 视频全屏播放
class VideoPlayFullScreen extends VideoPlayState {}
