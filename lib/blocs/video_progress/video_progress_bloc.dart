import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'video_progress_event.dart';
part 'video_progress_state.dart';

class VideoProgressBloc extends Bloc<VideoProgressEvent, VideoProgressState> {
  VideoProgressBloc() : super(VideoProgressState()) {
    on<VideoProgressEvent>((event, emit) {
      emit(VideoProgressState(position: event.position));
    });
  }
}
