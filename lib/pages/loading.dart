import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'berlin', flag: 'berlin.png', url: 'Europe/berlin');

    await instance.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Scaffold(
          body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )),
    );
  }
}
