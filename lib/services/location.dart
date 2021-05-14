import 'package:geolocator/geolocator.dart';

class Location {
  Position latitude;
  Position longitude;

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (exception) {
      print(exception);
    }
  }
}
