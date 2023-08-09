part of 'video_play_bloc.dart';

class VideoPlayState extends Equatable {
  final bool isShow;
  final bool isPlaying;
  final bool isReadyInput;
  final bool isDanmukaOpen;
  const VideoPlayState({this.isShow = true, this.isPlaying = false, this.isReadyInput = false, this.isDanmukaOpen = true});
  @override
  List<Object> get props => [isShow, isPlaying, isReadyInput, isDanmukaOpen];

  VideoPlayState copyWith({bool? isShow, bool? isPlaying, bool? isReadyInput, bool? isDanmukaOpen}) {
    return VideoPlayState(
        isShow: isShow ?? this.isShow,
        isPlaying: isPlaying ?? this.isPlaying,
        isReadyInput: isReadyInput ?? this.isReadyInput,
        isDanmukaOpen: isDanmukaOpen ?? this.isDanmukaOpen);
  }
}

// 初始化视频播放页时 shimmer 效果
class VideoPlayInitial extends VideoPlayState {}

// 完成初始化
class VideoPlayInitComplete extends VideoPlayState {
  const VideoPlayInitComplete({super.isShow, super.isPlaying, super.isReadyInput, super.isDanmukaOpen});
}

// 视频处于暂停状态，此时可以滑动过程中可以收起播放器
class VideoPlayPause extends VideoPlayState {
  const VideoPlayPause({super.isShow, super.isPlaying, super.isReadyInput, super.isDanmukaOpen});
}

// 视频加载失败 / 断网
class VideoPlayLoadError extends VideoPlayState {}

// 视频全屏播放
class VideoPlayFullScreen extends VideoPlayState {}
