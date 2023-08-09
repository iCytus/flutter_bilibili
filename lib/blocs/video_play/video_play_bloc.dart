import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:video_player/video_player.dart';

part 'video_play_event.dart';
part 'video_play_state.dart';

class VideoPlayBloc extends Bloc<VideoPlayEvent, VideoPlayState> {
  VideoPlayBloc() : super(VideoPlayInitial()) {
    on<VideoPlayEvent>((event, emit) {

    });
    on<VideoPlayController>((event, emit) {

    });
    on<VideoPlayOrPauseEvent>((event, emit) {
      if (event.isPlaying) {
        event.videoPlayerController?.pause();
        emit(VideoPlayPause(isPlaying: false));
      } else {
        event.videoPlayerController?.play();
        emit(VideoPlayInitComplete(isPlaying: true));
      }

    });
    on<VideoMoreInfoEvent>((event, emit) {

    });
    on<FollowAuthorEvent>((event, emit) {

    });
    on<LikeVideoClickEvent>((event, emit) {

    });
    on<LikeVideoLongpressEvent>((event, emit) {

    });
    on<CoiningEvent>((event, emit) {

    });
    on<CollectVideoEvent>((event, emit) {

    });
    on<UnLikeVideoEvent>((event, emit) {

    });
    on<ForwordVideoEvent>((event, emit) {

    });
    on<CommentVideoEvent>((event, emit) {

    });
    on<DanmakuVideoEvent>((event, emit) {


      print("controller-status: ${event.animationController.status}");
      if (event.animationController.status == AnimationStatus.completed) {
        event.animationController.reverse();
      } else if (event.animationController.status == AnimationStatus.dismissed) {
        event.animationController.forward();
      } else if (event.animationController.status == AnimationStatus.forward) {
        event.animationController.forward();
      }
    });
    on<DanmakuInputEvent>((event, emit) {
      //print("bloc-state: $state");
      if (state is VideoPlayInitComplete) {
        //print("bloc-state-1: $state");
        emit(VideoPlayInitComplete(isPlaying: true, isReadyInput: event.isReadyInput));
      }else if (state is VideoPlayPause) {
        //print("bloc-state-2: $state");
        emit(VideoPlayPause(isPlaying: false, isReadyInput: event.isReadyInput));
      }
    });
  }
}
