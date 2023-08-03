part of 'home_bloc.dart';

enum RefreshStyle { live, recommend, hot, comprehensive }

abstract class HomeEvent extends Equatable {
  final EasyRefreshController? refreshController;
  final RefreshStyle? style;
  const HomeEvent({this.refreshController, this.style});
  @override
  List<Object?> get props => [];
}

class LoadDateEvent extends HomeEvent {
  const LoadDateEvent({super.refreshController, super.style});
}
