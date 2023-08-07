part of 'video_play_bloc.dart';

class VideoPlayState extends Equatable {
  final bool isShow;
  final bool isPlaying;
  const VideoPlayState({this.isShow = true, this.isPlaying = false});
  @override
  List<Object> get props => [];

  VideoPlayState copyWith({bool? isShow, bool? isPlaying}) {
    return VideoPlayState(isShow: isShow ?? this.isShow, isPlaying: isPlaying ?? this.isPlaying);
  }
}

// 初始化视频播放页时 shimmer 效果
class VideoPlayInitial extends VideoPlayState {}

// 完成初始化
class VideoPlayInitComplete extends VideoPlayState {}

// 视频处于暂停状态，此时可以滑动过程中可以收起播放器
class VideoPlayPause extends VideoPlayState {}

// 视频加载失败 / 断网
class VideoPlayLoadError extends VideoPlayState {}

// 视频全屏播放
class VideoPlayFullScreen extends VideoPlayState {}
