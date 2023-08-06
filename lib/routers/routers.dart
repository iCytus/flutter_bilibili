import 'package:bilibili_bloc/blocs/login/login_bloc.dart';
import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:bilibili_bloc/views/login/login_input_page.dart';
import 'package:bilibili_bloc/views/login/msg_verify_code_page.dart';
import 'package:bilibili_bloc/views/mine/scan_page.dart';
import 'package:bilibili_bloc/views/mine/set_theme_page.dart';
import 'package:bilibili_bloc/views/mine/setup_page.dart';
import 'package:bilibili_bloc/views/plays/video_play_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../blocs/bottom_tab/bottom_tab_cubit.dart';
import '../config/default_data.dart';
import '../main.dart';
import '../models/videoItem_data_model.dart';

class RouteName {
  static const String main = "/";
  static const String tabs = "tabs";
  static const String home = "home"; // 首页
  static const String livePage = "live_page"; // 首页的直播
  static const String recommendPage = "recommend_page"; // 首页的推荐
  static const String hotPage = "hot_page"; // 首页的热门
  static const String trendsPage = "trends_page"; // 动态
  static const String minePage = "mine_page"; // 我的

  static const String loginPage = "login_page"; // 手机号登录页
  static const String msgCodePage = "msg_code_page"; // 验证码界面
  static const String searchPage = "search_page"; // 搜索页
  static const String messagePage = "message_page"; // 消息页
  static const String scanPage = "scan_page"; // 扫码界面
  static const String themePage = "theme_page"; // 颜色主题页
  static const String personalPage = "personal_page"; // 个人空间主页

  static const String videoPage = "video_page"; // 视频播放页

  static const String setupPage = "setup_page"; // 设置
}

final GoRouter routers = GoRouter(initialLocation: "/", routes: <RouteBase>[
  GoRoute(
      path: RouteName.main,
      name: RouteName.main,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => BottomTabCubit(),
          child: const MyHomePage(),
        );
      },
      routes: [
        GoRoute(
            path: RouteName.loginPage,
            name: RouteName.loginPage,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginInputPage();
            },
            routes: [
              GoRoute(
                  path: RouteName.msgCodePage,
                  name: RouteName.msgCodePage,
                  builder: (BuildContext context, GoRouterState state) {
                    String? words = state.queryParameters["code"];
                    String? phone = state.queryParameters["phone"];
                    return MsgVerifyCodePage(count: 6, phone: phone!, code: int.parse(words!));
                  })
            ]),
        GoRoute(path: RouteName.scanPage, name: RouteName.scanPage, builder: (context, state) {
          return const ScanPage();
        }),
        GoRoute(path: RouteName.themePage, name: RouteName.themePage, builder: (context, state) {
          return const SetThemePage();
        }),
        GoRoute(path: RouteName.setupPage, name: RouteName.setupPage, builder: (context, state) {
          return SetUpPage();
        }),
        GoRoute(path: RouteName.videoPage, name: RouteName.videoPage, builder: (context, state) {
          var v = state.extra;
          if (v is VideoItemDataModel) {
            return VideoPlayPage(model1: v,);
          } else if (v is HotDataModel) {
            return VideoPlayPage(model2: v,);
          }
          return VideoPlayPage();
        }),
      ])
], observers: [
  FlutterSmartDialog.observer
]);
