import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [

    WorldTime(
        url: Uri.parse('Europe/Berlin'),
        location: 'Athens',
        flag: 'greece.png'),
    WorldTime(
        url: Uri.parse('Africa/Cairo'),
        location: 'Cairo',
        flag: 'egypt.png'),
    WorldTime(
        url: Uri.parse('America/Chicago'),
        location: 'Chicago',
        flag: 'usa.png'),
    WorldTime(
        url: Uri.parse('Asia/Dubai'),
        location: 'Dubai',
        flag: 'dubai.png'),
    WorldTime(
        url: Uri.parse('Asia/Jakarta'),
        location: 'Jakarta',
        flag: 'indonesia.png'),
    WorldTime(
        url: Uri.parse('Asia/Karachi'),
        location: 'Karachi',
        flag: 'pakistan.png'),
    WorldTime(
        url: Uri.parse('Asia/Kolkata'),
        location: 'Kolkata',
        flag: 'india.png'),
    WorldTime(
        url: Uri.parse('Africa/Nairobi'),
        location: 'Nairobi',
        flag: 'kenya.png'),
    WorldTime(
        url: Uri.parse('America/New_York'),
        location: 'New York',
        flag: 'usa.png'),
    WorldTime(
        url: Uri.parse('Asia/Seoul'),
        location: 'Seoul',
        flag: 'south_korea.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
