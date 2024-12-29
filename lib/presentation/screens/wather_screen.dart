import 'dart:convert';
import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  bool isError = false;
  late Timer _timer; // Timer for auto-refresh

  @override
  void initState() {
    super.initState();
    loadWeather();

    // Set up the auto-refresh every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      loadWeather();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<void> loadWeather() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final data = await fetchWeather("Moulvibazar");
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching weather: $e");
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    const apiKey = "fb2126275ce11e6f342f33e0e87886c9";
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load weather");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Change background color based on temperature
    Color backgroundColor = Colors.blueAccent;
    if (weatherData != null) {
      double temp = (weatherData!['main']['temp'] as num).toDouble(); // Ensure temp is a double
      if (temp < 10) {
        backgroundColor = Colors.blue; // Cold
      } else if (temp > 30) {
        backgroundColor = Colors.red; // Hot
      } else {
        backgroundColor = Colors.white; // Mild
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor, // Set background color
      appBar: AppBar(
        title: const Text("Moulvibazar Weather"),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : isError
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Failed to load weather. Check your connection.",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: loadWeather,
              child: const Text("Retry"),
            ),
          ],
        ),
      )
          : Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Weather Icon
              Image.network(
                'http://openweathermap.org/img/wn/${weatherData!['weather'][0]['icon']}@2x.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 10),

              // Temperature
              Text(
                "Temperature: ${weatherData!['main']['temp']}°C",
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),

              // Condition
              Text(
                "Condition: ${weatherData!['weather'][0]['description']}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),

              // Additional Details
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Feels Like: ${weatherData!['main']['feels_like']}°C",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Humidity: ${weatherData!['main']['humidity']}%",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Wind Speed: ${weatherData!['wind']['speed']} m/s",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Pressure: ${weatherData!['main']['pressure']} hPa",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              // Refresh Button
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: loadWeather,
                  child: const Text("Refresh"),
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }

}
