import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trends_event.dart';
part 'trends_state.dart';

class TrendsBloc extends Bloc<TrendsEvent, TrendsState> {
  TrendsBloc() : super(TrendsInitial()) {
    on<TrendsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
