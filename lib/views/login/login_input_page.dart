import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/login/login_bloc.dart';
import '../../config/share_pre_keys.dart';
import '../../routers/routers.dart';
import '../../utils/shared_pre_utils.dart';

class LoginInputPage extends StatefulWidget {
  const LoginInputPage({super.key});

  @override
  State<LoginInputPage> createState() => _LoginInputPageState();
}

class _LoginInputPageState extends State<LoginInputPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late Timer _timer;
  int seconds = 60;  // 60秒倒计时
  String _sendCodeBtnText = "发送验证码"; // 发送短信验证码的按钮文本
  bool btnIsEnable = false;  // 发送短信的按钮是否可以点击

  @override
  void initState() {
    super.initState();
    // _refreshTimer();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.close,
            size: 22,
          ),
        ),
        title: Text(
          "手机登录",
          style: TextStyle(fontSize: 19.sp),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder(
        builder: (BuildContext context, state) {
          return SizedBox(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 6.w),
                  width: 1.sw,
                  height: 1.sh / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/images/bilibili_logo_blue.svg',
                        height: 50.w,
                        fit: BoxFit.fitHeight,
                      ),
                      Container(
                        width: 1.sw - 60.w,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: Colors.grey[200]),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none, // 无边框
                            hintText: "请输入您的手机号",
                            hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent), // 无下划线
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent), // 无下划线
                            ),
                          ),
                          maxLines: 1,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(11) // 输入限制长度
                          ],
                          onChanged: (text) {
                            if (text.length == 11) {
                              setState(() {
                                btnIsEnable = true;
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 1.sw - 100.w,
                        height: 40.w,
                        child: GFButton(
                          onPressed: !btnIsEnable ? null : () async {
                            // setState(() {
                            //   btnIsEnable = false;
                            // });
                            // _startTimer();

                            // 因为会跳转下一页，所以记录当前倒计时的本地时间，返回时才能保持倒计时状态
                            SharedPreUtils.setString(SharePreKeys.startTimerTime, DateTime.now().toString());
                            // 判断是否接收到短信验证码
                            context.pushNamed(RouteName.msgCodePage, queryParameters: {"code": "111111", "phone": _textEditingController.text});
                          },
                          text: _sendCodeBtnText,
                          textStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
                          shape: GFButtonShape.standard,
                          color: Theme.of(context).primaryColor,
                          disabledColor: Colors.grey[300],
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
                ),
                Expanded(child: SizedBox())
              ],
            ),
          );
        },
        bloc: cubit,
      ),
    );
  }
  
  Future<void> _startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds <= 0) {
          btnIsEnable = true;
          seconds = 60;
          _sendCodeBtnText = "重新发送";
          _timer.cancel();
        } else {
          _sendCodeBtnText = "${seconds--} 秒";
        }
      });
    });
  }

  Future<void> _refreshTimer() async {
    int? ss = await SharedPreUtils.getInt(SharePreKeys.residualTimerTime);
    if (ss == null) {
      return;
    }
    String? originTime = await SharedPreUtils.getString(SharePreKeys.startTimerTime);
    if (originTime != null) {
      var n = DateTime.now();
      DateTime o = DateTime.parse(originTime);
      int s = o.difference(n).inSeconds;
      if (s > ss) {
        return;
      } else {
        setState(() {
          btnIsEnable = false;
          seconds = ss - s;
          _sendCodeBtnText = "$seconds 秒";
          _startTimer();
        });
      }
    }
  }

  @override
  Future<void> dispose() async {
    // TODO: implement dispose
    if (seconds > 0 && seconds < 60) {
      await SharedPreUtils.setInt(SharePreKeys.residualTimerTime, seconds);
    }
    super.dispose();
    // _timer.cancel();
  }
}
