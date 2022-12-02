import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  late String time;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].subString(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      time = "Unknown";
    }
  }
}
