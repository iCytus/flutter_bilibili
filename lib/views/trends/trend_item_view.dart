import 'package:bilibili_bloc/models/trend_data_model.dart';
import 'package:bilibili_bloc/utils/change_Str_utils.dart';
import 'package:bilibili_bloc/widgets/pic_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rich_readmore/rich_readmore.dart';

import '../../gen/assets.gen.dart';

// 动态类型有 视频 / 文本 / 转发 / 图片等
class TrendCustomView extends StatefulWidget {
  final TrendDataModel model;
  const TrendCustomView({super.key, required this.model});

  @override
  State<TrendCustomView> createState() => _TrendCustomViewState();
}

class _TrendCustomViewState extends State<TrendCustomView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.w),
      color: Theme.of(context).cardColor,
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            leading: GFAvatar(
              backgroundImage: CachedNetworkImageProvider(widget.model.modules.moduleAuthor.face),
              size: 24.w,
            ),
            title: Text(
              widget.model.modules.moduleAuthor.name,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              widget.model.modules.moduleAuthor.pubAction != ""
                  ? "${timeAgo2Str(widget.model.modules.moduleAuthor.pubTs)}・${widget.model.modules.moduleAuthor.pubAction}"
                  : timeAgo2Str(widget.model.modules.moduleAuthor.pubTs),
              style: TextStyle(fontSize: 13.sp),
            ),
            trailing: Icon(
              Icons.more_vert,
              size: 22.w,
              color: Colors.grey,
            ),
          ),
          _buildItemView(widget.model.type, widget.model.modules, widget.model.orig),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.w),
            height: 40.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: double.infinity,
                    child: GFButton(
                      color: Colors.transparent,
                      onPressed: () {},
                      text:
                          widget.model.modules.moduleStat!.forward.count == 0 ? "转发" : "${widget.model.modules.moduleStat!.forward.count}",
                      textStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                      icon: SvgPicture.asset(
                        Assets.images.trends.forward,
                        width: 16.w,
                        height: 16.w,
                      ),
                    )),
                SizedBox(
                    height: double.infinity,
                    child: GFButton(
                      color: Colors.transparent,
                      onPressed: () {},
                      text:
                          widget.model.modules.moduleStat!.comment.count == 0 ? "评论" : "${widget.model.modules.moduleStat!.comment.count}",
                      textStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                      icon: SvgPicture.asset(
                        Assets.images.trends.comment,
                        width: 16.w,
                        height: 16.w,
                      ),
                    )),
                SizedBox(
                    height: double.infinity,
                    child: GFButton(
                      color: Colors.transparent,
                      onPressed: () {},
                      text: widget.model.modules.moduleStat!.like.count == 0 ? "点赞" : "${widget.model.modules.moduleStat!.like.count}",
                      textStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                      icon: widget.model.modules.moduleStat!.like.status
                          ? SvgPicture.asset(
                              Assets.images.trends.likePicked,
                              width: 16.w,
                              height: 16.w,
                            )
                          : SvgPicture.asset(
                              Assets.images.trends.likeUnpick,
                              width: 16.w,
                              height: 16.w,
                            ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildItemView(String type, Modules model, Orig? orig) {
  if (type == "DYNAMIC_TYPE_AV") {
    return TrendVideoItemView(
      cover: model.moduleDynamic.major!.archive!.cover,
      title: model.moduleDynamic.major!.archive!.title,
      durationText: model.moduleDynamic.major!.archive!.durationText,
      view: model.moduleDynamic.major!.archive!.stat.play,
      danmaku: model.moduleDynamic.major!.archive!.stat.danmaku,
    );
    //return Container();
  } else if (type == "DYNAMIC_TYPE_WORD") {
    return TrendTextItemView(text: model.moduleDynamic.desc!.text);
  } else if (type == "DYNAMIC_TYPE_DRAW") {
    return TrendPhotosView(
      title: model.moduleDynamic.desc!.text,
      list: model.moduleDynamic.major!.draw!.items,
    );
  } else if (type == "DYNAMIC_TYPE_FORWARD") {
    return TrendForwardItemView(
      title: model.moduleDynamic.desc!.text,
      orig: orig!,
    );
  } else {
    return Container();
  }
}

// 视频类
class TrendVideoItemView extends StatelessWidget {
  final String cover;
  final String title;
  final String durationText;
  final String view;
  final String danmaku;
  const TrendVideoItemView(
      {super.key, required this.cover, required this.title, required this.durationText, required this.view, required this.danmaku});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Stack(
            children: [
              Container(
                height: (1.sw - 70.w) / 2016 * 1260,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(5.w),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          cover,
                        ))),
                clipBehavior: Clip.hardEdge,
              ),
              Positioned(
                left: 10.w,
                bottom: 10.w,
                child: SizedBox(
                  width: 1.sw / 2,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(color: const Color.fromRGBO(0, 0, 0, 0.6), borderRadius: BorderRadius.circular(2.w)),
                        child: Text(
                          durationText,
                          style: TextStyle(fontSize: 13.sp, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          "$view观看",
                          style: TextStyle(fontSize: 13.sp, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(danmaku == "0" ? "-弹幕" : "$danmaku弹幕", style: TextStyle(fontSize: 13.sp, color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                bottom: 4.w,
                child: SvgPicture.asset(
                  Assets.images.trends.tvPlay,
                  width: 40.w,
                  height: 40.w,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
          child: Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}

// 文本类
class TrendTextItemView extends StatelessWidget {
  final String text;
  const TrendTextItemView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: RichReadMoreText(
        TextSpan(text: text + text, style: const TextStyle(fontSize: 16)),
        settings: LineModeSettings(
          trimLines: 4,
          trimCollapsedText: ' 展开',
          trimExpandedText: ' 收起 ',
          moreStyle: const TextStyle(fontSize: 16, color: Colors.blue),
          lessStyle: const TextStyle(fontSize: 16, color: Colors.blue),
          onPressReadMore: () {},
          onPressReadLess: () {},
        ),
      ),
    );
  }
}

// 图文集
class TrendPhotosView extends StatelessWidget {
  final String title;
  final List<Item> list;
  const TrendPhotosView({super.key, required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.w),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
          ),
        ),
        list.length > 1
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4.w, // 上下两行间距
                      crossAxisSpacing: 4.w,
                      childAspectRatio: 1,
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Item i = list.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return PicSwiper(
                              index: index,
                              pics: list,
                            );
                            //return CropImage(index: index, items: list, knowImageSize: true,);
                          }));
                        },
                        child: TrendPhotoItemView(
                          index: index,
                          item: i,
                        ),
                      );
                    }),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PicSwiper(
                      index: 0,
                      pics: list,
                    );
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 5.w),
                  child: _buildOneItemView(list.first.width, list.first.height),
                ),
              )
      ],
    );
  }

  Widget _buildOneItemView(int w, int h) {
    var n = w / h;
    if (n > 4 / 3) {
      return SizedBox(
        width: 200.w,
        height: 150.w,
        child: Center(
          child: TrendPhotoItemView(
            index: 0,
            item: list.first,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 150.w,
        height: 200.w,
        child: Center(
          child: TrendPhotoItemView(
            index: 0,
            item: list.first,
          ),
        ),
      );
    }
    return Container();
  }
}

class TrendPhotoItemView extends StatelessWidget {
  final int index;
  final Item item;
  const TrendPhotoItemView({super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
      ),
      clipBehavior: Clip.hardEdge,
      child: Hero(
        tag: item.src,
        child: ExtendedImage.network(
          item.src,
          imageCacheName: 'CropImage',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// 转发类
class TrendForwardItemView extends StatelessWidget {
  final String title;
  final Orig orig;
  const TrendForwardItemView({super.key, required this.title, required this.orig});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w),
          child: Row(children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
            )
          ],),
        ),
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
          color: Colors.grey[200],
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 8.w),
                      child: Text(
                        "@${orig.modules.moduleAuthor.name}",
                        style: TextStyle(fontSize: 15.sp, color: Colors.lightBlue),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                child: _buildItemView(orig.type, orig.modules, null),
              )
            ],
          ),
        )
      ],
    );
  }
}
