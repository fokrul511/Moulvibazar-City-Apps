import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:lottie/lottie.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
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
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // Reload button
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.reload();  // Reload the current page
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // WebView content
          WebViewWidget(
            controller: controller,
          ),

          // Show Lottie animation while loading
          if (loadingPercentage < 100)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/news/loading- 1735634419315.json', // Replace with your Lottie file path
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Loading, please wait...",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
