import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
    String location; //location for the UI
    String time; // the time in that location
    String flag; // url to an asset flag icon
    String url; // location url for api endpoint
    bool isDayTime; // true or false if daytime or not

    WorldTime({this.location,this.flag,this.url});

    Future <void> getDate() async{
     try{
       //get data form outsource and store the response in a response object
       Response response = await get('http://worldtimeapi.org/api/timezone/$url');

       //decode response to a more readable format using map
       Map data = jsonDecode(response.body);

       String datetime = data['datetime'];
       String offset = data['utc_offset'].substring(1,3);

       //create a dateTime object
       DateTime now = DateTime.parse(datetime);
       now = now.add(Duration(hours: int.parse(offset)));
       isDayTime = now.hour > 6 && now.hour < 20 ? true : false; //teneray operator condition to define day and night
       time = DateFormat.jm().format(now);//Set the time property
    }
    catch(e) {
       print('Error found: $e');
       time = 'Time not found';
    }
    }

}
