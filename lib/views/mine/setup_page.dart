import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

class SetUpPage extends StatelessWidget {
  SetUpPage({super.key});


  List<Map<String, Function>> list = [
    {
      S.current.account: () {}
    },
    {
      S.current.private: () {}
    },
    {
      S.current.receivingInformation: () {}
    },
    {
      S.current.splash: () {}
    },
    {
      S.current.recommendSetup: () {}
    },
    {
      S.current.play: () {}
    },
    {
      S.current.cache: () {}
    },
    {
      S.current.binge: () {}
    },
    {
      S.current.message: () {}
    },
    {
      S.current.push: () {}
    },
    {
      S.current.other: () {}
    },
    {
      S.current.timingClosure: () {}
    },
    {
      S.current.sleepReminder: () {}
    },
    {
      S.current.darkSetting: () {}
    },
    {
      S.current.feedback: () {}
    },
    {
      S.current.about: () {}
    },
    {
      S.current.cooperation: () {}
    },
    {
      S.current.userAgreement: () {}
    },
    {
      S.current.privacyPolicy: () {}
    },
    {
      S.current.permission: () {}
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var m = list.elementAt(index);
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 28.w,
              width: 1.sw,
              child: GestureDetector(
                onTap: m.values.first(),
                child: Row(
                  children: [
                    Text(m.keys.first),
                    const Expanded(child: SizedBox()),
                    Icon(Icons.keyboard_arrow_right, size: 20.w,)
                  ],
                ),
              ),
            );
          },
          
          separatorBuilder: (context, index) {
            switch (index) {
              case 0:
              case 3:
              case 8:
              case 11:
              case 13:
              case 14:
                return SizedBox(height: 8.w,);
            }
            return Container();
          },
          itemCount: list.length),
    );
  }
}
