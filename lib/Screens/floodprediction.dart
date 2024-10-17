import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/color_utils.dart';

class FloodPrediction extends StatefulWidget {
  const FloodPrediction({Key? key}) : super(key: key);

  @override
  State<FloodPrediction> createState() => _FloodPredictionState();
}

class _FloodPredictionState extends State<FloodPrediction> {
  String prediction = '';
  String _location = "Kuala Lumpur, MY";

  @override
  void initState() {
    super.initState();
    _getPrediction();
  }

  void _getPrediction() async {
    String apiUrl = 'http://10.62.20.38:5000/flood1';
    final Map<String, String> data = {
      'city': _location,
    };
    try {
      final response = await http.post(Uri.parse(apiUrl), body: data);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String predictionR = data['flood'];
        setState(
          () {
            prediction = predictionR == '1' ? '1' : '0';
          },
        );
      } else {
        setState(() {
          prediction = 'Failed to get prediction result';
        });
      }
    } catch (error) {
      setState(() {
        prediction = 'Error: $error';
      });
    }
  }

  DropdownButton<String> buildDropdown() {
    List<String> locations = [
      "Perlis, MY",
      "Kedah, MY",
      "Penang, MY",
      "Perak, MY",
      "Selangor, MY",
      "Negeri Sembilan, MY",
      "Melaka, MY",
      "Johor, MY",
      "Kelantan, MY",
      "Terengganu, MY",
      "Pahang, MY",
      "Kuala Lumpur, MY"
    ];
    return DropdownButton<String>(
      value: _location,
      items: locations.map((location) {
        return DropdownMenuItem(
          value: location,
          child: Text(
            location,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (location) {
        setState(() {
          _location = location!;
          _getPrediction();
        });
      },
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.purple,
      borderRadius: BorderRadius.circular(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("282828"),
      appBar: AppBar(
        title: Text('Flood Prediction'),
      ),
      body: Center(
        child: Column(
          children: [
            buildDropdown(),
            Text(
              prediction,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
