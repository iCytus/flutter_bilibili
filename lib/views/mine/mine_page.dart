import 'package:bilibili_bloc/blocs/login/login_bloc.dart';
import 'package:bilibili_bloc/blocs/theme/custom_theme_cubit.dart';
import 'package:bilibili_bloc/config/custom_colors.dart';
import 'package:bilibili_bloc/routers/routers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../../widgets/custom_refresh_header.dart';
import '../../widgets/simple_widget.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List<Map<String, dynamic>> alist = [
    {"联系客服": Assets.images.mine.customerService.image(width: 20.w, height: 20.w)},
    {"设置": Assets.images.mine.setup.image(width: 20.w, height: 20.w)},
    {"我的钱包": Assets.images.mine.wallet.image(width: 20.w, height: 20.w)},
    {"稿件管理": Assets.images.mine.videoManagement.image(width: 20.w, height: 20.w)},
    {"我的NFT": Assets.images.mine.nft.image(width: 20.w, height: 20.w)},
  ];

  late EasyRefreshController _controller;
  late List<Function> functions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
    );
    functions = [
      go2page,
      go2page,
      go2page,
      go2page,
      go2page,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            actions: [
              SizedBox(
                width: 40.w,
                height: 30.w,
                child: GFButton(
                    padding: EdgeInsets.zero,
                    color: Colors.transparent,
                    onPressed: () async {
                      //String? result = await context.pushNamed(RouteName.scanPage);
                      //print("扫码结果: $result");
                    },
                    child: Assets.images.mine.qrscan.image(width: 22.w, height: 22.w, color: Theme.of(context).iconTheme.color)),
              ),
              SizedBox(
                  width: 40.w,
                  height: 30.w,
                  child: GFButton(
                      color: Colors.transparent,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.pushNamed(RouteName.themePage);
                      },
                      child: Assets.images.mine.themeColor.image(width: 22.w, height: 22.w, color: Theme.of(context).iconTheme.color))),
              SizedBox(
                  width: 40.w,
                  height: 30.w,
                  child: BlocBuilder<CustomThemeCubit, CustomThemeMode>(
                    builder: (context, state) {
                      return GFButton(
                          color: Colors.transparent,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Map<String, dynamic>? data = HydratedBloc.storage.read("CustomThemeCubit");
                            if (data != null) {
                              CustomThemeMode? m = context.read<CustomThemeCubit>().fromJson(data);
                              if (m != null) {
                                if (m == CustomThemeMode.dark) {
                                  context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.light);
                                  return;
                                } else if (m == CustomThemeMode.light) {
                                  context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.dark);
                                  return;
                                } else {
                                  context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.light);
                                  return;
                                }
                              }
                            }
                            context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.system);
                          },
                          child: Assets.images.mine.moon.image(width: 20.w, height: 20.w, color: Theme.of(context).iconTheme.color));
                    },
                  ))
            ],
          ),
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                width: 1.sw,
                height: 180.w,
                color: Theme.of(context).primaryColor,
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        state.user != null || state is LoginComplete
                            ? ListTile(
                                leading: GFAvatar(
                                  backgroundImage: CachedNetworkImageProvider(state.user!.avatar),
                                  size: 36.w,
                                ),
                                title: Text(
                                  state.user!.name,
                                  style: TextStyle(fontSize: 24.sp),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    // 个人空间
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_right_outlined),
                                ),
                              )
                            : ListTile(
                                leading: GFAvatar(
                                    backgroundColor: Colors.grey[300], backgroundImage: Assets.images.mine.defaultAvatar.image().image),
                                title: Text(
                                  "点击登录",
                                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                                ),
                                trailing: GestureDetector(
                                  child: Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: Colors.grey[400],
                                  ),
                                  onTap: () {
                                    showLoginModal(context);
                                  },
                                ),
                                onTap: () {
                                  showLoginModal(context);
                                },
                              ),
                        SizedBox(
                          height: 5.w,
                        ),
                        SizedBox(
                          height: 50.w,
                          width: 1.sw,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    state.user != null || state is LoginComplete ? Text("${state.user!.trendsCount}") : const Text("-"),
                                    SizedBox(
                                      height: 3.w,
                                    ),
                                    Text(S.current.Posts),
                                    const Spacer()
                                  ],
                                ),
                              ),
                              Container(
                                width: 1.w,
                                height: 15.w,
                                color: Colors.grey[300],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    state.user != null || state is LoginComplete ? Text("${state.user!.attentionsCount}") : const Text("-"),
                                    SizedBox(
                                      height: 3.w,
                                    ),
                                    Text(S.current.following),
                                    const Spacer()
                                  ],
                                ),
                              ),
                              Container(
                                width: 1.w,
                                height: 15.w,
                                color: Colors.grey[300],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    state.user != null || state is LoginComplete ? Text("${state.user!.fansCount}") : const Text("-"),
                                    SizedBox(
                                      height: 3.w,
                                    ),
                                    Text(S.current.followers),
                                    const Spacer()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Container(
                            decoration:
                                BoxDecoration(color: const Color.fromRGBO(255, 182, 193, 1), borderRadius: BorderRadius.circular(6.w)),
                            child: ListTile(
                              title: const Text(
                                "我的大会员",
                                style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                "了解更多会员权益",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                              leading: Assets.images.mine.vipCenter.image(width: 36.w, height: 36.w),
                              trailing: SizedBox(
                                width: 80.w,
                                child: Row(
                                  children: const [
                                    Spacer(),
                                    Text("立即开通", style: TextStyle(color: Colors.pinkAccent)),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.pinkAccent,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 1.sh - 180.w - kBottomNavigationBarHeight - MediaQuery.of(context).padding.top - kToolbarHeight - 5,
                child: EasyRefresh.builder(
                    controller: _controller,
                    onRefresh: () async {
                      //print("下拉刷新");
                      await Future.delayed(const Duration(seconds: 2));
                      _controller.finishRefresh();
                      _controller.resetFooter();
                    },
                    header: const CustomRefreshHeader(),
                    childBuilder: (context, physics) {
                      return ListView(
                        physics: physics,
                        children: [
                          SizedBox(
                            width: 1.sw,
                            height: 64.w,
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Assets.images.mine.offlineCache.image(width: 26.w, height: 26.w),
                                      const Text(
                                        "离线缓存",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Assets.images.mine.history.image(width: 26.w, height: 26.w),
                                      const Text(
                                        "浏览记录",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Assets.images.mine.myCollection.image(width: 26.w, height: 26.w),
                                      const Text(
                                        "我的收藏",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Assets.images.mine.laterView.image(width: 26.w, height: 26.w),
                                      const Text(
                                        "稍后再看",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                            child: Text("更多服务", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0, right: 10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: alist.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> data = alist.elementAt(index);
                                  Function f = functions.elementAt(index);
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    title: Transform(
                                      transform: Matrix4.translationValues(-20, 0.0, 0.0),
                                      child: Text(
                                        data.keys.first,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    leading: data.values.first,
                                    trailing: Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      size: 20.w,
                                    ),
                                    onTap: () {
                                      f();
                                    },
                                  );
                                }),
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  void go2page() {
    context.pushNamed(RouteName.setupPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
