import 'package:bilibili_bloc/models/videoItem_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/change_Str_utils.dart';
import '../../../widgets/simple_widget.dart';

class RecommendItemView extends StatelessWidget {
  VideoItemDataModel model;
  RecommendItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(5.w)),
      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxWidth * 0.6,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: model.pic,
                      fit: BoxFit.fitWidth,
                      width: constraints.maxWidth,
                    ),
                    Positioned(
                        left: 3,
                        right: 3,
                        bottom: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Assets.images.home.playRectangle.image(width: 15.w, height: 11.w, color: Colors.white),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                viewCount(model.stat.view),
                                style: TextStyle(fontSize: 12.sp, color: Colors.white),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              Assets.images.home.danmu.image(width: 15.w, height: 11.w, color: Colors.white),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                viewCount(model.stat.danmaku),
                                style: TextStyle(fontSize: 12.sp, color: Colors.white),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                duration2timeStr(model.duration),
                                style: TextStyle(fontSize: 12.sp, color: Colors.white),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxWidth * 0.4 - 5,
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 5.w, right: 3.w),
                    child: Text(
                      "${model.title}\n",
                      style: TextStyle(fontSize: 14.sp, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ),
                  contentPadding:EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  subtitle: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(children: [
                      Container(
                        width: 15.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          border: Border.all(
                            color: Colors.grey
                          )
                        ),
                        child: Center(
                          child: Text(
                            "UP", style: TextStyle(fontSize: 9.sp, color: Colors.grey)
                          ),
                        )
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(model.owner.name, style: TextStyle(fontSize: 13.sp, overflow: TextOverflow.ellipsis, color: Colors.grey)),
                      const Expanded(child: SizedBox()),
                      GestureDetector(

                          onTap: () {
                            showMoreView(context, model.owner.name, "", "");
                          },
                          child: Icon(Icons.more_vert, size: 13.w,))
                    ],),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
