import 'package:bilibili_bloc/models/live_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/change_Str_utils.dart';

class LiveItemView extends StatelessWidget {
  LiveDataModel model;
  LiveItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: Theme.of(context).cardColor),

      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.7,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: model.cover,
                      fit: BoxFit.fill,
                      width: constraints.maxWidth,
                    ),
                    Positioned(
                        left: 3,
                        right: 3,
                        bottom: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, bottom: 3.0),
                          child: Row(
                            children: [
                              Text(model.uname, style: TextStyle(fontSize: 12.sp, overflow: TextOverflow.ellipsis, color: Colors.white)),
                              const Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 13.w,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                viewCount(model.online),
                                style: TextStyle(fontSize: 12.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5.w)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                          child: Text(
                            model.title,
                            style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis, color: Colors.black),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Row(
                            children: [
                              Text(model.parentName,
                                  style: TextStyle(fontSize: 12.sp, overflow: TextOverflow.ellipsis, color: Colors.grey)),
                              const Expanded(child: SizedBox()),
                              GestureDetector(
                                  onTap: () {
                                    // showMoreView(context, model.owner.name, "", "");
                                  },
                                  child: Icon(
                                    Icons.close_outlined,
                                    size: 10.w,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
