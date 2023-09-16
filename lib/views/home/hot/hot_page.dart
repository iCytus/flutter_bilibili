import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/home/home_bloc.dart';
import '../../../widgets/custom_refresh_header.dart';
import 'hot_item_view.dart';

class HotPage extends StatefulWidget {
  const HotPage({super.key});

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, current) {
        print("prev.refreshStyle:${prev.refreshStyle} - current.refreshStyle:${current.refreshStyle}");
        return prev.refreshStyle != current.refreshStyle;
      },
      builder: (BuildContext context, state) {
        List<HotDataModel> list = state.hotList;
        print("list-length-hot: ${state.runtimeType}");
        //print("list-length-hot: ${list.length}");
        // print("点击后的-30: ${context.read<HomeBloc>().state.refreshStyle}");
        return Scaffold(
          // backgroundColor: Colors.white,
          body: EasyRefresh.builder(
            onRefresh: () async {
              print("下拉刷新-hot");
              context.read<HomeBloc>().add(LoadDataEvent(refreshController: _easyRefreshController, style: RefreshStyle.hot));
            },
            header: const CustomRefreshHeader(),
            controller: _easyRefreshController,
            refreshOnStart: list.isEmpty ? true : false,
            childBuilder: (BuildContext context, ScrollPhysics physics) {
              return Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: physics,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    HotDataModel model = list.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(const RemindRefreshEvent());
                      },
                      child: HotItemView(
                          model: model
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey[400],
                    indent: 6.w,
                    height: 0.5.w,
                  );
                },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
