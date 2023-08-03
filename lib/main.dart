import 'package:bilibili_bloc/blocs/bottom_tab/bottom_tab_cubit.dart';
import 'package:bilibili_bloc/blocs/locale/locale_cubit.dart';
import 'package:bilibili_bloc/blocs/login/login_bloc.dart';
import 'package:bilibili_bloc/blocs/theme/custom_theme_cubit.dart';
import 'package:bilibili_bloc/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/home/home_bloc.dart';
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
  runApp(const MyApp());
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
                      builder: FlutterSmartDialog.init(),
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
          // print("tab-name: ${tab.title}");
          context.read<BottomTabCubit>().setTab(tab);
        },
      ),
    );
  }
}


