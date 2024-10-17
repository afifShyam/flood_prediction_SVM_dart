class Forecast {
  final double temp;
  final int humidity;
  final double rain;

  final DateTime date;

  Forecast({
    required this.temp,
    required this.humidity,
    required this.rain,
    required this.date,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
        temp: json['list'][7]['main']['temp_min'] as double,
        humidity: json['list'][7]['main']['humidity'],
        rain: json['list'][7]['rain']['3h'] as double,
        date: DateTime.parse(json['list'][7]['dt_txt']));
  }
}

class EForecast {
  final double temp;
  final int humidity;
  final double rain;

  final DateTime date;

  EForecast({
    required this.temp,
    required this.humidity,
    required this.rain,
    required this.date,
  });
  factory EForecast.fromJson(Map<String, dynamic> json) {
    return EForecast(
        temp: json['list'][15]['main']['temp_min'].toDouble(),
        humidity: json['list'][15]['main']['humidity'],
        rain: json['list'][15]['rain']['3h'].toDouble(),
        date: DateTime.parse(json['list'][15]['dt_txt']));
  }
}

class Weather {
  final double temp;
  final int humidity;
  final String name;
  final String country;

  Weather({
    required this.temp,
    required this.humidity,
    required this.name,
    required this.country,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp_min'].toDouble(),
      humidity: json['main']['humidity'],
      name: json['name'],
      country: json['sys']['country'],
    );
  }
}
