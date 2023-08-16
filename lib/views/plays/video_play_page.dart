import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:bilibili_bloc/models/video_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../blocs/video_play/video_play_bloc.dart';
import '../../gen/assets.gen.dart';
import '../../models/custom_data_model.dart';
import '../../models/videoItem_data_model.dart';
import '../../utils/change_Str_utils.dart';
import 'similar_item_view.dart';
import 'video_shimmer_page.dart';

class VideoPlayPage extends StatefulWidget {
  // todo: 换成新的 videodetailmodel
  String bvid;

  VideoPlayPage({super.key, required this.bvid});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> _width;

  late double topStatusHeight;

  // 存在两组 返回和更多按钮，一个是视频播放控件里，一个是appbar
  bool isShowAppBarBtns = false; // 是否显示 返回和更多两个按钮
  // 视频播放的时候只有评论和其他可以滚动，暂停后才可以全屏一起滚动
  bool isPaused = false;
  double imageFontSize = 14;
  double coinbtnSize = 28.w;

  TextStyle textBtnsStyle = TextStyle(fontSize: 14, color: Colors.grey[500]);
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
  }

  @override
  Widget build(BuildContext context) {
    topStatusHeight = MediaQuery.of(context).padding.top;
    return BlocBuilder<VideoPlayBloc, VideoPlayState>(
      buildWhen: (prev, state) {
        //print("prev.runtimeType：${prev.runtimeType} - state.runtimeType: ${state.runtimeType}");
        return prev.runtimeType != state.runtimeType || state.isReadyInput != prev.isReadyInput;
      },
      builder: (context, state) {
        if (state is VideoPlayInitial) {
          //print("state-0: $state - isPlaying: ${state.isPlaying}");
          return const VideoShimmerPage();
        } else {
          //print("state-1: $state - isPlaying: ${state.isPlaying}");
          if (state.model != null) {
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
          } else {
            return const Center(
              child: Text("视频不见了"),
            );
          }
        }
      },
    );
  }

  // 构建视频播放区
  Widget _buildVideoArea() {
    return BlocBuilder<VideoPlayBloc, VideoPlayState>(builder: (context, state) {
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
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            : Container(),
        actions: [
          isShowAppBarBtns
              ? IconButton(
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
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
                isPaused = state.videoPlayerController!.value.isPlaying;
                context
                    .read<VideoPlayBloc>()
                    .add(VideoPlayOrPauseEvent(true, state.videoPlayerController!.value.isPlaying, state.videoPlayerController));
              },
              child: Stack(
                children: [
                  Chewie(
                    controller: state.chewieController!,
                  ),
                  Container(
                    width: 1.sw,
                    height: double.infinity,
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 1.sw,
                          height: kToolbarHeight,
                          child: Row(children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange,)),
                            Expanded(child: SizedBox()),
                            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp, color: Colors.red,))
                          ],),
                        )
                      ],
                    ),
                  )
                ],
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
      //print("_buidlTabListView-state: $state");
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
        //print("index：$index");
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
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.w, left: 14.w, right: 14.w),
            //height: 140.w,
            width: 1.sw,
            color: Colors.transparent,
            child: Column(
              children: [
                BlocBuilder<VideoPlayBloc, VideoPlayState>(
                  builder: (context, state) {
                    VideoDetailModel model = state.model!;
                    return ListTile(
                      title: Transform(transform: Matrix4.translationValues(-10, 0, 0), child: Text(model.owner.name)),
                      subtitle: Transform(transform: Matrix4.translationValues(-10, 0, 0), child: Text(model.owner.name)),
                      leading: GFAvatar(
                        backgroundImage: CachedNetworkImageProvider(model.owner.face, maxWidth: 22.w.toInt(), maxHeight: 22.w.toInt()),
                        size: 22.w,
                      ),
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
                                    context
                                        .read<VideoPlayBloc>()
                                        .add(FollowAuthorEvent(false, state.videoPlayerController!.value.isPlaying, false));
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
                                    context
                                        .read<VideoPlayBloc>()
                                        .add(FollowAuthorEvent(false, state.videoPlayerController!.value.isPlaying, true));
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
                    );
                  },
                ),
                BlocBuilder<VideoPlayBloc, VideoPlayState>(builder: (context, state) {
                  VideoDetailModel model = state.model!;
                  return GestureDetector(
                    onTap: () {
                      context.read<VideoPlayBloc>().add(VideoMoreInfoEvent(state.isPlaying, state.isShow));
                    },
                    child: _buildSimpleTextInfo(model, state.isShowMoreInfo),
                  );
                }),
                BlocBuilder<VideoPlayBloc, VideoPlayState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Assets.images.video.liked.image(width: coinbtnSize, height: coinbtnSize),
                              Text("${state.model!.stat.like}", style: textBtnsStyle),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Assets.images.video.dislikeCustom.image(width: coinbtnSize, height: coinbtnSize),
                              Text(
                                "不喜欢",
                                style: textBtnsStyle,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Assets.images.video.coinCustom.image(width: coinbtnSize, height: coinbtnSize),
                              Text("${state.model!.stat.coin}", style: textBtnsStyle),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Assets.images.video.collectCustom.image(width: coinbtnSize, height: coinbtnSize),
                              Text("${state.model!.stat.favorite}", style: textBtnsStyle),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              SvgPicture.asset(Assets.images.trends.forward, width: coinbtnSize, height: coinbtnSize),
                              Text("${state.model!.stat.share}", style: textBtnsStyle),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          BlocBuilder<VideoPlayBloc, VideoPlayState>(
            builder: (context, state) {
              VideoDetailModel model = state.model!;
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.ugcSeason!.sections.first.episodes.length,
                  itemBuilder: (context, index) {
                    Episode e = model.ugcSeason!.sections.first.episodes.elementAt(index);
                    return SimilarItemView(
                      model: e,
                    );
                  });
            },
          )
        ],
      ),
    );
  }

  // 构建视频介绍文本
  Widget _buildSimpleTextInfo(VideoDetailModel model, bool isShowMoreInfo) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, overflow: isShowMoreInfo ? TextOverflow.fade : TextOverflow.ellipsis),
                  maxLines: isShowMoreInfo ? null : 1,
                ),
              ),
              Icon(
                isShowMoreInfo ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                size: 20.w,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: 3.w,
          ),
          Row(
            children: [
              Assets.images.home.playRectangle.image(width: 15.w, height: 11.w, color: Colors.grey),
              SizedBox(
                width: 3.w,
              ),
              Text(
                viewCount(model.stat.view),
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
                viewCount(model.stat.danmaku),
                style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
              ),
              SizedBox(
                width: 13.w,
              ),
              Text(
                formatStrTime(model.pubdate),
                style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
              ),
            ],
          ),
          isShowMoreInfo
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          model.bvid,
                          style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Icon(Icons.not_interested, size: 15.w, color: Colors.red),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "未经坐着授权禁止转载",
                          style: TextStyle(fontSize: imageFontSize, color: Colors.grey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.w),
                      child: Text(
                        model.desc,
                        style: textBtnsStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 16.w,
                        runSpacing: 10.w,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: ["原神", "搞笑", "手机游戏", "实况攻略", "原神UP主激励计划", "游戏实况", "原神开荒", "原神萌新", "开荒", "入坑", "萌新开荒"].map((e) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 6.w),
                            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6.w)),
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                )
              : Container()
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
                                    DanmakuInputEvent(false, state.videoPlayerController!.value.isPlaying, isReadyInput: !state.isReadyInput));
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
                          context.read<VideoPlayBloc>().add(DanmakuVideoEvent(false, state.videoPlayerController!.value.isPlaying,
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
    // videoPlayerController = VideoPlayerController.networkUrl(
    //     Uri.parse("https://qingx-h5-1253674864.cos.ap-guangzhou.myqcloud.com/video/2023/3/31/aa5a29573061443997e6fb7134e52513.mp4"));
    // await videoPlayerController.initialize();
    Future.delayed(const Duration(seconds: 1), () {
      context.read<VideoPlayBloc>().add(LoadVideoDetail(true, false, bvid: widget.bvid, ));
    });
  }

  @override
  void deactivate() {
    // 播放器也要释放
    context.read<VideoPlayBloc>().add(ReleaseVideoPlayer(false, false));
    // 返回上一层，恢复未初始化的状态
    context.read<VideoPlayBloc>().emit(VideoPlayInitial());
    super.deactivate();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
