
import 'package:flutter/material.dart';
import 'package:globaltime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime wt = WorldTime(location: 'Casablanca',flag:'casa.png',url: 'Africa/Casablanca');
   await wt.getDate();
   Navigator.pushReplacementNamed(context, '/Home', arguments: {
     'location':wt.location,
     'flag':wt.flag,
     'time':wt.time,
     'isDaytime':wt.isDayTime,
   });

  }


  @override
  void initState(){
    super.initState();
    setupWorldTime(); 
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
