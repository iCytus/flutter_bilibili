import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'blocs/home/home_bloc.dart';
import 'blocs/video_play/video_play_bloc.dart';
import 'blocs/bottom_tab/bottom_tab_cubit.dart';
import 'blocs/locale/locale_cubit.dart';
import 'blocs/login/login_bloc.dart';
import 'blocs/theme/custom_theme_cubit.dart';
import 'config/share_pre_keys.dart';
import 'utils/shared_pre_utils.dart';
import 'views/home/home_page.dart';
import 'widgets/simple_widget.dart';
import 'config/custom_colors.dart';
import 'gen/assets.gen.dart';
import 'generated/l10n.dart';
import 'routers/routers.dart';
import 'views/mine/mine_page.dart';
import 'views/trends/trends_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory(); // from path provider
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
  bool? isAgree = await SharedPreUtils.getBool(SharePreKeys.userAgree);
  if (isAgree != null && isAgree) {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://2f715eef37f2e089eb0e4fbe27cb1d1f@o4505741678346240.ingest.sentry.io/4505741681950720';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(MyApp()),
    );
  } else {
    runApp(const InitMyApp());
  }
  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = 'https://2f715eef37f2e089eb0e4fbe27cb1d1f@o4505741678346240.ingest.sentry.io/4505741681950720';
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );
}

// 用于隐私权限弹窗确认前
class InitMyApp extends StatelessWidget {
  const InitMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: Container(
                width: 1.sw - 80.w,
                height: 250.w,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.w))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.w,
                    ),
                    Text(
                      "个人信息保护提示",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Container(
                      height: 100.w,
                      margin: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: ScrollConfiguration(
                        behavior: EUMNoScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "我们非常重视您的个人信息保护。关于个人信息收集和使用的详细信息，在使用氢信企业版前，请您认真查阅",
                                style: TextStyle(fontSize: 16.sp, color: Colors.black, height: 1.3, fontFamily: "SourceHanSansSC")),
                            TextSpan(
                                text: "《隐私政策》",
                                style: TextStyle(fontSize: 16.sp, color: Colors.blue, height: 1.3, fontFamily: "SourceHanSansSC"),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("隐私政策");
                                  }),
                            TextSpan(
                                text: "及",
                                style: TextStyle(fontSize: 16.sp, color: Colors.black, height: 1.3, fontFamily: "SourceHanSansSC")),
                            TextSpan(
                                text: "《用户协议》",
                                style: TextStyle(fontSize: 16.sp, color: Colors.blue, height: 1.3, fontFamily: "SourceHanSansSC"),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("用户协议");
                                  }),
                            TextSpan(
                                text: "您同意并接受全部条款后再使用我们的服务。",
                                style: TextStyle(fontSize: 16.sp, color: Colors.black, height: 1.3, fontFamily: "SourceHanSansSC")),
                          ])),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        SizedBox(
                          width: 36.w,
                        ),
                        TextButton(
                            onPressed: () {
                              print("不同意");
                            },
                            child: Text(
                              "不同意",
                              style: TextStyle(fontSize: 14.sp, color: Colors.black),
                            ),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(90.w, 40.w)),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                side: MaterialStateProperty.all(BorderSide(width: 1.w, color: Colors.grey)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w))))),
                        Flexible(child: Container()),
                        TextButton(
                          onPressed: () async {
                            print("同意");
                            await SharedPreUtils.setBool(SharePreKeys.userAgree, true);
                            await SentryFlutter.init(
                              (options) {
                                options.dsn =
                                    'https://2f715eef37f2e089eb0e4fbe27cb1d1f@o4505741678346240.ingest.sentry.io/4505741681950720';
                                // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
                                // We recommend adjusting this value in production.
                                options.tracesSampleRate = 1.0;
                              },
                              appRunner: () => runApp(MyApp()),
                            );
                          },
                          child: Text(
                            "同意",
                            style: TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(90.w, 40.w)),
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)))),
                        ),
                        SizedBox(
                          width: 36.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _getTheme(CustomThemeMode themeMode) {
    switch (themeMode) {
      case CustomThemeMode.system:

        /// Checks system brightness when user selects system theme mode
        final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
        // return brightness == Brightness.light
        //     ? ThemeData.light()
        //     : ThemeData.dark();
        return brightness == Brightness.light ? CustomThemeConfig.biliWhiteData : CustomThemeConfig.biliBlackData;
      case CustomThemeMode.light:
        // return ThemeData.light();
        return CustomThemeConfig.biliWhiteData;
      case CustomThemeMode.dark:
        // return ThemeData.dark();
        return CustomThemeConfig.biliBlackData;
      case CustomThemeMode.pink:
        return CustomThemeConfig.biliPinkData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginBloc()),
              BlocProvider(create: (context) => CustomThemeCubit()),
              BlocProvider(create: (context) => HomeBloc()),
              BlocProvider(create: (context) => LocaleCubit()),
              BlocProvider(create: (context) => VideoPlayBloc()),
            ],
            child: BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return BlocBuilder<CustomThemeCubit, CustomThemeMode>(
                  builder: (context, state) {
                    print("localestate.locale: ${locale.toString()}");
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      routerConfig: routers,

                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        S.delegate,
                      ],
                      locale: locale,
                      // supportedLocales: const [
                      //   Locale('zh', 'CN'), // 中文简体
                      //   Locale('en', ''), // 美国英语
                      // ],
                      supportedLocales: S.delegate.supportedLocales,
                      // localeResolutionCallback: (locale, supportedLocales) {
                      //   // 如果语言是英语
                      //   if (locale?.languageCode == 'en') {
                      //     //注意大小写，返回美国英语
                      //     return const Locale('en', 'US');
                      //   } else {
                      //     return locale;
                      //   }
                      // },
                      // theme: ThemeData(primarySwatch: createMaterialColor(const Color.fromRGBO(251, 114, 153, 1)), fontFamily: "Alibaba"),
                      theme: _getTheme(state),
                      builder: FlutterSmartDialog.init(builder: (context, widget) {
                        return MediaQuery(
                          /// Setting font does not change with system font size
                          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: widget!,
                        );
                      }),
                    );
                  },
                );
              },
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> tabBodies = const [
    HomePage(),
    TrendsPage(),
    MinePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(
        icon: Assets.images.home.homeUnpicked.image(width: 20.w, height: 20.w, fit: BoxFit.contain),
        activeIcon: Assets.images.home.homePicked.image(width: 20.w, height: 20.w, fit: BoxFit.contain),
        label: S.of(context).homepage,
      ),
      BottomNavigationBarItem(
        icon: Assets.images.home.trendsUnpicked.image(width: 20.w, height: 20.w, fit: BoxFit.contain),
        activeIcon: Assets.images.home.trendsPicked.image(width: 20.w, height: 20.w, fit: BoxFit.contain),
        label: S.of(context).trendspage,
      ),
      BottomNavigationBarItem(
        icon: Assets.images.home.mineUnpicked.image(width: 20.w, height: 20.w, fit: BoxFit.contain),
        activeIcon: Assets.images.home.minePicked.image(width: 20.w, height: 20.w, fit: BoxFit.contain),
        label: S.of(context).minepage,
      ),
    ];

    final selectedTab = context.select((BottomTabCubit bloc) => bloc.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: tabBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: selectedTab.index,
        selectedItemColor: const Color.fromRGBO(251, 114, 153, 1),
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        onTap: (index) {
          final tab = BottomTab.values.elementAt(index);

          context.read<BottomTabCubit>().setTab(tab);
          print("tab-index: $index current-index: ${selectedTab.index}");
          if (selectedTab.index == index && [0, 1].contains(index)) {
            context.read<HomeBloc>().add(const RemindRefreshEvent());
          }
        },
      ),
    );
  }
}
