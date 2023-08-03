import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_social_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_social_type.dart';

import '../../../gen/assets.gen.dart';

class ShareButtonsView extends StatelessWidget {
  const ShareButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 12.0, bottom: 8.0, right: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0, right: 8.0, left: 12.0),
              child: Text(
                "分享",
                style: TextStyle(fontSize: 17.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  _buidBtn("Facebook", Assets.images.home.facebook.image(width: 46.w, height: 46.w)),
                  _buidBtn("Twitter", Assets.images.home.twitter.image(width: 46.w, height: 46.w)),
                  _buidBtn("微信", Assets.images.home.weChat.image(width: 46.w, height: 46.w)),
                  _buidBtn("朋友圈", Assets.images.home.moments.image(width: 46.w, height: 46.w)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: Container(
                width: 1.sw,
                height: 1.w,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  _buidBtn("动态", Assets.images.home.windmill.image(width: 30.w, height: 30.w, color: Colors.pinkAccent),
                      c: Colors.grey[200]!),
                  _buidBtn("消息", Assets.images.home.mail.image(width: 24.w, height: 24.w, color: Colors.lightBlueAccent),
                      c: Colors.grey[200]!),
                  _buidBtn("复制链接", Assets.images.home.link.image(width: 24.w, height: 24.w, color: Colors.orangeAccent),
                      c: Colors.grey[200]!),
                  _buidBtn("更多", Icon(Icons.more_vert, size: 26.w, color: Colors.grey[500]), c: Colors.grey[200]!),
                  _buidBtn("稍后再看", Assets.images.mine.laterView.image(width: 24.w, height: 24.w, color: Colors.orangeAccent),
                      c: Colors.grey[200]!),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: Container(
                height: 5.w,
                width: 1.sw,
                color: Colors.grey[200],
              ),
            ),
            GFButton(
              color: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
            }, fullWidthButton: true, child: Text("取 消", style: TextStyle(fontSize: 19.sp),),)
          ],
        ),
      ),
    ));
  }

  Widget _buidBtn(String text, Widget w, {Color c = Colors.transparent}) {
    double width = 46.w;
    return Padding(
      padding: EdgeInsets.only(right: 18.w),
      child: Column(
        children: [
          GFIconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            color: c,
            icon: w,
            shape: GFIconButtonShape.circle,
            iconSize: width,
          ),
          SizedBox(
            height: 3.w,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14.sp, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
