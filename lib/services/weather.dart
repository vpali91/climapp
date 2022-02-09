import '../constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(String city) async{
    NetworkHelper nh = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=metric');
    var weatherData = await nh.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper nh = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$key&units=metric');

    var weatherData = await nh.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
