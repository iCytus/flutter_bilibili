import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import '../../generated/l10n.dart';

class SetUpPage extends StatelessWidget {
  SetUpPage({super.key});

  List<Map<String, Function>> list = [
    {S.current.account: () {}},
    {S.current.private: () {}},
    {S.current.receivingInformation: () {}},
    {S.current.splash: () {}},
    {S.current.recommendSetup: () {}},
    {S.current.play: () {}},
    {S.current.cache: () {}},
    {S.current.binge: () {}},
    {S.current.message: () {}},
    {S.current.push: () {}},
    {S.current.other: () {}},
    {S.current.timingClosure: () {}},
    {S.current.sleepReminder: () {}},
    {S.current.darkSetting: () {}},
    {S.current.feedback: () {}},
    {S.current.about: () {}},
    {S.current.cooperation: () {}},
    {S.current.userAgreement: () {}},
    {S.current.privacyPolicy: () {}},
    {S.current.permission: () {}},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.settings),
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 8.w,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var m = list.elementAt(index);
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 40.w,
                  width: 1.sw,
                  color: Theme.of(context).cardColor,
                  child: GestureDetector(
                    onTap: m.values.first(),
                    child: Row(
                      children: [
                        Text(m.keys.first),
                        const Expanded(child: SizedBox()),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 20.w,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                switch (index) {
                  case 0:
                  case 2:
                  case 7:
                  case 10:
                  case 12:
                  case 13:
                  case 16:
                    return SizedBox(
                      height: 8.w,
                    );
                }
                return Container();
              },
              itemCount: list.length),
          SizedBox(
            height: 8.w,
          ),
          GFButton(
            text: "退出登录",
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
            fullWidthButton: true,
            color: Theme.of(context).cardColor,
          )
        ],
      ),
    );
  }
}
