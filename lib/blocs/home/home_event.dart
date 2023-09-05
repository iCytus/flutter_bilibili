part of 'home_bloc.dart';

enum RefreshStyle { live, recommend, hot, comprehensive }

abstract class HomeEvent extends Equatable {
  final EasyRefreshController? refreshController;
  final RefreshStyle? style;
  const HomeEvent({this.refreshController, this.style});
  @override
  List<Object?> get props => [];
}

class LoadDataEvent extends HomeEvent {
  const LoadDataEvent({super.refreshController, super.style});
}

class RemindRefreshEvent extends HomeEvent {
  const RemindRefreshEvent();
}
