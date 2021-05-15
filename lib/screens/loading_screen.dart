import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Added as http Just for reference.
import 'dart:convert';

const apiKey = '960991f38d501f8e644c4549c9aab49b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // initState() method is called as soon as the application is opened. So if you want any functionality to be performed inside your app as soon as the app the opened (eg. Location Permission) then add the method call for that functionality inside the initState() method.

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var url = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      double temperature = decodeData['main'][
          'temp']; // Method to fetch the value of a particular key from the json formatted file.
      int conditionNumber = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
      print(temperature);
      print(conditionNumber);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        // body: Center(
        //   // ignore: deprecated_member_use
        //   child: RaisedButton(
        //     onPressed: () {
        //       getLocation();
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
