import 'package:flutter/material.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';

class _Colours {
  static const Color app_main = Color(0xFF666666);

  static const Color transparent_80 = Color(0x80000000); //<!--204-->

  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);
  static const Color text_gray = Color(0xFF999999);

  static const Color divider = Color(0xffe5e5e5);

  static const Color gray_33 = Color(0xFF333333); //51
  static const Color gray_66 = Color(0xFF666666); //102
  static const Color gray_99 = Color(0xFF999999); //153
  static const Color common_orange = Color(0XFFFC9153); //252 145 83
  static const Color gray_ef = Color(0XFFEFEFEF); //153

  static const Color gray_f0 = Color(0xfff0f0f0); //<!--204-->
  static const Color gray_f5 = Color(0xfff5f5f5); //<!--204-->
  static const Color gray_cc = Color(0xffcccccc); //<!--204-->
  static const Color gray_ce = Color(0xffcecece); //<!--206-->
  static const Color green_1 = Color(0xff009688); //<!--204-->
  static const Color green_62 = Color(0xff626262); //<!--204-->
  static const Color green_e5 = Color(0xffe5e5e5); //<!--204-->
}

Map<String, Color> circleAvatarMap = {
  'A': Colors.blueAccent,
  'B': Colors.blue,
  'C': Colors.cyan,
  'D': Colors.deepPurple,
  'E': Colors.deepPurpleAccent,
  'F': Colors.blue,
  'G': Colors.green,
  'H': Colors.lightBlue,
  'I': Colors.indigo,
  'J': Colors.blue,
  'K': Colors.blue,
  'L': Colors.lightGreen,
  'M': Colors.blue,
  'N': Colors.brown,
  'O': Colors.orange,
  'P': Colors.purple,
  'Q': Colors.black,
  'R': Colors.red,
  'S': Colors.blue,
  'T': Colors.teal,
  'U': Colors.purpleAccent,
  'V': Colors.black,
  'W': Colors.brown,
  'X': Colors.blue,
  'Y': Colors.yellow,
  'Z': Colors.grey,
  '#': Colors.blue,
};

Map<String, Color> themeColorMap = {
  'gray': _Colours.gray_33,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.deepOrange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};

enum CustomThemeMode { system, light, dark, pink }

class CustomThemeConfig {
  static ThemeData get biliPinkData => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      primaryColor: const Color(0xffFB7299),
      primaryColorLight: const Color.fromRGBO(251, 114, 153, 1),
      primarySwatch: createMaterialColor(const Color.fromRGBO(251, 114, 153, 1)),
      navigationBarTheme: const NavigationBarThemeData(elevation: 0, backgroundColor: Color(0xffFB7299)),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white, elevation: 0),
      tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          //indicator: TabBarGradientIndicator(gradientColor: [Colors.white, Colors.white], indicatorWidth: 4),
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: "Alibaba",
      buttonTheme: const ButtonThemeData(height: 25, minWidth: 10, buttonColor: Color.fromRGBO(251, 114, 153, 1)));

  static ThemeData get biliWhiteData => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      primaryColor: const Color(0xffFFFFFf),
      primaryColorLight: const Color.fromRGBO(255, 255, 255, 1),
      primarySwatch: createMaterialColor(const Color.fromRGBO(255, 255, 255, 1)),
      navigationBarTheme: const NavigationBarThemeData(elevation: 0, backgroundColor: Color(0xffFB7299)),
      appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white, elevation: 0),
      tabBarTheme: const TabBarTheme(
          labelColor: Color.fromRGBO(251, 114, 153, 1),
          //indicator: TabBarGradientIndicator(gradientColor: [Color(0xffFB7299), Color(0xffFB7299)], indicatorWidth: 4),
          indicatorColor: Color.fromRGBO(251, 114, 153, 1),
          unselectedLabelColor: Colors.black26),
      iconTheme: const IconThemeData(color: Colors.grey),
      fontFamily: "Alibaba",
      buttonTheme: const ButtonThemeData(height: 25, minWidth: 10, buttonColor: Color.fromRGBO(251, 114, 153, 1)));

  static ThemeData get biliBlackData => ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(centerTitle: true, color: Color.fromRGBO(41, 41, 41, 1)),
      cardColor: Colors.black26,
      primaryColor: const Color(0xff000000),
      primaryColorDark: const Color.fromRGBO(0, 0, 0, 1),
      primarySwatch: createMaterialColor(const Color.fromRGBO(0, 0, 0, 1)),
      navigationBarTheme: const NavigationBarThemeData(elevation: 0, backgroundColor: Color.fromRGBO(41, 41, 41, 1)),
      bottomAppBarTheme: const BottomAppBarTheme(color: Color.fromRGBO(41, 41, 41, 1), elevation: 0),
      
      tabBarTheme: const TabBarTheme(
          labelColor: Color.fromRGBO(251, 114, 153, 1),
          indicatorColor: Color.fromRGBO(251, 114, 153, 1),
          unselectedLabelColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.grey),
      fontFamily: "Alibaba",
      buttonTheme: const ButtonThemeData(height: 25, minWidth: 10, buttonColor: Color.fromRGBO(251, 114, 153, 1)));
}

// HEX转Color
Color hexToColor(String? code) {
  //先判断是否符合#RRGGBB的要求如果不符合给一个默认颜色
  if (code == null || code == "" || code.length != 7) {
    return const Color(0xffFF1E1F); //定了一个默认的主题色常量
  }
  //rrggbb 获取到RRGGBB转成16进制 然后在加上FF的透明度
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

// 创造创建Material风格的color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

// 将Color转回HEX(默认透明度FF)
String? color2HEX(Object color) {
  if (color is Color) {
    // 0xFFFFFFFF
    //将十进制转换成为16进制 返回字符串但是没有0x开头
    String temp = color.value.toRadixString(16);
    color = "#" + temp.substring(2, 8);
  }
  return color.toString();
}
