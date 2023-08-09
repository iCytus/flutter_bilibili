import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> _width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);

    _width = Tween<double>(begin: 120.w,end: 40.w).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.2,curve: Curves.ease),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextButton(onPressed: () {}, child: Text("动画按钮")),
            Container(
              width: 1.sw,
              height: 60.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Container(
                    width: 100.w,
                    color: Colors.orange,
                    height: 40.w,
                  ),
                  Expanded(child: SizedBox()),
                  AnimatedBuilder(
                      animation: animation,
                      builder: (context, Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            print("controller-status: ${controller.status}");
                            if (controller.status == AnimationStatus.completed) {
                              controller.reverse();
                            } else if (controller.status == AnimationStatus.dismissed) {
                              controller.forward();
                            } else if (controller.status == AnimationStatus.forward) {
                              controller.forward();
                            }
                          },
                          child: Container(
                            height: 30.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.w), color: Colors.grey),
                            width: _width.value,
                          ),
                        );
                      }),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
