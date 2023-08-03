import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_tab_state.dart';

class BottomTabCubit extends Cubit<BottomTabState> {
  BottomTabCubit() : super(const BottomTabState());

  void setTab(BottomTab tab) {
    emit(state.copyWith(tab: tab));
  }
}
