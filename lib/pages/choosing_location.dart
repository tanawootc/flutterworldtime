import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
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
        ),
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
  }
}
