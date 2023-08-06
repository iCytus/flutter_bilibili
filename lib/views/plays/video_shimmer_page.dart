import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';

class VideoShimmerPage extends StatelessWidget {
  const VideoShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 1.sw,
            height: 1.sw * 9 / 16 + kToolbarHeight,
            color: Colors.black,
          ),
          Container(
            color: Colors.white,
            height: 30.w,
            width: double.infinity,
            child: Row(
              children: [SizedBox(width: kToolbarHeight), Text("简介"), Expanded(child: SizedBox()), Text("点我发送弹幕")],
            ),
          ),
          GFShimmer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 11.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 36.w,
                    child: Row(
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(16.w)),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                                  width: 60.w,
                                  decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(4.w)),
                                )),
                            SizedBox(
                              height: 3.w,
                            ),
                            Expanded(
                                child: Container(
                                  width: 40.w,
                                  decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(4.w)),
                                ))
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          width: 60.w,
                          height: 28.w,
                          decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(4.w)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 9.w,
                  ),
                  Container(
                    width: 1.sw,
                    height: 20.w,
                    decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(4.w)),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Container(
                    width: 1.sw,
                    height: 16.w,
                    decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(4.w)),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Container(
                    width: 100.w,
                    height: 18.w,
                    decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(4.w)),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120.w,
                          height: 80.w,
                          decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 18.w,
                                color: Colors.grey[350],
                              ),
                              const Expanded(child: SizedBox()),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 16.w,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 16.w,
                                color: Colors.grey[350],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.w,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120.w,
                          height: 80.w,
                          decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(6.w)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 18.w,
                                color: Colors.grey[350],
                              ),
                              const Expanded(child: SizedBox()),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 16.w,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 16.w,
                                color: Colors.grey[350],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
