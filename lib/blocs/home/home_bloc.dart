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
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<LoadDataEvent>((event, emit) {
      _loadMoreData(event, emit);
    });
    on<RemindRefreshEvent>((event, emit) {
      print("点击同一个tab时：${state.runtimeType}");

    });
  }

  Future<void> _loadMoreData(LoadDataEvent event, Emitter<HomeState> emit) async {
    print("event.style： ${event.style}");
    try {
      switch (event.style) {
        case RefreshStyle.live:
          _getMoreLiveData(event.refreshController!, event.style!);
          break;
        case RefreshStyle.recommend:
          _getMoreRecommendData(event.refreshController!, event.style!);
          break;
        case RefreshStyle.hot:
          _getMoreHotData(event.refreshController!, event.style!);
          break;
        case RefreshStyle.comprehensive:
          _getMoreTrendVideosData(event.refreshController!, event.style!);
          break;
        default:
          break;
      }
    } catch (e) {
      print("error: $e");
    }
  }

  // 直播
  _getMoreLiveData(EasyRefreshController easyRefreshController, RefreshStyle style) async {
    List<LiveDataModel> list = liveDataList.map((e) {
      return LiveDataModel.fromJson(e);
    }).toList();

    List<LiveBannerDataModel> ll = liveBannerDataList.map((e) {
      return LiveBannerDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      style: style,
      livesList: state.livesList.toList()..addAll(list),
      livesBannerList: ll,
    ));
    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }

  // 首页推荐
  _getMoreRecommendData(EasyRefreshController easyRefreshController, RefreshStyle style) async {
    List<VideoItemDataModel> list = recommendDataList.map((e) {
      return VideoItemDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      style: style,
      recommendList: state.recommendList.toList()..addAll(list),
    ));

    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }

  // 热门
  _getMoreHotData(EasyRefreshController easyRefreshController, RefreshStyle style) async {
    List<HotDataModel> list = hotDataList.map((e) {
      return HotDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    print("_getMoreHotData-style: $style");
    emit(state.copyWith(
      style: style,
      hotList: state.hotList.toList()..addAll(list),
    ));
    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
    //print("完成刷新后的state.style: ${state.style}");
  }

  // 动态
  _getMoreTrendVideosData(EasyRefreshController easyRefreshController, RefreshStyle style) async {
    List<TrendDataModel> list = trendsDataList.map((e) {
      return TrendDataModel.fromJson(e);
    }).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      style: style,
      trendList: state.trendList.toList()..addAll(list),
    ));
    easyRefreshController.finishRefresh();
    easyRefreshController.resetFooter();
  }
}
