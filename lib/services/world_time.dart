import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  Uri url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties of data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String min = data['utc_offset'].substring(4, 6);
      // print(datetime);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(min)));

      // set time propert
      isDaytime = now.hour > 5 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Oops! Error in getting time data.';
      isDaytime = false;
    }

    print('object');
  }
}
