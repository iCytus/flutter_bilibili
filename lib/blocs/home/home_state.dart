part of 'home_bloc.dart';

enum RefreshStatus { initial, success, failure }

class HomeState extends Equatable {
  final List<LiveDataModel> livesList;
  final List<LiveBannerDataModel> livesBannerList;
  final List<VideoItemDataModel> recommendList;
  final List<HotDataModel> hotList;
  final List<TrendDataModel> trendList;
  final RefreshStyle refreshStyle;
  const HomeState({
    this.refreshStyle = RefreshStyle.recommend,
    this.livesList = const [],
    this.livesBannerList = const [],
    this.recommendList = const [],
    this.hotList = const [],
    this.trendList = const [],
  });

  HomeState copyWith({
    RefreshStyle? refreshStyle,
    List<LiveDataModel>? livesList,
    List<LiveBannerDataModel>? livesBannerList,
    List<VideoItemDataModel>? recommendList,
    List<HotDataModel>? hotList,
    List<TrendDataModel>? trendList,
  }) {
    return HomeState(
      livesList: livesList ?? this.livesList,
      livesBannerList: livesBannerList ?? this.livesBannerList,
      recommendList: recommendList ?? this.recommendList,
      hotList: hotList ?? this.hotList,
      trendList: trendList ?? this.trendList,
      refreshStyle: refreshStyle ?? this.refreshStyle
    );
  }

  @override
  List<Object> get props => [livesList, livesBannerList, recommendList, hotList, trendList, refreshStyle];
}
