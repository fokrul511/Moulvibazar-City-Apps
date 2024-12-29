import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RestranServiceScreen extends StatefulWidget {
  const RestranServiceScreen({super.key});

  @override
  State<RestranServiceScreen> createState() => _RestranServiceScreenState();
}

class _RestranServiceScreenState extends State<RestranServiceScreen> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // Initialize WebView controller and enable JavaScript
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse("https://www.foodpanda.com.bd/city/moulvibazar?lng=91.77779&lat=24.48255"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("রেস্টুরেন্ট"),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
