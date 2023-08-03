part of 'bottom_tab_cubit.dart';

enum BottomTab {
  home(),
  trends(),
  mine();

  const BottomTab();
}

class BottomTabState extends Equatable {
  final BottomTab tab;
  const BottomTabState({this.tab = BottomTab.home});
  @override
  List<Object> get props => [tab];

  BottomTabState copyWith({
    BottomTab? tab,
  }) {
    return BottomTabState(tab: tab ?? this.tab);
  }
}
