import 'package:bilibili_bloc/gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../routers/routers.dart';
import '../views/home/hot/share_buttons_view.dart';

// 登录modal
void showLoginModal(BuildContext context) {
  showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 1.sh / 2,
          width: 1.sw,
          padding: EdgeInsets.symmetric(vertical: 16.w),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(12.w))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "登录注册解锁更多精彩内容",
                    style: TextStyle(fontSize: 18.sp, fontFamily: "Alibaba"),
                  ),
                  SizedBox(
                    width: 1.sw - 100.w,
                    height: 40.w,
                    child: GFButton(
                      onPressed: () {
                        context.goNamed(RouteName.loginPage);
                      },
                      text: "使用手机登录",
                      textStyle: TextStyle(fontSize: 18.sp),
                      shape: GFButtonShape.standard,
                      // color: Theme.of(context).buttonTheme.getFocusColor(),
                    ),
                  ),
                  SizedBox(
                    width: 1.sw - 100.w,
                    height: 40.w,
                    child: GFButton(
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                      text: "使用FaceBook登录",
                      textStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
                      shape: GFButtonShape.standard,
                      color: Colors.white,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.grey[300]!, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.sw - 100.w,
                    height: 40.w,
                    child: GFButton(
                      icon: Assets.images.login.google.image(width: 21.0, height: 21.0),
                      onPressed: () {},
                      text: "使用Google登录",
                      textStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
                      shape: GFButtonShape.standard,
                      color: Colors.white,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.grey[300]!, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.sw - 100.w,
                    height: 40.w,
                    child: GFButton(
                      icon: Assets.images.login.apple.image(width: 24.0, height: 24.0),
                      onPressed: () {},
                      text: "使用Apple登录",
                      textStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
                      shape: GFButtonShape.standard,
                      color: Colors.white,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.grey[300]!, width: 1),
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                        text: "登录注册即代表你同意",
                        children: [
                          TextSpan(
                              text: "用户协议",
                              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 14.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  SmartDialog.showToast("用户协议");
                                }),
                          TextSpan(text: "、", style: TextStyle(fontSize: 14.sp)),
                          TextSpan(
                              text: "隐私政策",
                              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 14.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  SmartDialog.showToast("隐私政策");
                                })
                        ],
                        style: TextStyle(color: Colors.grey[500], fontSize: 14.sp)),
                  )
                ],
              ),
              Positioned(
                right: 8,
                top: 0,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    )),
              )
            ],
          ),
        );
      });
}

// 首页视频的更多按钮
void showMoreView(BuildContext context, String ownerName, String area, String channel) {
  showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 1.sh * 0.62,
          width: 1.sw,
          padding: EdgeInsets.only(left: 15.w),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.history_outlined,
                  size: 18.w,
                ),
                title: Transform(
                  transform: Matrix4.translationValues(-20, 0.0, 0.0),
                  child: Text(
                    "添加至稍后再看",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
              ),
              Container(
                width: 1.sw - 10.w,
                height: 1.w,
                color: Colors.grey[300],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 9.w),
                color: Colors.orange,
                child: Text.rich(TextSpan(
                    text: "反馈",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    children: [TextSpan(text: "(选择后将优化首页此类内容)", style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]))])),
              ),
              MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w, bottom: 8.w),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 8,
                      childAspectRatio: 4.6,
                      children: ["恐怖血腥", "色情低俗", "封面恶心", "标题党/封面党"].map((e) {
                        return Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w), border: Border.all(color: Colors.grey[200]!)),
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 16.sp, color: Colors.black),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              Container(
                width: 1.sw - 10.w,
                height: 1.w,
                color: Colors.grey[300],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 9.w),
                color: Colors.orange,
                child: Text.rich(TextSpan(
                    text: "我不想看",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    children: [TextSpan(text: "(选择后将减少相似内容推荐)", style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]))])),
              ),
              MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w, bottom: 8.w),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 4.6,
                      children: ["UP主:$ownerName", "分区:$area", "频道:$channel", "此类内容过多", "推荐过", "不感兴趣"].map((e) {
                        return Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w), border: Border.all(color: Colors.grey[200]!)),
                          child: Center(
                            child: Text(
                              e,
                              maxLines: 1,
                              style: TextStyle(fontSize: 16.sp, color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              const Expanded(child: SizedBox()),

              GFButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                fullWidthButton: true,
                size: kToolbarHeight,
                color: Colors.white,
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: ScreenUtil().bottomBarHeight,
              )
            ],
          ),
        );
      });
}

// 在热门页的更多按钮
void showHotMoreView(BuildContext context) {
  showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => const ShareButtonsView(),
  );
}

// 移除listview水波纹
class EUMNoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          showLeading: false,
          // 不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Colors.transparent,
          child: child,
        );
      case TargetPlatform.linux:
        break;
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.windows:
        break;
    }
    return child;
  }
}
