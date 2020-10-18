import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 10), setupWorldTime);
  }

  void setupWorldTime() async {
    WorldTime object = WorldTime(
        location: 'Bangkok', flag: 'Thailand.png', url: 'Asia/Bangkok');
    await object.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': object.location,
      'flag': object.flag,
      'time': object.time,
      'isDaytime': object.isDaytime,
    });
  }

  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Asia/Bangkok');

    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    print(now);
    print(datetime);
    print(offset);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
                decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green));
          },
        ),
      ),
    );
  }
}

/* http get
void getData() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.body);
  }


*/

/*
void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Asia/Bangkok');

    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    print(now);
    print(datetime);
    print(offset);
  }
*/

/*
 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('/assets/wait.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }*
  */

/*
return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context,int index){
            return DecoratedBox(
              decoration : BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green
            ));
          },
        ),
      ),
    );
  */
/*
return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 90,
        ),
      ),
    );
*/
