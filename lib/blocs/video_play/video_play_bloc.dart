import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'video_play_event.dart';
part 'video_play_state.dart';

class VideoPlayBloc extends Bloc<VideoPlayEvent, VideoPlayState> {
  VideoPlayBloc() : super(VideoPlayInitial()) {
    on<VideoPlayEvent>((event, emit) {

    });
    on<VideoPlayController>((event, emit) {

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

    });
    on<DanmakuInputEvent>((event, emit) {

    });
  }
}
