import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgimage = data['isDaytime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimage'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    //Navigator.pushNamed(context, '/location');
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    if (result != null) {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    }
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 35,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 70, letterSpacing: 2, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/about');
        },
        child: Icon(Icons.account_box),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
