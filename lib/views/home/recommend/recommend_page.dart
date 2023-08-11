import 'package:bilibili_bloc/blocs/home/home_bloc.dart';
import 'package:bilibili_bloc/models/videoItem_data_model.dart';
import 'package:bilibili_bloc/views/home/recommend/recommend_item_view.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_refresh_header.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        List<VideoItemDataModel> list = state.recommendList;
        print("list-length-recommend: ${list.length}");
        return EasyRefresh.builder(
          onRefresh: () async {
            print("下拉刷新-recommend");
            context.read<HomeBloc>().add(LoadDateEvent(refreshController: _easyRefreshController, style: RefreshStyle.recommend));
          },
          header: const CustomRefreshHeader(),
          controller: _easyRefreshController,
          childBuilder: (BuildContext context, ScrollPhysics physics) {
            return Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.w),
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: physics,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.w, // 上下两行间距
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.97,
                ),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  VideoItemDataModel model = list.elementAt(index);
                  return RecommendItemView(model: model);
                },
              ),
            );
          },
        );
      },
    );
  }
}
