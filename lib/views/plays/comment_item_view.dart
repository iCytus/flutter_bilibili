import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rich_readmore/rich_readmore.dart';
import '../../gen/assets.gen.dart';
import '../../models/video_comment_model.dart';
import '../../utils/change_Str_utils.dart';

double levelIconWidth = 22.w;
double levelIconheight = 11.w;

class CommentItemView extends StatelessWidget {
  CommentDetailModel model;
  CommentItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: 6.w, bottom: 6.w, right: 8.w),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            title: Transform(
              transform: Matrix4.translationValues(-10, 0.0, 0.0),
              child: Row(
                children: [
                  Text(model.member.uname, style: const TextStyle(fontSize: 14)),
                  SizedBox(
                    width: 6.w,
                  ),
                  _levelInfoImg(model.member.levelInfo.currentLevel)
                ],
              ),
            ),
            subtitle: Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: Text(timeAgo2Str(model.ctime), style: const TextStyle(fontSize: 13))),
            leading: GFAvatar(
              backgroundImage: CachedNetworkImageProvider(model.member.avatar, maxWidth: 20.w.toInt(), maxHeight: 20.w.toInt()),
              size: 20.w,
            ),
            minVerticalPadding: 0,
          ),
          Container(
            padding: EdgeInsets.only(left: 45.w + 10, right: 10.w, top: 0.w, bottom: 0.w),
            child: RichReadMoreText(
              TextSpan(text: model.content.message, style: const TextStyle(fontSize: 15)),
              settings: LineModeSettings(
                trimLines: 6,
                trimCollapsedText: ' 展开',
                trimExpandedText: ' 收起 ',
                moreStyle: const TextStyle(fontSize: 15, color: Colors.blue),
                lessStyle: const TextStyle(fontSize: 15, color: Colors.blue),
                onPressReadMore: () {},
                onPressReadLess: () {},
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 45.w + 10, right: 10.w, top: 0.w, bottom: 0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // width: 20.w,
                  // height: 20.w,
                  constraints: BoxConstraints(minWidth: 20.w, minHeight: 20.w),
                  child: IconButton(
                    icon: Row(
                      children: [
                        Assets.images.video.like.image(width: 16.w, height: 16.w),
                        Text(
                          model.like > 0 ? "${model.like}" : "",
                        )
                      ],
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(
                  width: 18.w,
                  height: 18.w,
                  child: IconButton(
                    //color: Colors.transparent,
                    icon: Assets.images.video.dislikeCustom.image(width: 16.w, height: 16.w),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.images.trends.forward,
                    width: 16.w,
                    height: 16.w,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 18.w,
                  height: 18.w,
                  child: IconButton(
                    //color: Colors.transparent,
                    icon: Assets.images.video.comment.image(width: 16.w, height: 16.w),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
                Spacer(),
                SizedBox(width: 18.w, height: 18.w, child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)))
              ],
            ),
          ),
          model.replies != null
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 45.w + 10, right: 10.w, top: 0.w, bottom: 0.w),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(4.w)),
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 5.w),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      //reverse: true,
                      itemCount: model.replies!.length > 2 ? 3 : model.replies!.length,
                      itemBuilder: (context, index) {
                        if (index < 2) {
                          Reply reply = model.replies!.reversed.elementAt(index);
                          return Text.rich(
                            TextSpan(text: reply.member.uname, style: const TextStyle(fontSize: 14, color: Colors.blue), children: [
                              TextSpan(
                                  text: reply.content.atNameToMid != null ? " ${reply.content.message}" : "：${reply.content.message}",
                                  style: const TextStyle(fontSize: 14, color: Colors.black))
                            ]),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        } else {
                          return Text.rich(
                            TextSpan(
                                text: "共${model.rcount}条回复",
                                style: const TextStyle(fontSize: 13, color: Colors.blue),
                                children: const [TextSpan(text: " > ", style: TextStyle(color: Colors.grey))]),
                          );
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 4.w);
                      },
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget _levelInfoImg(int level) {
    switch (level) {
      case 0:
        return Assets.images.video.level0.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 1:
        return Assets.images.video.level1.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 2:
        return Assets.images.video.level2.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 3:
        return Assets.images.video.level3.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 4:
        return Assets.images.video.level4.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 5:
        return Assets.images.video.level5.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 6:
        return Assets.images.video.level6.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 7:
        return Assets.images.video.level7.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 8:
        return Assets.images.video.level8.image(width: levelIconWidth, height: levelIconWidth / 2);
      case 9:
        return Assets.images.video.level9.image(width: levelIconWidth, height: levelIconWidth / 2);
    }
    return Container();
  }
}
