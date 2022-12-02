import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgName = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue[700] : Colors.blue[900];
    Color? textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/$bgName'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Column(
                    children: <Widget>[
                      TextButton.icon(
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
                            color: textColor,
                          ),
                          label: Text(
                            'Edit Location',
                            style: TextStyle(color: textColor),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['location'],
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                color: textColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        data['time'],
                        style: TextStyle(fontSize: 68, color: textColor),
                      )
                    ],
                  ),
                ))));
  }
}
