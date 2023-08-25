import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'wechat_group_avatars.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(headerSliverBuilder: (context, ins) {
        return [
          SliverAppBar(
            //当此值为true时 SliverAppBar 会固定在页面顶部
            //当此值为fase时 SliverAppBar 会随着滑动向上滑动
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.orange
            ),
            pinned: true,
            //滚动是是否拉伸图片
            stretch: true,
            //展开区域的高度
            expandedHeight: 500,
            //当snap配置为true时，向下滑动页面，SliverAppBar（以及其中配置的flexibleSpace内容）会立即显示出来，
            //反之当snap配置为false时，向下滑动时，只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
            snap: false,
            //阴影
            elevation: 0,
            //背景颜色
            backgroundColor: Colors.white,
            //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
            brightness: Brightness.light,
            //在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
            leading: IconButton(
                icon: Icon(Icons.abc),
                onPressed: () {
                  //TODO: 返回事件处理
                }),
            //一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样， // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '长津湖',
                style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'PingFangSC-Semibold'),
              ),
              //标题居中
              centerTitle: true,
              background: Container(
                height: 400,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://p0.meituan.net/movie/0e81560dc9910a6a658a82ec7a054ceb5075992.jpg@464w_644h_1e_1c'),
                        fit: BoxFit.fill)),
              ),
            ),
          )
        ];
      }, body: Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(itemBuilder: (context, index) {

            if (index == 0) {
              return const WeChatGroupChatIcon(avatars: [
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                "https://img1.baidu.com/it/u=169674502,3751761036&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
              ],);
            }

            if (index == 1) {
              return SizedBox(
                height: 200.w,
                width: 1.sw,
                child: Column(
                  children: [
                    TextButton(onPressed: () {}, child: Text("第一个按钮")),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: Text("第二个按钮")),
                  ],
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 6.w),
              child: Text("index - $index"),
            );
          }),
        ),
      )),
    );
  }
}
