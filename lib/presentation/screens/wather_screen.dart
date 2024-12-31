import 'dart:convert';
import 'dart:async';
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
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    loadWeather();

    // Auto-refresh every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      loadWeather();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
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
    // Gradient background based on temperature
    Gradient gradientBackground = const LinearGradient(
      colors: [Colors.blueAccent, Colors.lightBlue],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    if (weatherData != null) {
      double temp = (weatherData!['main']['temp'] as num).toDouble();
      if (temp < 10) {
        gradientBackground = LinearGradient(
          colors: [Colors.blue.shade800, Colors.blue.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      } else if (temp > 30) {
        gradientBackground = LinearGradient(
          colors: [Colors.red.shade800, Colors.orange.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      } else {
        gradientBackground = LinearGradient(
          colors: [Colors.green.shade800, Colors.teal.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Moulvibazar Area Weather"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientBackground,
        ),
        child: isLoading
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
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Weather Icon
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Image.network(
                                'http://openweathermap.org/img/wn/${weatherData!['weather'][0]['icon']}@2x.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Temperature
                            Text(
                              "${weatherData!['main']['temp']}°C",
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),

                            // Condition
                            Text(
                              "${weatherData!['weather'][0]['description'].toUpperCase()}",
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Additional Details
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  detailRow(
                                    label: "Feels Like",
                                    value:
                                        "${weatherData!['main']['feels_like']}°C",
                                  ),
                                  detailRow(
                                    label: "Humidity",
                                    value:
                                        "${weatherData!['main']['humidity']}%",
                                  ),
                                  detailRow(
                                    label: "Wind Speed",
                                    value:
                                        "${weatherData!['wind']['speed']} m/s",
                                  ),
                                  detailRow(
                                    label: "Pressure",
                                    value:
                                        "${weatherData!['main']['pressure']} hPa",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Refresh Button
                            ElevatedButton(
                              onPressed: loadWeather,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text(
                                "Refresh",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }

  // Helper Widget for Additional Details
  Widget detailRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
