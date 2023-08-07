import 'dart:async';

import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:bilibili_bloc/models/live_data_model.dart';
import 'package:bilibili_bloc/models/videoItem_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:equatable/equatable.dart';

import '../../config/test_data.dart';
import '../../models/live_banner_data_model.dart';
import '../../models/trend_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadDateEvent>((event, emit) {
      _loadMoreData(event, emit);
    });
  }

  Future<void> _loadMoreData(LoadDateEvent event, Emitter<HomeState> emit) async {
    try {
      switch (event.style) {
        case RefreshStyle.live:
          _getMoreLiveData(event.refreshController!);
          break;
        case RefreshStyle.recommend:
          _getMoreRecommendData(event.refreshController!);
          break;
        case RefreshStyle.hot:
          _getMoreHotData(event.refreshController!);
          break;
        case RefreshStyle.comprehensive:
          _getMoreTrendVideosData(event.refreshController!);
          break;
        default:
          break;
      }
    } catch (e) {
      print("error: $e");
    }
  }

  // 直播
  _getMoreLiveData(EasyRefreshController easyRefreshController) async {
    List<LiveDataModel> list = liveDataList.map((e) {
      return LiveDataModel.fromJson(e);
    }).toList();

    List<LiveBannerDataModel> ll = liveBannerDataList.map((e) {
      return LiveBannerDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(livesList: state.livesList.toList()..addAll(list), livesBannerList: ll));
    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }

  // 首页推荐
  _getMoreRecommendData(EasyRefreshController easyRefreshController) async {
    List<VideoItemDataModel> list = recommendDataList.map((e) {
      return VideoItemDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(recommendList: state.recommendList.toList()..addAll(list)));

    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }

  // 热门
  _getMoreHotData(EasyRefreshController easyRefreshController) async {
    List<HotDataModel> list = hotDataList.map((e) {
      return HotDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(hotList: state.hotList.toList()..addAll(list)));
    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }

  // 动态
  _getMoreTrendVideosData(EasyRefreshController easyRefreshController) async {
    List<TrendDataModel> list = trendsDataList.map((e) {
      return TrendDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(trendList: state.trendList.toList()..addAll(list)));
    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }
}
