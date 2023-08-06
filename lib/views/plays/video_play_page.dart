import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import '../../blocs/video_play/video_play_bloc.dart';
import '../../models/videoItem_data_model.dart';
import 'video_shimmer_page.dart';

class VideoPlayPage extends StatefulWidget {
  VideoItemDataModel? model1;
  HotDataModel? model2;

  VideoPlayPage({super.key, this.model1, this.model2});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  final ScrollController _scrollController = ScrollController();

  // 存在两组 返回和更多按钮，一个是视频播放控件里，一个是appbar
  bool isShowAppBarBtns = false; // 是否显示 返回和更多两个按钮
  // 视频播放的时候只有评论和其他可以滚动，暂停后才可以全屏一起滚动
  bool isPaused = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print("滚动距离: ${_scrollController.offset} - ${1.sw * 9 / 16} - $kToolbarHeight");
      // 只有在视频暂停以及滚动距离大于 某固定值后才可以显示标题按钮等
      if (_scrollController.offset > kToolbarHeight && true) {
        setState(() {
          isShowAppBarBtns = true;
        });
      } else {
        setState(() {
          isShowAppBarBtns = false;
        });
      }
    });
    _changeView();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayBloc, VideoPlayState>(
      builder: (context, state) {
        print("state: $state");
        if (state is VideoPlayInitial) {
          return _buildShimmerView();
        } else {
          return Scaffold(
            body: NestedScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    snap: false,
                    elevation: 0,
                    leading: isShowAppBarBtns
                        ? IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        : Container(),
                    actions: [
                      isShowAppBarBtns
                          ? IconButton(
                              icon: const Icon(
                                Icons.more_vert_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            )
                          : Container(),
                    ],
                    stretch: false,
                    expandedHeight: 1.sw * 9 / 16,
                    //collapsedHeight: state.isPlaying ? 1.sw * 9 / 16 : null, // 当值为null时可以伸展收起
                    // collapsedHeight:  1.sw * 9 / 16,
                    //title: const Text('标题', style: TextStyle(color: Colors.white),),
                    centerTitle: true,
                    primary: true,
                    backgroundColor: const Color(0xffFB7299),
                    flexibleSpace: FlexibleSpaceBar(
                      title: isShowAppBarBtns
                          ? const Text(
                              '标题',
                              style: TextStyle(color: Colors.white),
                            )
                          : Container(),
                      background: Container(
                        color: Colors.black,
                      ), // todo: 放一个视频播放器
                      collapseMode: CollapseMode.parallax,
                    ),
                  ),
                ];
              },
              body: Container(
                color: Colors.orange,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 30,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("index - $index"),
                      );
                    }),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildShimmerView() {
    return VideoShimmerPage();
  }

  Future<void> _changeView() async {
    Future.delayed(const Duration(seconds: 5), () {
      context.read<VideoPlayBloc>().emit(VideoPlayInitComplete());
    });
  }
}
