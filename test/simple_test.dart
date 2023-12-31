// import 'package:test/test.dart';
//
// void main() {
//   // test("file split", () async {
//   //   final file = File.fromUri(Uri(path: 'assets/videos/video_720p_n.ass'));
//   //   List<String> contents = await file.readAsLines();
//   //   print(contents.length);
//   //   Map<String, dynamic> m = {};
//   //   for (var i in contents) {
//   //     List<String> l = i.split("}");
//   //     // print(l.last);
//   //     RegExp r = RegExp(r"\d:\d\d:\d\d.\d\d");
//   //     var ll = r.firstMatch(i);
//   //     List<String> t = ll!.group(0)!.split(":");
//   //     int mt = 3600000 * int.parse(t[0]) +
//   //         60000 * int.parse(t[1]) +
//   //         int.parse(t[2].split(".").first) * 1000 +
//   //         int.parse(t[2].split(".").last) * 10;
//   //     m["$mt"] = l.last;
//   //   }
//   //   print(m);
//   // });
//   test("传递", () async {
//     String a = "123";
//     print("传递前:$a");
//     setValue(a);
//     print("传递后：$a");
//   });
//   test("abc", () async {
//     await for (String i in Stream<String>.fromIterable(['1', '2', '3', '4'])) {}
//   });
// }
//
// void setValue(String s) {
//   s = "hello world";
// }
//
// class Nnnn {
//   String s = "666";
//   Nnnn(String news) {
//     s = news;
//   }
// }

//实现newIsolate与rootIsolate互相通信
import 'dart:io';
import 'dart:isolate';
//定义一个newIsolate
late Isolate newIsolate;
//定义一个newIsolateSendPort, 该newIsolateSendPort需要让rootIsolate持有，
//这样在rootIsolate中就能利用newIsolateSendPort向newIsolate发送消息
late SendPort newIsolateSendPort;

void main() {
  establishConn(); //建立连接
}

//特别需要注意:establishConn执行环境是rootIsolate
void establishConn() async {
  //第1步: 默认执行环境下是rootIsolate，所以创建的是一个rootIsolateReceivePort
  ReceivePort rootIsolateReceivePort = ReceivePort();
  //第2步: 获取rootIsolateSendPort
  SendPort rootIsolateSendPort = rootIsolateReceivePort.sendPort;
  //第3步: 创建一个newIsolate实例，并把rootIsolateSendPort作为参数传入到newIsolate中，
  // 为的是让newIsolate中持有rootIsolateSendPort, 这样在newIsolate中就能向rootIsolate发送消息了
  // 注意createNewIsolateContext这个函数执行环境就会变为newIsolate, rootIsolateSendPort就是createNewIsolateContext回调函数的参数
  newIsolate = await Isolate.spawn(createNewIsolateContext, rootIsolateSendPort);
  //第7步: 通过rootIsolateReceivePort接收到来自newIsolate的消息，所以可以注意到这里是await 因为是异步消息
  //只不过这个接收到的消息是newIsolateSendPort, 最后赋值给全局newIsolateSendPort，这样rootIsolate就持有newIsolate的SendPort
  newIsolateSendPort = await rootIsolateReceivePort.first;
  //第8步: 建立连接后，在rootIsolate环境下就能向newIsolate发送消息了
  sendMessageToNewIsolate(newIsolateSendPort, rootIsolateReceivePort);
}

//特别需要注意:sendMessageToNewIsolate执行环境是rootIsolate
void sendMessageToNewIsolate(SendPort newIsolateSendPort, ReceivePort rootIsolateReceivePort) async {
  // ReceivePort rootIsolateReceivePort = ReceivePort(); //创建专门应答消息rootIsolateReceivePort
  // SendPort rootIsolateSendPort = rootIsolateReceivePort.sendPort;
  //注意: 为了能接收到newIsolate回复消息需要带上rootIsolateSendPort
  newIsolateSendPort.send(['this is from root isolate: hello new isolate!', rootIsolateReceivePort.sendPort]);
  //第11步: 监听来自newIsolate的消息
  print(await rootIsolateReceivePort.first);
}

//特别需要注意:createNewIsolateContext执行环境是newIsolate
void createNewIsolateContext(SendPort rootIsolateSendPort) async {
  //第4步: 注意callback这个函数执行环境就会变为newIsolate, 所以创建的是一个newIsolateReceivePort
  ReceivePort newIsolateReceivePort = ReceivePort();
  //第5步: 获取newIsolateSendPort, 有人可能疑问这里为啥不是直接让全局newIsolateSendPort赋值，注意这里执行环境不是rootIsolate
  SendPort newIsolateSendPort = newIsolateReceivePort.sendPort;
  //第6步: 特别需要注意这里，这里是利用rootIsolateSendPort向rootIsolate发送消息，只不过发送消息是newIsolate的SendPort, 这样rootIsolate就能拿到newIsolate的SendPort
  rootIsolateSendPort.send(newIsolateSendPort);
  //第9步: newIsolateReceivePort监听接收来自rootIsolate的消息
  receiveMsgFromRootIsolate(newIsolateReceivePort);
}

//特别需要注意:receiveMsgFromRootIsolate执行环境是newIsolate
void receiveMsgFromRootIsolate(ReceivePort newIsolateReceivePort) async {
  var messageList = (await newIsolateReceivePort.first) as List;
  print(messageList[0] as String);
  final messageSendPort = messageList[1] as SendPort;
  //第10步: 收到消息后，立即向rootIsolate 发送一个回复消息
  messageSendPort.send('this is reply from new isolate: hello root isolate!');
}