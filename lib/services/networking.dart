import 'package:http/http.dart' as http; // Added as http Just for reference.
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  void getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
    }
  }
