import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
  }

  void getData(double lat, double lon) async {
    http.Response response = await http
        .get('api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon');
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.body);

      var longitude = jsonDecode(data)['coord']['lon'];
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getData(35.0, 139.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
