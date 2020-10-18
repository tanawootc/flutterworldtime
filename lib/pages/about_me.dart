import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/sana.jpg'),
                    radius: 80,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 50,
                color: Colors.grey,
              ),
              Text(
                "Name - Surname",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "mainframe",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.blue[900]),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Address",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "BKK",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.blue[900]),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  "Contact : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "email : mainframe@mail.com",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text("Back Home"),
        icon: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.red,
      ),
    );
  }
}
