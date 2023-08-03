import 'package:bilibili_bloc/views/trends/trend_comprehensive_page.dart';
import 'package:bilibili_bloc/views/trends/trend_videos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

import '../../blocs/home/home_bloc.dart';
import '../../generated/l10n.dart';

class TrendsPage extends StatefulWidget {
  const TrendsPage({super.key});

  @override
  State<TrendsPage> createState() => _TrendsPageState();
}

class _TrendsPageState extends State<TrendsPage> {
  @override
  Widget build(BuildContext context) {
    List list = [S.current.videos, S.current.all];
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: list.length,
          initialIndex: 1,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 0),
                child: TabBar(
                  onTap: (index) {
                    print("index：$index");
                  },
                  padding: EdgeInsets.zero,
                  enableFeedback: true,
                  tabs: list
                      .map((e) => Tab(
                            height: 44,
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 21.sp),
                            ),
                          ))
                      .toList(),
                  // labelColor: const Color.fromRGBO(251, 114, 153, 1),
                  // unselectedLabelColor: Colors.black,
                  indicator: TabBarGradientIndicator(
                      gradientColor: [Theme.of(context).tabBarTheme.indicatorColor!, Theme.of(context).tabBarTheme.indicatorColor!],
                      indicatorWidth: 4),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                TrendVideosPage(),
                TrendComprehensivePage(),
              ],
            ),
          ),
        );
      },
    );
  }
}
