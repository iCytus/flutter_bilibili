import 'dart:convert';


import 'package:bilibili_bloc/widgets/test_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import '../../blocs/home/home_bloc.dart';
import '../../config/share_pre_keys.dart';
import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../../utils/shared_pre_utils.dart';
import '../../views/home/recommend/recommend_page.dart';
import '../../blocs/bottom_tab/bottom_tab_cubit.dart';
import '../../blocs/locale/locale_cubit.dart';
import '../../blocs/login/login_bloc.dart';
import '../../models/user_model.dart';
import '../../widgets/simple_widget.dart';
import 'hot/hot_page.dart';
import 'live/live_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late UserModel u;
  @override
  void initState() {
    super.initState();
    // todo: 查找本地是否存在已登陆用户
    queryLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    List list = [S.current.live, S.current.recommended, S.current.hot];
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: DefaultTabController(
        length: list.length,
        initialIndex: 1,
        child: Scaffold(
          // backgroundColor: Theme.of(context).highlightColor,
          appBar: AppBar(
            //backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            titleSpacing: 0,
            title: Container(
              width: 1.sw,
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
                    builder: (context, state) {
                      print("state-64: $state");
                      return GestureDetector(
                          onTap: () {
                            if (state.user != null || state is LoginComplete) {
                              final tab = BottomTab.values.elementAt(2);
                              context.read<BottomTabCubit>().setTab(tab);
                            } else {
                              showLoginModal(context);
                            }
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.w)),
                              child: state.user != null || state is LoginComplete
                                  ? GFAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(state.user!.avatar, maxWidth: 22.w.toInt(), maxHeight: 22.w.toInt()),
                                      size: 22.w,
                                    )
                                  : Assets.images.home.loginHomepage.image(width: 28.w, height: 28.w),
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: const Color.fromRGBO(235, 235, 235, 1), borderRadius: BorderRadius.circular(18.w)),
                      height: 36.w,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 20.w,
                            color: Colors.grey,
                          ),
                          Text(
                            "好好学习",
                            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.mail_outline,
                        size: 20.w,
                        color: Theme.of(context).iconTheme.color,
                      ))
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 32),
              child: TabBar(
                onTap: (index) {
                  print("index：$index");
                },
                padding: EdgeInsets.zero,
                enableFeedback: true,
                tabs: list
                    .map((e) => Tab(
                          text: e,
                          height: 32,
                        ))
                    .toList(),
                // labelColor: const Color.fromRGBO(251, 114, 153, 1),
                // unselectedLabelColor: Colors.black,
                indicator: TabBarGradientIndicator(gradientColor: [Theme.of(context).tabBarTheme.indicatorColor!, Theme.of(context).tabBarTheme.indicatorColor!], indicatorWidth: 4),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              LivePage(),
              RecommendPage(),
              HotPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()  async {
              /* 语言切换
              var locale = Localizations.localeOf(context);
              print("locale: ${locale.languageCode}");
              if (locale.languageCode == "zh") {
                context.read<LocaleCubit>().changeLocale(const Locale('en', 'US'));
              } else {
                context.read<LocaleCubit>().changeLocale(const Locale('zh'));
              }
              */
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TestPage();
              }));
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  queryLocalUser() async {
    String? userString = await SharedPreUtils.getString(SharePreKeys.userInfo);
    print("user-info: $userString");
    if (userString != null) {
      Map<String, dynamic> data = jsonDecode(userString);
      UserModel model = UserModel.fromJson(data);
      u = model;
      context.read<LoginBloc>().add(UserLoginEvent(model: model));
    }
  }
}
