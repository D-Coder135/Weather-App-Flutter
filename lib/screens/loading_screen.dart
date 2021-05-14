import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // initState() method is called as soon as the application is opened. So if you want any functionality to be performed inside your app as soon as the app the opened (eg. Location Permission) then add the method call for that functionality inside the initState() method.

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    // try {
    //   Position position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.low);
    //   print(position);
    // } catch (exception) {
    //   print(exception);
    // }
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {}

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
