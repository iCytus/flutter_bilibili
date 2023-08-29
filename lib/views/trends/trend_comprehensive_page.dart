import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/home/home_bloc.dart';
import '../../models/trend_data_model.dart';
import '../../widgets/custom_refresh_header.dart';
import 'trend_item_view.dart';

class TrendComprehensivePage extends StatefulWidget {
  const TrendComprehensivePage({super.key});

  @override
  State<TrendComprehensivePage> createState() => _TrendComprehensivePageState();
}

class _TrendComprehensivePageState extends State<TrendComprehensivePage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,

  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      List<TrendDataModel> list = state.trendList;
      return EasyRefresh.builder(
          onRefresh: () async {
            print("下拉刷新-Comprehensive");
            context.read<HomeBloc>().add(LoadDateEvent(refreshController: _easyRefreshController, style: RefreshStyle.comprehensive));
          },
          header: const CustomRefreshHeader(),
          controller: _easyRefreshController,
          childBuilder: (BuildContext context, ScrollPhysics physics) {
            return ListView.separated(
              physics: physics,
              itemCount: list.length,
              itemBuilder: (context, index) {
                TrendDataModel model = list.elementAt(index);
                return TrendCustomView(
                  model: model,
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 7.w,
                color: Colors.transparent,
              );
            },);
          });
    });
  }
}
