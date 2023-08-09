import 'package:bilibili_bloc/models/hot_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/change_Str_utils.dart';
import 'share_buttons_view.dart';

class HotItemView extends StatelessWidget {
  HotDataModel model;
  HotItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.w),
      width: 1.sw,
      height: (1.sw - 46.w) / 32 * 9 + 16.w,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                image: DecorationImage(image: CachedNetworkImageProvider(model.pic), fit: BoxFit.cover)),
            clipBehavior: Clip.hardEdge,
            width: (1.sw - 46.w) / 2,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 3.w,
                  right: 3.w,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(color: const Color.fromRGBO(140, 140, 140, 0.8), borderRadius: BorderRadius.circular(2.w)),
                    child: Text(
                      duration2timeStr(model.duration),
                      style: TextStyle(fontSize: 12.sp),
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
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  const Expanded(child: SizedBox()),
                  model.rcmdReason.content != ""
                      ? Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.w), border: Border.all(width: 0.8, color: Colors.orange[700]!)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text(model.rcmdReason.content, style: TextStyle(fontSize: 9.sp, color: Colors.orange[700]!)),
                                    )
                                  ],
                                )),
                            const Expanded(child: SizedBox())
                          ],
                        )
                      : const SizedBox(),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Center(
                        child: Assets.images.custom.uperCustom.image(width: 18.w, height: 13.w),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        model.owner.name,
                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
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
                        "${viewCount(model.stat.view)}观看・${timeAgo2Str(model.pubdate)}",
                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => ShareButtonsView(),
                            );
                          },
                          child: Container(
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
