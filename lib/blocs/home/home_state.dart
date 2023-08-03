part of 'home_bloc.dart';

enum RefreshStatus { initial, success, failure }

class HomeState extends Equatable {
  late List<LiveDataModel> livesList;
  late List<LiveBannerDataModel> livesBannerList;
  late List<VideoItemDataModel> recommendList;
  late List<HotDataModel> hotList;
  late List<TrendDataModel> trendList;
  HomeState({this.livesList = const [], this.livesBannerList = const [], this.recommendList = const [], this.hotList = const [], this.trendList = const []});

  HomeState copyWith({
    List<LiveDataModel>? livesList,
    List<LiveBannerDataModel>? livesBannerList,
    List<VideoItemDataModel>? recommendList,
    List<HotDataModel>? hotList,
    List<TrendDataModel>? trendList
  }) {
    return HomeState(
        livesList: livesList ?? this.livesList,
        livesBannerList: livesBannerList ?? this.livesBannerList,
        recommendList: recommendList ?? this.recommendList,
        hotList: hotList ?? this.hotList,
        trendList: trendList ?? this.trendList
    );
  }

  @override
  List<Object> get props => [livesList, livesBannerList, recommendList, hotList, trendList];
}

class HomeInitial extends HomeState {}

