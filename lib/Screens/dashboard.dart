import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp/API/SVM.dart';
import '../API/forecast_weather.dart';
import '../utils/color_utils.dart';
import 'package:fyp/utils/logo_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _temperatureController = TextEditingController();
  final _humidityController = TextEditingController();
  final _rainfallController = TextEditingController();
  String _predictionResult = "";
  String predictionF = '';
  String predictionF2 = '';
  String _location = "Selangor, MY";

  @override
  void initState() {
    super.initState();
    _getWeather();
    _getForecast();
    _getEForecast();
    _getPrediction();
    _getPrediction2();
  }

  Future<Forecast> _getForecast() async {
    String location = _location;
    String apiKey = "681dd75760f2130af948850eca02518b";
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return Forecast.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<EForecast> _getEForecast() async {
    String location = _location;
    String apiKey = "681dd75760f2130af948850eca02518b";
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return EForecast.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Weather> _getWeather() async {
    String location = _location;
    String apiKey = "681dd75760f2130af948850eca02518b";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
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
          _getWeather();
          _getForecast();
          _getEForecast();
          _getPrediction();
          _getPrediction2();
        });
      },
      style: const TextStyle(color: Colors.white),
      dropdownColor: Colors.purple,
      borderRadius: BorderRadius.circular(20),
    );
  }

  Future<void> predictPlacement() async {
    String url =
        "http://192.168.109.238:5000/flood"; // Replace this with your Flask API IP address
    final Map<String, String> data = {
      'temp': _temperatureController.text,
      'humidity': _humidityController.text,
      'rainfall': _rainfallController.text,
    };

    try {
      final response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        String floodResult = jsonResponse['flood'];
        setState(() {
          _predictionResult =
              floodResult == '1' ? 'Flood Happens' : 'No Flood Happens';
        });
      } else {
        setState(() {
          _predictionResult = 'Failed to get prediction result';
        });
      }
    } catch (error) {
      setState(() {
        _predictionResult = 'Error: $error';
      });
    }
  }

  Widget forecastWidget(Forecast fore) {
    return SizedBox(
      width: 250,
      // color: hexStringToColor("282828"),
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: 160,
            height: 170,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 126, 167),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(4, 2),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat('EEEE').format(fore.date),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "${fore.temp.toStringAsFixed(0)}°C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Humidity: ${fore.humidity - 10}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Rain: ${fore.rain} mm",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  predictionF,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget eforecastWidget(EForecast fore) {
    return SizedBox(
      width: 250,
      // color: hexStringToColor("282828"),

      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: 160,
            height: 165,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 126, 167),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(4, 2),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat('EEEE').format(fore.date),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "${fore.temp.toStringAsFixed(0)}°C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Humidity: ${fore.humidity}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Rain: ${fore.rain} mm",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  predictionF2,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherWidget(Weather we) {
    return SizedBox(
      width: 250,
      // color: hexStringToColor("282828"),
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            width: 180,
            height: 160,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 126, 167),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(4, 2),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "${we.temp.toStringAsFixed(0)}°C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Humidity: ${we.humidity}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${we.name}, ${we.country}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _getPrediction() async {
    String apiUrl = 'http://192.168.109.238:5000/flood1';
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
            predictionF = predictionR == '1' ? 'Flood Alert!' : 'No Flood';
          },
        );
      } else {
        setState(() {
          predictionF = 'Failed to get prediction result';
        });
      }
    } catch (error) {
      setState(() {
        predictionF = 'Error: $error';
      });
    }
  }

  void _getPrediction2() async {
    String apiUrl = 'http://192.168.109.238:5000/flood2';
    final Map<String, String> data = {
      'location': _location,
    };
    try {
      final response = await http.post(Uri.parse(apiUrl), body: data);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String predictionR2 = data['flood'];
        setState(
          () {
            predictionF2 = predictionR2 == '1' ? 'Flood Alert!' : 'No Flood';
          },
        );
      } else {
        setState(() {
          predictionF2 = 'Failed to get prediction result';
        });
      }
    } catch (error) {
      setState(() {
        predictionF2 = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: hexStringToColor("282828"),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      //drawer
      drawer: buildDrawer(context),
      //body
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("D780DE"),
            hexStringToColor("7879FF"),
            hexStringToColor("D373D5")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(children: [
              buildDropdown(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<Weather>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          width: 250,
                          // color: hexStringToColor("282828"),
                          child: Column(
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 45, 126, 167),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(4, 2),
                                    )
                                  ],
                                ),
                                child: const Center(
                                  child: SizedBox(
                                    width: 40, // Set your desired width
                                    height: 40, // Set your desired height
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text("Error getting weather");
                      } else if (snapshot.hasData) {
                        Weather we = snapshot.data!;
                        return weatherWidget(we);
                      } else {
                        return const Text("No data available");
                      }
                    },
                    future: _getWeather(),
                  ),
                  Row(
                    children: [
                      FutureBuilder<Forecast>(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              width: 250,
                              // color: hexStringToColor("282828"),
                              child: Column(
                                children: <Widget>[
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 45, 126, 167),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(4, 2),
                                        )
                                      ],
                                    ),
                                    child: const Center(
                                      child: SizedBox(
                                        width: 40, // Set your desired width
                                        height: 40, // Set your desired height
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error getting weather");
                          } else if (snapshot.hasData) {
                            Forecast fore = snapshot.data!;
                            return forecastWidget(fore);
                          } else {
                            return const Text("No data available");
                          }
                        },
                        future: _getForecast(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FutureBuilder<EForecast>(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              width: 250,
                              // color: hexStringToColor("282828"),
                              child: Column(
                                children: <Widget>[
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 45, 126, 167),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(4, 2),
                                        )
                                      ],
                                    ),
                                    child: const Center(
                                      child: SizedBox(
                                        width: 40, // Set your desired width
                                        height: 40, // Set your desired height
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error getting weather");
                          } else if (snapshot.hasData) {
                            EForecast fore = snapshot.data!;
                            return eforecastWidget(fore);
                          } else {
                            return const Text("No data available");
                          }
                        },
                        future: _getEForecast(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 520,
                // height: 800,
                // color: hexStringToColor("8D538D"),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    ),
                    const Text(
                      'Flood Prediction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: "Comic Sans MS",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 450,
                      child: TextField(
                        controller: _temperatureController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Enter temperature (°C)',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 450,
                      child: TextField(
                        controller: _humidityController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Enter humidity (%)',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 450,
                      child: TextField(
                        controller: _rainfallController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Enter rainfall (mm)',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          predictPlacement();
                        },
                        child: const Text('Predict'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Prediction Result: $_predictionResult',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 480,
                      height: 200,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: 160,
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    "Rainfall (mm)",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      smallLogo(
                                          "assets/images/cloudy_rain.png"),
                                      const Text(
                                        " Light: 1 - 10",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      smallLogo("assets/images/raining.svg"),
                                      const Text(
                                        " Moderate: 11 - 30",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      smallLogo("assets/images/storm.png"),
                                      const Text(
                                        " Heavy: 31 - 60",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
