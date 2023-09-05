part of 'home_bloc.dart';

enum RefreshStatus { initial, success, failure }


class HomeState extends Equatable {
  final List<LiveDataModel> livesList;
  final List<LiveBannerDataModel> livesBannerList;
  final List<VideoItemDataModel> recommendList;
  final List<HotDataModel> hotList;
  final List<TrendDataModel> trendList;
  final RefreshStyle? style;
  const HomeState({
    this.style,
    this.livesList = const [],
    this.livesBannerList = const [],
    this.recommendList = const [],
    this.hotList = const [],
    this.trendList = const [],
  });

  HomeState copyWith({
    RefreshStyle? style,
    List<LiveDataModel>? livesList,
    List<LiveBannerDataModel>? livesBannerList,
    List<VideoItemDataModel>? recommendList,
    List<HotDataModel>? hotList,
    List<TrendDataModel>? trendList,
  }) {
    print("HomeState.copyWith: $style");
    return HomeState(
      style: style ?? this.style,
      livesList: livesList ?? this.livesList,
      livesBannerList: livesBannerList ?? this.livesBannerList,
      recommendList: recommendList ?? this.recommendList,
      hotList: hotList ?? this.hotList,
      trendList: trendList ?? this.trendList,
    );
  }

  @override
  List<Object> get props => [livesList, livesBannerList, recommendList, hotList, trendList];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}
