import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../gen/assets.gen.dart';
import '../../models/video_detail_model.dart';
import '../../utils/change_Str_utils.dart';
import '../home/hot/share_buttons_view.dart';

class SimilarItemView extends StatelessWidget {
  Episode model;
  SimilarItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
      width: 1.sw,
      height: (1.sw - 100.w) / 32 * 9 + 20.w,
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                image: DecorationImage(image: CachedNetworkImageProvider(model.arc.pic), fit: BoxFit.cover)),
            clipBehavior: Clip.hardEdge,
            width: (1.sw - 100.w) / 2,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 3.w,
                  right: 3.w,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(color: const Color.fromRGBO(100, 100, 100, 0.8), borderRadius: BorderRadius.circular(2.w)),
                    child: Text(
                      duration2timeStr(model.arc.duration),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${model.title}\n",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16)
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Center(
                        child: Assets.images.custom.uperCustom.image(width: 18.w, height: 13.w),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "肉丸嘟噜噜" ?? model.arc.author.name,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Assets.images.home.playRectangle.image(width: 18.w, height: 13.w, color: Colors.grey),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "${viewCount(model.arc.stat.view)}观看・${timeAgo2Str(model.arc.pubdate)}",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const ShareButtonsView(),
                            );
                          },
                          child: SizedBox(
                            width: 18.w,
                            height: 13.w,
                            child: Icon(
                              Icons.more_vert,
                              size: 13.w,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}