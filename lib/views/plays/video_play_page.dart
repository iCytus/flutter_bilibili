import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../blocs/video_play/video_play_bloc.dart';
import '../../gen/assets.gen.dart';
import '../../models/custom_data_model.dart';
import '../../models/videoItem_data_model.dart';
import '../../utils/change_Str_utils.dart';
import 'video_shimmer_page.dart';

class VideoPlayPage extends StatefulWidget {
  VideoItemDataModel? model1;
  HotDataModel? model2;

  VideoPlayPage({super.key, this.model1, this.model2});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> _width;

  late Owner owner;

  late double topStatusHeight;

  // 存在两组 返回和更多按钮，一个是视频播放控件里，一个是appbar
  bool isShowAppBarBtns = false; // 是否显示 返回和更多两个按钮
  // 视频播放的时候只有评论和其他可以滚动，暂停后才可以全屏一起滚动
  bool isPaused = false;
  double imageFontSize = 10.sp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      // 只有在视频暂停以及滚动距离大于 某固定值后才可以显示标题按钮等
      if (_scrollController.offset > kToolbarHeight && isPaused) {
        if (!isShowAppBarBtns) {
          setState(() {
            isShowAppBarBtns = true;
          });
        }
      } else {
        setState(() {
          isShowAppBarBtns = false;
        });
      }
    });

    _changeView();

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    animation = Tween(begin: 50.0, end: 200.0).animate(animationController);

    _width = Tween<double>(begin: 110.w, end: 30.w).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.0, 0.2, curve: Curves.ease),
    ));

    owner = (widget.model1?.owner ?? widget.model2?.owner)!;
  }

  @override
  Widget build(BuildContext context) {
    topStatusHeight = MediaQuery.of(context).padding.top;
    return BlocBuilder<VideoPlayBloc, VideoPlayState>(
      buildWhen: (prev, state) {
        print("prev.runtimeType：${prev.runtimeType} - state.runtimeType: ${state.runtimeType}");
        return prev.runtimeType != state.runtimeType || state.isReadyInput != prev.isReadyInput;
      },
      builder: (context, state) {
        if (state is VideoPlayInitial) {
          print("state-0: $state - isPlaying: ${state.isPlaying}");
          return const VideoShimmerPage();
        } else {
          print("state-1: $state - isPlaying: ${state.isPlaying}");
          return DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              body: NestedScrollView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _scrollController,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    _buildVideoArea(),
                    _buildTabListView(),
                  ];
                },
                body: TabBarView(
                  children: [
                    _buildSnapshotView(),
                    Container(
                      color: Colors.pink,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
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
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  // 构建视频播放区
  Widget _buildVideoArea() {
    return BlocBuilder<VideoPlayBloc, VideoPlayState>(builder: (context, state) {
      print("_buildVideoArea-state: $state");
      return SliverAppBar(
        floating: false,
        pinned: true,
        snap: false,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black,
        ),
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
        collapsedHeight: state.isPlaying ? 1.sw * 9 / 16 : null, // 当值为null时可以伸展收起
        // collapsedHeight:  1.sw * 9 / 16,
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
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Colors.transparent,
            height: 1.sw * 9 / 16 + MediaQuery.of(context).padding.top,
            width: 1.sw,
            child: GestureDetector(
              onDoubleTap: () {
                // 双击暂停或播放
                print("双击暂停或播放: ${state.isPlaying}");
                isPaused = videoPlayerController.value.isPlaying;
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
      );
    });
  }

  // 构建tabbar展开收起区
  Widget _buildTabListView() {
    return BlocBuilder<VideoPlayBloc, VideoPlayState>(builder: (context, state) {
      print("_buidlTabListView-state: $state");
      return SliverAppBar(
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
        centerTitle: true,
        primary: false,
        backgroundColor: const Color(0xffFB7299),
        toolbarHeight: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(38.w),
          child: Container(
            height: 38.w,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(left: 34.w, right: 12.w),
            width: 1.sw,
            child: Row(
              children: [
                _buildTabBarView(),
                const Expanded(child: SizedBox()),
                _buildDanmukaBtnView(state),
              ],
            ),
          ),
        ),
      );
    });
  }

  // 简介&评论 tabbar
  Widget _buildTabBarView() {
    return TabBar(
      onTap: (index) {
        print("index：$index");
      },
      padding: EdgeInsets.zero,
      enableFeedback: true,
      tabs: ["简介", "评论"]
          .map((e) => Tab(
                text: e,
                height: 36.w,
              ))
          .toList(),
      indicator: TabBarGradientIndicator(
        gradientColor: [Theme.of(context).tabBarTheme.indicatorColor!, Theme.of(context).tabBarTheme.indicatorColor!],
        indicatorWidth: 4,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
    );
  }

  // tabview: 简介
  Widget _buildSnapshotView() {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.w, left: 14.w, right: 14.w),
            height: 140.w,
            width: 1.sw,
            color: Colors.blue,
            child: Column(
              children: [
                ListTile(
                  title: Transform(transform: Matrix4.translationValues(-10, 0, 0), child: Text(owner.name)),
                  subtitle: Transform(transform: Matrix4.translationValues(-10, 0, 0), child: Text(owner.name)),
                  leading: widget.model1 != null || widget.model2 != null
                      ? GFAvatar(
                          backgroundImage: CachedNetworkImageProvider(owner.face, maxWidth: 22.w.toInt(), maxHeight: 22.w.toInt()),
                          size: 22.w,
                        )
                      : Assets.images.home.loginHomepage.image(width: 28.w, height: 28.w),
                  trailing: BlocBuilder<VideoPlayBloc, VideoPlayState>(
                    buildWhen: (previous, current) {
                      return previous.isFollow != current.isFollow;
                    },
                    builder: (context, state) {
                      return state.isFollow
                          ? GFButton(
                              icon: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15.w,
                              ),
                              onPressed: () {
                                context.read<VideoPlayBloc>().add(FollowAuthorEvent(false, videoPlayerController.value.isPlaying, false));
                              },
                              text: "已关注",
                              color: Colors.white38,
                              shape: GFButtonShape.pills,
                              size: GFSize.SMALL,
                            )
                          : GFButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15.w,
                              ),
                              onPressed: () {
                                context.read<VideoPlayBloc>().add(FollowAuthorEvent(false, videoPlayerController.value.isPlaying, true));
                              },
                              text: "关注",
                              color: const Color.fromRGBO(251, 114, 153, 1),
                              shape: GFButtonShape.pills,
                              size: GFSize.SMALL,
                            );
                    },
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.model1?.title ?? widget.model2?.title ?? "",
                              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined, size: 20.w, color: Colors.grey,)
                          
                        ],
                      ),
                      SizedBox(height: 3.w,),
                      Row(
                        children: [
                          Assets.images.home.playRectangle.image(width: 15.w, height: 11.w, color: Colors.grey),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            viewCount(widget.model1?.stat.view ?? widget.model2?.stat.view ?? 0),
                            style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Assets.images.home.danmu.image(width: 15.w, height: 11.w, color: Colors.grey),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            viewCount(widget.model1?.stat.danmaku ?? widget.model2?.stat.danmaku ?? 0),
                            style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            formatStrTime(widget.model1?.pubdate ?? widget.model2?.pubdate ?? 0),
                            style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("index - $index"),
                );
              }),
        ],
      ),
    );
  }

  // 弹幕开关按钮
  Widget _buildDanmukaBtnView(VideoPlayState state) {
    return Row(
      children: [
        BlocSelector<VideoPlayBloc, VideoPlayState, bool>(selector: (state) {
          return state.isReadyInput;
        }, builder: (context, aa) {
          return AnimatedBuilder(
              animation: animation,
              builder: (context, Widget? child) {
                return Container(
                  height: 26.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.w), color: Colors.grey[400]),
                  width: _width.value,
                  child: Row(
                    children: [
                      animationController.status == AnimationStatus.dismissed
                          ? GestureDetector(
                              onTap: () {
                                // 这个点击时间是弹出键盘输入弹幕
                                context.read<VideoPlayBloc>().add(
                                    DanmakuInputEvent(false, videoPlayerController.value.isPlaying, isReadyInput: !state.isReadyInput));
                              },
                              child: Container(
                                width: 80.w,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.w), bottomLeft: Radius.circular(15.w))),
                                child: Center(
                                  child: Text(
                                    state.isReadyInput ? "弹幕输入中" : "点我发弹幕",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      GestureDetector(
                        onTap: () {
                          // 从当前按钮的状态判断是 打开还是关闭 弹幕
                          bool isDanmukaOpen = animationController.status == AnimationStatus.completed ? true : false;
                          context.read<VideoPlayBloc>().add(DanmakuVideoEvent(false, videoPlayerController.value.isPlaying,
                              isDanmukaOpen: isDanmukaOpen, animationController: animationController));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: animationController.status == AnimationStatus.dismissed
                                  ? BorderRadius.only(topRight: Radius.circular(15.w), bottomRight: Radius.circular(15.w))
                                  : BorderRadius.circular(15.w)),
                          width: 30.w,
                          child: Center(
                            child: animationController.status == AnimationStatus.dismissed
                                ? Assets.images.video.danmakuOpen.image(width: 18.w, height: 18.w)
                                : Assets.images.video.danmakuClose.image(width: 18.w, height: 18.w),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        })
      ],
    );
  }

  Future<void> _changeView() async {
    print(widget.model1?.uri ?? widget.model2?.shortLinkV2);
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse("https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4"));
    await videoPlayerController.initialize();

    chewieController =
        ChewieController(videoPlayerController: videoPlayerController, autoPlay: true, looping: false, fullScreenByDefault: false
            // customControls:
            );
    Future.delayed(const Duration(seconds: 1), () {
      context.read<VideoPlayBloc>().emit(VideoPlayInitComplete(
          isPlaying: true, isShow: false, isReadyInput: false, isFollow: widget.model1?.isFollowed == 1, isDanmukaOpen: true));
    });
  }

  @override
  void deactivate() {
    // 返回上一层，恢复未初始化的状态
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
