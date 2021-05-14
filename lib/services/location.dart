import 'package:geolocator/geolocator.dart';

class Location {
  var latitude;
  var longitude;

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
    } catch (exception) {
      print(exception);
    }
  }
}
