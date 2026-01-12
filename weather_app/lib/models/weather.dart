class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String description; // Added this
  final int humidity;
  final double windSpeed;
  final String icon;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description, // Added this
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    // Safely check if weather list is not empty
    final weatherList = json['weather'] as List?;
    final hasWeather = weatherList != null && weatherList.isNotEmpty;

    return Weather(
      cityName: json['name'] ?? 'Unknown',
      temperature: (json['main']?['temp'] ?? 0).toDouble(),
      condition: hasWeather ? (weatherList[0]['main'] ?? 'Unknown') : 'Unknown',
      description: hasWeather ? (weatherList[0]['description'] ?? 'Unknown') : 'Unknown',
      humidity: json['main']?['humidity'] ?? 0,
      windSpeed: (json['wind']?['speed'] ?? 0).toDouble(),
      icon: hasWeather ? (weatherList[0]['icon'] ?? '') : '',
    );
  }
}