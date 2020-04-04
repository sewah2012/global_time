import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg': 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: ()async{
                      dynamic result = await Navigator.pushNamed(context, '/Location');
                      setState(() {
                        data = {
                          'time':result['time'],
                          'location':result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag':result['flag']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                    ),
                    label: Text('Edit Location'),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
