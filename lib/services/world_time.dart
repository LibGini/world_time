import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for ui
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location ui for api endpoint
  bool isDaytime;

  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try {
      //make request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create dateTime object
      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now); //set time property
    } catch (e) {
      print('error: $e');
      time = 'time could not be recieved';
    }
  }
}
