import 'package:bilibili_bloc/models/video_detail_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:video_player/video_player.dart';

import '../../config/test_data.dart';

part 'video_play_event.dart';
part 'video_play_state.dart';

class VideoPlayBloc extends Bloc<VideoPlayEvent, VideoPlayState> {
  VideoPlayBloc() : super(VideoPlayInitial()) {
    on<VideoPlayEvent>((event, emit) {});
    on<VideoPlayController>((event, emit) {});
    on<VideoPlayOrPauseEvent>((event, emit) {
      if (event.isPlaying) {
        event.videoPlayerController?.pause();
        emit(VideoPlayPause(
          isPlaying: false,
          isReadyInput: state.isReadyInput,
          isShow: true,
          isDanmukaOpen: state.isDanmukaOpen,
          isFollow: state.isFollow,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: state.isShowMoreInfo,
        ));
      } else {
        event.videoPlayerController?.play();
        emit(VideoPlayInitComplete(
          isPlaying: true,
          isReadyInput: state.isReadyInput,
          isShow: true,
          isDanmukaOpen: state.isDanmukaOpen,
          isFollow: state.isFollow,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
        ));
      }
    });
    on<VideoMoreInfoEvent>((event, emit) {
      // 点击视频下方的标题，展开或者收起视频描述文本内容
      bool isShowMoreInfo = state.isShowMoreInfo;
      if (state is VideoPlayInitComplete) {
        emit(VideoPlayInitComplete(
          isPlaying: state.isPlaying,
          isFollow: state.isFollow,
          isReadyInput: state.isReadyInput,
          isShow: false,
          isDanmukaOpen: state.isDanmukaOpen,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: !isShowMoreInfo,
        ));
      }
      if (state is VideoPlayPause) {
        emit(VideoPlayPause(
          isPlaying: state.isPlaying,
          isFollow: state.isFollow,
          isReadyInput: state.isReadyInput,
          isShow: false,
          isDanmukaOpen: state.isDanmukaOpen,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: !isShowMoreInfo,
        ));
      }
    });
    on<FollowAuthorEvent>((event, emit) {
      bool new_follow_status = event.change_follow;
      print("isDanmukaOpen: ${state.isDanmukaOpen}");
      if (state is VideoPlayInitComplete) {
        emit(VideoPlayInitComplete(
          isPlaying: state.isPlaying,
          isFollow: new_follow_status,
          isReadyInput: state.isReadyInput,
          isShow: false,
          isDanmukaOpen: state.isDanmukaOpen,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: state.isShowMoreInfo,
        ));
      }
      if (state is VideoPlayPause) {
        emit(VideoPlayPause(
          isPlaying: state.isPlaying,
          isFollow: new_follow_status,
          isReadyInput: state.isReadyInput,
          isShow: false,
          isDanmukaOpen: state.isDanmukaOpen,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: state.isShowMoreInfo,
        ));
      }
    });
    on<LikeVideoClickEvent>((event, emit) {});
    on<LikeVideoLongpressEvent>((event, emit) {});
    on<CoiningEvent>((event, emit) {});
    on<CollectVideoEvent>((event, emit) {});
    on<UnLikeVideoEvent>((event, emit) {});
    on<ForwordVideoEvent>((event, emit) {});
    on<CommentVideoEvent>((event, emit) {});
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
        emit(VideoPlayInitComplete(
          isPlaying: state.isPlaying,
          isReadyInput: event.isReadyInput,
          isShow: false,
          isDanmukaOpen: state.isDanmukaOpen,
          isFollow: state.isFollow,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: state.isShowMoreInfo,
        ));
      } else if (state is VideoPlayPause) {
        //print("bloc-state-2: $state");
        emit(VideoPlayPause(
          isPlaying: state.isPlaying,
          isReadyInput: event.isReadyInput,
          isShow: false,
          isDanmukaOpen: state.isDanmukaOpen,
          isFollow: state.isFollow,
          isLiked: state.isLiked,
          isDisliked: state.isDisliked,
          isCoin: state.isCoin,
          isCollected: state.isCollected,
          isForward: state.isForward,
          model: state.model,
          isShowMoreInfo: state.isShowMoreInfo,
        ));
      }
    });
    on<LoadVideoDetail>((event, emit) {
      String bvid = event.bvid;
      // todo: 模拟请求该视频的信息
      VideoDetailModel model = VideoDetailModel.fromJson(videoDetailInfo);
      emit(VideoPlayInitComplete(
        isPlaying: state.isPlaying,
        isReadyInput: state.isReadyInput,
        isShow: false,
        isDanmukaOpen: state.isDanmukaOpen,
        isFollow: state.isFollow,
        isLiked: state.isLiked,
        isDisliked: state.isDisliked,
        isCoin: state.isCoin,
        isCollected: state.isCollected,
        isForward: state.isForward,
        model: model,
        isShowMoreInfo: state.isShowMoreInfo,
      ));
    });
  }
}
