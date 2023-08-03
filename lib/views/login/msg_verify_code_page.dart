import 'dart:convert';

import 'package:bilibili_bloc/blocs/login/login_bloc.dart';
import 'package:bilibili_bloc/config/share_pre_keys.dart';
import 'package:bilibili_bloc/utils/shared_pre_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';

import '../../models/user_model.dart';


/// 验证码输入框
class MsgVerifyCodePage extends StatefulWidget {
  final int count;
  final String phone;
  int code;
  //final Function(String code) onResult;

  MsgVerifyCodePage({
    super.key,
    required this.count,
    required this.phone,
    required this.code,

  });

  @override
  State createState() => _MsgVerifyCodePageState();
}

class _MsgVerifyCodePageState extends State<MsgVerifyCodePage> with WidgetsBindingObserver {
  late final ValueNotifier<String> code = ValueNotifier('');
  late FocusNode inputFocus = FocusNode();

  bool restart = false;
  Timer? timer;
  final int seconds = 60;
  late final ValueNotifier<int> timeCount = ValueNotifier(seconds);
  DateTime? pausedTime;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeCount.value--;
      if (timeCount.value <= 0) {
        timer.cancel();
        timeCount.value = seconds;
        code.value = '';
        setState(() {
          restart = true;
        });
      }
    });
  }

  String handlePhone(String phone) {
    if (phone.length == 11) {
      return '${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7, 11)}';
    } else {
      return phone;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inputFocus.requestFocus();
      startTimer();
    });
    print("初始验证码：${widget.code}");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// 适配页面切换、熄屏时倒计时混乱问题
    if (state == AppLifecycleState.resumed) {
      if (pausedTime != null) {
        int seconds = DateTime.now().difference(pausedTime!).inSeconds;
        pausedTime = null;
        timeCount.value = max(0, timeCount.value - seconds);
        startTimer();
      }
    } else if (state == AppLifecycleState.paused) {
      timer?.cancel();
      pausedTime = DateTime.now();
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32.w,
            ),
            const Text(
              '输入验证码',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '验证码已发送至 ${handlePhone(widget.phone)}',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            buildCodeInput(),
            GestureDetector(
              onTap: () {
                /// 点击时弹出输入键盘
                SystemChannels.textInput.invokeMethod('TextInput.show');
                inputFocus.requestFocus();
              },
              child: buildCodeView(),
            ),
            const SizedBox(height: 25),
            if (!restart)
              ValueListenableBuilder<int>(
                valueListenable: timeCount,
                builder: (context, value, child) {
                  return Text(
                    '$value 秒后可重新获取',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  );
                },
              ),
            if (restart)
              GestureDetector(
                onTap: () async {
                  /// todo: 发送短信
                  setState(() {
                    widget.code = 666666;
                    restart = false;
                  });
                  print("重新获取的验证码：${widget.code}");
                  startTimer();
                },
                child: Text(
                  '重新发送',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
          height: 0,
          width: 0,
          child: TextField(
            controller: TextEditingController(text: code.value),
            focusNode: inputFocus,
            maxLength: widget.count,
            keyboardType: TextInputType.number,
            // 禁止长按复制
            enableInteractiveSelection: false,
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            inputFormatters: [
              // 只允许输入数字
              FilteringTextInputFormatter(RegExp("^[0-9]*\$"), allow: true)
            ],
            onChanged: (v) async {
              code.value = v;
              print(v);
              if (v.length == widget.count) {
                if (v == "${widget.code}") {
                  // todo: 下一页
                  Map<String, dynamic> data = const {
                    "uid": "1001",
                    "name": "王小二",
                    "avatar": "https://img2.baidu.com/it/u=2212383468,857153027&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                    "sex": 1,
                    "attentionsCount": 0,
                    "trendsCount": 0,
                    "fansCount": 0
                  };
                  UserModel user = UserModel.fromJson(data);
                  SharedPreUtils.setString(SharePreKeys.userInfo, jsonEncode(data));
                  context.read<LoginBloc>().add(UserLoginEvent(model: user));
                  context.go("/");
                } else {
                  SmartDialog.showToast("验证码错误");
                }
              }
            },
          ),
        );
      },
    );
  }

  Widget buildCodeView() {
    return ValueListenableBuilder<String>(
      valueListenable: code,
      builder: (context, value, child) {
        return GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: widget.count,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 8,
          childAspectRatio: 0.95,
          children: List.generate(widget.count, (int i) => i).map((index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: ((index < widget.count && index == value.length) || (inputFocus.hasFocus && value.isEmpty && index == 0))
                    ? Border.all(width: 1, color: Theme.of(context).primaryColor)
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: (value.length > index)
                  ? Text(
                      value[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : null,
            );
          }).toList(),
        );
      },
    );
  }
}
