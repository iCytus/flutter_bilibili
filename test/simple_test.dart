import 'package:test/test.dart';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;

void main() {
  test("file split", () async {
    final file = File.fromUri(Uri(path: 'assets/videos/video_720p_n.ass'));
    List<String> contents = await file.readAsLines();
    print(contents.length);
    Map<String, dynamic> m = {};
    for (var i in contents) {
      List<String> l = i.split("}");
      // print(l.last);
      RegExp r = RegExp(r"\d:\d\d:\d\d.\d\d");
      var ll = r.firstMatch(i);
      List<String> t = ll!.group(0)!.split(":");
      int mt = 3600000 * int.parse(t[0]) +
          60000 * int.parse(t[1]) +
          int.parse(t[2].split(".").first) * 1000 +
          int.parse(t[2].split(".").last) * 10;
      m["$mt"] = l.last;
    }
    print(m);
  });
}
