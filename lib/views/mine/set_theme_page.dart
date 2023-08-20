import 'package:bilibili_bloc/blocs/theme/custom_theme_cubit.dart';
import 'package:bilibili_bloc/config/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetThemePage extends StatefulWidget {
  const SetThemePage({super.key});

  @override
  State<SetThemePage> createState() => _SetThemePageState();
}

class _SetThemePageState extends State<SetThemePage> {
  String selectStr = "";


  @override
  Widget build(BuildContext context) {
    print("context.read<CustomThemeCubit>().state: ${context.read<CustomThemeCubit>().state.toString()}");
    selectStr = context.read<CustomThemeCubit>().state.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "设置主题",
          style: TextStyle(fontSize: 17.sp),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
        child: ListView(
          children: [
            Text("主题选择", style: TextStyle(fontSize: 14.sp)),
            ListTile(
              leading: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(color: const Color.fromRGBO(251, 114, 153, 1), borderRadius: BorderRadius.circular(2.w)),
                  ),
                  const Spacer(),
                ],
              ),
              title: Transform(
                  transform: Matrix4.translationValues(-20, 0.0, 0.0),
                  child: Text("少女粉", style: TextStyle(fontSize: 14.sp))),
              trailing: selectStr == "CustomThemeMode.pink" ? const Icon(Icons.check, color: Color.fromRGBO(251, 114, 153, 1),) : null,
              onTap: () {
                setState(() {
                  selectStr = "CustomThemeMode.pink";
                });
                context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.pink);
              },
            ),
            ListTile(
              leading: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2.w)),
                  ),
                  const Spacer(),
                ],
              ),
              title: Transform(
                  transform: Matrix4.translationValues(-20, 0.0, 0.0),
                  child: Text("简洁白", style: TextStyle(fontSize: 14.sp))),
              trailing: selectStr == "CustomThemeMode.light" ? const Icon(Icons.check, color: Color.fromRGBO(251, 114, 153, 1),) : null,
              onTap: () {
                setState(() {
                  selectStr = "CustomThemeMode.light";
                });
                context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.light);
              },
            ),
            ListTile(
              leading: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(2.w)),
                  ),
                  const Spacer(),
                ],
              ),
              title: Transform(
                  transform: Matrix4.translationValues(-20, 0.0, 0.0),
                  child: Text("主题黑", style: TextStyle(fontSize: 14.sp))),
              trailing: selectStr == "CustomThemeMode.dark" ? const Icon(Icons.check, color: Color.fromRGBO(251, 114, 153, 1),) : null,
              onTap: () {
                setState(() {
                  selectStr = "CustomThemeMode.dark";
                });
                context.read<CustomThemeCubit>().updateTheme(CustomThemeMode.dark);
              },
            )
          ],
        ),
      ),
    );
  }
}
