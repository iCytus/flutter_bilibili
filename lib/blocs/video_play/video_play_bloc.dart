import 'package:bilibili_bloc/models/video_detail_model.dart';
import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_barrage/flutter_barrage.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../config/test_data.dart';
import '../../widgets/video_controls_style.dart';

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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
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
          videoPlayerController: state.videoPlayerController,
          chewieController: state.chewieController,
        ));
      }
    });
    on<LoadVideoDetail>((event, emit) async {
      String bvid = event.bvid;
      // todo: 模拟请求该视频的信息
      VideoDetailModel model = VideoDetailModel.fromJson(videoDetailInfo);

      late VideoPlayerController videoPlayerController;
      late ChewieController chewieController;
      late BarrageWallController barrageWallController;
      late ValueNotifier<BarrageValue> timelineNotifier;

      timelineNotifier = ValueNotifier(BarrageValue());
      String a = await rootBundle.loadString('assets/videos/video_720p_n.ass');
      List<Bullet> bullets = [];
      List<String> aa = a.split("\n");
      for (var i in aa) {
        if (i.length > 6) {
          List<String> l = i.split("}");
          RegExp r = RegExp(r"\d:\d\d:\d\d.\d\d");
          var ll = r.firstMatch(i);
          List<String> t = ll!.group(0)!.split(":");
          int mt = 3600000 * int.parse(t[0]) +
              60000 * int.parse(t[1]) +
              int.parse(t[2].split(".").first) * 1000 +
              int.parse(t[2].split(".").last) * 10;
          bullets.add(Bullet(showTime: mt, child: Text(l.last, style: const TextStyle(color: Colors.white),)));
        }
      }

      // videoPlayerController = VideoPlayerController.networkUrl(
      //     Uri.parse("https://test-1253674864.cos.ap-nanjing.myqcloud.com/video_720p.mp4"));
      // videoPlayerController = VideoPlayerController.networkUrl(
      //     Uri.parse("https://qingx-h5-1253674864.cos.ap-guangzhou.myqcloud.com/video/2023/3/31/aa5a29573061443997e6fb7134e52513.mp4"));
      videoPlayerController = VideoPlayerController.asset("assets/videos/video_720p.mp4")
        ..addListener(() {
        timelineNotifier.value = timelineNotifier.value.copyWith(
            timeline: videoPlayerController.value.position.inMilliseconds,
            isPlaying: videoPlayerController.value.isPlaying);
      });
      await videoPlayerController.initialize();
      barrageWallController = BarrageWallController(timelineNotifier: timelineNotifier);
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController, autoPlay: true, looping: false, fullScreenByDefault: false,
        customControls: const SizedBox(),
        overlay: BarrageWall(
          debug: false,
          // do not send bullets to the safe area
          safeBottomHeight: 0,
          /* speed: 8, */
          massiveMode: false,
          speedCorrectionInMilliseconds: 5000,
          controller: barrageWallController,
          /* timelineNotifier: timelineNotifier, */
          bullets: bullets,
          child: const SizedBox(),
        ),
      );

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
        videoPlayerController: videoPlayerController,
        chewieController: chewieController,
      ));
    });
    on<ReleaseVideoPlayer>((event, emit) {
      state.videoPlayerController?.dispose();
      state.chewieController?.dispose();
      state.barrageWallController?.dispose();
    });
  }
}
