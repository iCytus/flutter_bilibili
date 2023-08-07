import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

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
          return const VideoShimmerPage();
        } else {
          return SafeArea(
            bottom: false,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Scaffold(
                body: NestedScrollView(
                  physics: const NeverScrollableScrollPhysics(),
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
                            height: 1.sw * 9 / 16,
                            width: 1.sw,
                            child: GestureDetector(
                              onDoubleTap: () {
                                // 双击暂停或播放
                                print("双击暂停或播放");
                                context
                                    .read<VideoPlayBloc>()
                                    .add(VideoPlayOrPauseEvent(true, videoPlayerController.value.isPlaying, videoPlayerController));
                              },
                              child: Chewie(
                                controller: chewieController,
                              ),
                            ),
                          ),
                          collapseMode: CollapseMode.parallax,
                        ),
                      ),
                      SliverAppBar(
                        floating: false,
                        pinned: true,
                        snap: false,
                        elevation: 0,
                        leading: SizedBox(),
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
                        //title: const Text('标题', style: TextStyle(color: Colors.white),),
                        centerTitle: true,
                        primary: true,
                        backgroundColor: const Color(0xffFB7299),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(-12.w),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 32.w,
                              ),
                              TabBar(
                                onTap: (index) {
                                  print("index：$index");
                                },
                                padding: EdgeInsets.zero,
                                enableFeedback: true,
                                tabs: ["简介", "评论"]
                                    .map((e) => Tab(
                                          text: e,
                                          height: 32.w,
                                        ))
                                    .toList(),
                                indicator: TabBarGradientIndicator(
                                  gradientColor: [
                                    Theme.of(context).tabBarTheme.indicatorColor!,
                                    Theme.of(context).tabBarTheme.indicatorColor!
                                  ],
                                  indicatorWidth: 4,
                                ),
                                indicatorSize: TabBarIndicatorSize.label,
                                isScrollable: true,
                              ),
                              Expanded(child: SizedBox()),
                              Container(
                                width: 30.w,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      Container(
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
                      Container(
                        color: Colors.pink,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 30,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text("index - $index"),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _changeView() async {
    print(widget.model1?.uri ?? widget.model2?.shortLinkV2);
    // videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.model1?.uri ?? widget.model2?.shortLinkV2 ?? ""));
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse("https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4"));
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: false
      // customControls:
    );
    Future.delayed(const Duration(seconds: 1), () {
      context.read<VideoPlayBloc>().emit(VideoPlayInitComplete());
    });
  }

  @override
  void deactivate() {
    context.read<VideoPlayBloc>().emit(VideoPlayInitial());
    super.deactivate();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
