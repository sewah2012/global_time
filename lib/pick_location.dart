import 'package:flutter/material.dart';
import 'package:globaltime/services/world_time.dart';

class PickLocation extends StatefulWidget {
  @override
  _PickLocationState createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime wt = locations[index];
    await wt.getDate();
    Navigator.pop(context,{
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDaytime':wt.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Locality'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
