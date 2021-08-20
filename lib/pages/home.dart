import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    // Dynamicall setting up background color & image
    String bgImage = data['isDaytime'] ? 'daytimeImage.jpg' : 'nighttimeImage.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  if (result != null) {
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.red,
                  size: 30.0,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.orange[700], fontSize: 25.0),
                ),
              ),
              SizedBox(height: 60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 45.0,
                        letterSpacing: 2.0,
                        color: Colors.amber[900]
                    ),
                  )
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0, color: Colors.white),
              )
            ],
          ),
        ),
      )),
    );
  }
}
