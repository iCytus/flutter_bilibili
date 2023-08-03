import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:scan/scan.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../gen/assets.gen.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ScanController controller = ScanController();
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            ScanView(
              controller: controller,
              scanAreaScale: .7,
              scanLineColor: Theme.of(context).primaryColor,
              onCapture: (data) {
                Navigator.pop(context, data);
              },
            ),
            Positioned(
                top: ScreenUtil().statusBarHeight + 5.w,
                left: 0.w,
                right: 0.w,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                          size: 20.w,
                        )),
                    Expanded(child: Container()),
                    Text(
                      "扫描二维码",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.transparent,
                          size: 20.w,
                        )),
                  ],
                )),
            Positioned(
                bottom: ScreenUtil().bottomBarHeight + 35.w,
                left: 15.w,
                right: 15.w,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(30.w)),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            AssetPicker.pickAssets(context,
                                    pickerConfig: const AssetPickerConfig(maxAssets: 1, requestType: RequestType.image))
                                .then((List<AssetEntity>? result) async {
                              if (result == null) {
                                return;
                              } else {
                                List<AssetEntity> images = result.toList();
                                File? a = await images[0].file;
                                print("相册的图片信息：${a?.path}");
                                String? str = await Scan.parse(a!.path);
                                if (str != null) {
                                  scanResult = str;
                                } else {
                                  SmartDialog.compatible.showToast("无法识别");
                                }
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Assets.images.mine.album.image(width: 22.w, height: 22.w),
                              SizedBox(
                                height: 2.w,
                              ),
                              Text(
                                "相册",
                                style: TextStyle(fontSize: 12.sp, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.pause();
    super.dispose();
  }
}
