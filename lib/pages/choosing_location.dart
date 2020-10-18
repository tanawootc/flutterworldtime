import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'Uk.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'France.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'Italy.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'Germany.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  void getData() async {
    String sayhello = await Future.delayed(Duration(seconds: 3), () {
      return "Hello world";
    });

    String greeting = await Future.delayed(Duration(seconds: 3), () {
      return "How are you?";
    });
    print(' $sayhello  - $greeting');
  }

  int count = 0;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    //print("bulid state");
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                //print(locations[index].location);
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
body: RaisedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: SafeArea(
            child: Text('Count is $count'),
          ),
        ));
*/
