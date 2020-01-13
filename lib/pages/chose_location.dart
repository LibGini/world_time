import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Chose_location extends StatefulWidget {
  @override
  _Chose_locationState createState() => _Chose_locationState();
}

class _Chose_locationState extends State<Chose_location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'Nigeria.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'Kenya.png'),
    WorldTime(url: 'Africa/Kigali', location: 'Kigali', flag: 'Rwanda.png'),
    WorldTime(url: 'Africa/Addis_Ababa', location: 'Addis Ababa', flag: 'Ethiopia.png'),
    WorldTime(url: 'Africa/Juba', location: 'Juba', flag: 'South_sudan.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'USA.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'South_korea.png'),
  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDaytime':instance.isDaytime,
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose location"),
        backgroundColor: Colors.red[600],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                 updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
