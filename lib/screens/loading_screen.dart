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
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  void getData() async {
      double temperature = decodeData['main'][
          'temp']; // Method to fetch the value of a particular key from the json formatted file.
      int conditionNumber = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];
      print(temperature);
      print(conditionNumber);
      print(cityName);
    }
  }

  @override
  Widget build(BuildContext context) {
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
