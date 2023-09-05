import 'package:bilibili_bloc/blocs/home/home_bloc.dart';
import 'package:bilibili_bloc/models/trend_data_model.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_refresh_header.dart';
import 'trend_item_view.dart';

class TrendVideosPage extends StatefulWidget {
  const TrendVideosPage({super.key});

  @override
  State<TrendVideosPage> createState() => _TrendVideosPageState();
}

class _TrendVideosPageState extends State<TrendVideosPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      List<TrendDataModel> list = state.trendList;
      List<TrendDataModel> videos = [];
      for (var u in list) {
        if (u.type == "DYNAMIC_TYPE_AV") {
          videos.add(u);
        }
      }
      return EasyRefresh.builder(
          onRefresh: () async {
            print("下拉刷新-videos");
            context.read<HomeBloc>().add(LoadDataEvent(refreshController: _easyRefreshController, style: RefreshStyle.comprehensive));
          },
          header: const CustomRefreshHeader(),
          controller: _easyRefreshController,
          childBuilder: (BuildContext context, ScrollPhysics physics) {
            return ListView.separated(
                physics: physics,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  TrendDataModel model = videos.elementAt(index);
                  return TrendCustomView(
                    model: model,
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 7.w,
                    color: Colors.grey[200],
                  );
            },);
          });
    });
  }
}
