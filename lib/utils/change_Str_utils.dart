// 将过万观看数转化格式
String viewCount(int view) {
  if (view >= 10000) {
    return "${(view / 10000).toStringAsFixed(1)}万";
  } else {
    return "$view";
  }
}

// 将 秒数 转为 xx:xx:xx 格式
String duration2timeStr(int seconds) {
  int hour = seconds ~/ 3600;
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  if (hour == 0) {
    return "$minute:${formatTime(second)}";
  }
  return "${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}";
}

String formatTime(int timeNum) {
  return timeNum < 10 ? "0$timeNum" : timeNum.toString();
}

// 判断时间戳与现在的差
String timeAgo2Str(int timestamp) {
  var uploadTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var n = DateTime.now();
  var s = n.difference(uploadTime).inHours;
  var d = n.difference(uploadTime).inDays;
  if (s > 1 && s < 24) {
    return "$s小时前";
  }
  if (s > 24 && s < 48) {
    return "昨天 ${formatTime(uploadTime.hour)}: ${formatTime(uploadTime.minute)}";
  }

  if (d >= 2 && d < 4) {
    return "$d天前";
  }
  if (d >= 4) {
    return "${uploadTime.month}月${uploadTime.day}日";
  }
  return "";
}

// 转化为 年月日时分
String formatStrTime(int timestamp) {
  var uploadTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return "${uploadTime.year}年${formatTime(uploadTime.month)}月${formatTime(uploadTime.day)}日 ${formatTime(uploadTime.hour)}:${formatTime(uploadTime.minute)}";
}
