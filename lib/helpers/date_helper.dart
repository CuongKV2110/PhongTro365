import 'package:timeago/timeago.dart' as timeago;

class DateHelper {
  static String getTimeAgo(int timestamp) {
    String result = '';
    int distanceTime =
        (DateTime.now().millisecondsSinceEpoch / 1000).toInt() - timestamp;

    timeago.setLocaleMessages('vi', timeago.ViMessages());
    timeago.setLocaleMessages('vi_short', timeago.ViShortMessages());

    final time = DateTime.now().subtract(Duration(seconds: distanceTime));
    result = timeago.format(time, locale: 'vi');

    return result;
  }
}
