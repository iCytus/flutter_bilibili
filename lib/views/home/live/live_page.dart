import 'package:bilibili_bloc/models/live_banner_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import '../../../blocs/home/home_bloc.dart';
import '../../../models/live_data_model.dart';
import '../../../widgets/custom_refresh_header.dart';
import 'live_item_view.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final EasyRefreshController _easyRefreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        List<LiveDataModel> list = state.livesList;
        //print("list-length-live: ${list.length}");
        return EasyRefresh.builder(
          onRefresh: () async {
            print("下拉刷新-live");
            context.read<HomeBloc>().add(LoadDataEvent(refreshController: _easyRefreshController, style: RefreshStyle.live));
          },
            header: const CustomRefreshHeader(),
          controller: _easyRefreshController,
          refreshOnStart: list.isEmpty ? true : false,
          childBuilder: (BuildContext context, ScrollPhysics physics) {
            List<LiveBannerDataModel> ll = state.livesBannerList;
            List<LiveDataModel> list = state.livesList;
            return Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.w),
              child: ListView(
                physics: physics,
                children: [
                  ll.isNotEmpty
                      ? GFCarousel(
                          items: ll.map((e) {
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
                              child: CachedNetworkImage(
                                imageUrl: e.pic,
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                          viewportFraction: 1.0,
                          autoPlay: true,
                          pagerSize: 4.w,
                          hasPagination: true,
                          passiveIndicator: Colors.grey,
                          activeIndicator: Colors.orange,
                          aspectRatio: 390 / 71,
                        )
                      : const SizedBox(),
                  SizedBox(height: 8.w,),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.w, // 上下两行间距
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      LiveDataModel model = list.elementAt(index);
                      return LiveItemView(model: model,);
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
