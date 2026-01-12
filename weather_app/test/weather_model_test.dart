import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather.fromJson', () {
    test('should return a valid Weather model', () {
      final Map<String, dynamic> jsonMap = {
        'weather': [{'main': 'Clouds', 'description': 'overcast clouds', 'icon': '04d'}],
        'main': {'temp': 15.0, 'humidity': 87},
        'wind': {'speed': 4.6},
        'name': 'Manila',
      };

      final result = Weather.fromJson(jsonMap);

      expect(result, isA<Weather>());
      expect(result.condition, 'Clouds'); // Changed from weatherMain
      expect(result.description, 'overcast clouds');
      expect(result.temperature, 15.0); // Changed from temp
      expect(result.humidity, 87);
      expect(result.windSpeed, 4.6);
      expect(result.cityName, 'Manila');
    });

    test('should handle missing optional fields gracefully', () {
      final Map<String, dynamic> jsonMap = {
        'weather': [],
        'main': {},
        'wind': {},
      };

      final result = Weather.fromJson(jsonMap);

      expect(result.cityName, 'Unknown');
      expect(result.condition, 'Unknown');
      expect(result.temperature, 0.0);
      expect(result.humidity, 0);
      expect(result.windSpeed, 0.0);
    });
  });
}