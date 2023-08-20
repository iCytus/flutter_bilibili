import 'package:test/test.dart';

void main() {
  // test("file split", () async {
  //   final file = File.fromUri(Uri(path: 'assets/videos/video_720p_n.ass'));
  //   List<String> contents = await file.readAsLines();
  //   print(contents.length);
  //   Map<String, dynamic> m = {};
  //   for (var i in contents) {
  //     List<String> l = i.split("}");
  //     // print(l.last);
  //     RegExp r = RegExp(r"\d:\d\d:\d\d.\d\d");
  //     var ll = r.firstMatch(i);
  //     List<String> t = ll!.group(0)!.split(":");
  //     int mt = 3600000 * int.parse(t[0]) +
  //         60000 * int.parse(t[1]) +
  //         int.parse(t[2].split(".").first) * 1000 +
  //         int.parse(t[2].split(".").last) * 10;
  //     m["$mt"] = l.last;
  //   }
  //   print(m);
  // });
  test("传递", () async {
    String a = "123";
    print("传递前:$a");
    setValue(a);
    print("传递后：$a");
  });
  test("abc", () async {
    await for (String i in Stream<String>.fromIterable(['1', '2', '3', '4'])) {}
  });
}

void setValue(String s) {
  s = "hello world";
}

class Nnnn {
  String s = "666";
  Nnnn(String news) {
    s = news;
  }
}
