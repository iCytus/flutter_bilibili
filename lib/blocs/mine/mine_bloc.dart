import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mine_event.dart';
part 'mine_state.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  MineBloc() : super(MineInitial()) {
    on<MineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
