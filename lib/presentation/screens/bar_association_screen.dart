import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BarAssociationScreen extends StatefulWidget {
  const BarAssociationScreen({super.key});

  @override
  State<BarAssociationScreen> createState() => _BarAssociationScreenState();
}

class _BarAssociationScreenState extends State<BarAssociationScreen> {
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
        Uri.parse('https://www.moulvibazarbar.com.bd/home/staff/en'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("মৌলভীবাজারের সকল আইনজীবীদের লিস্ট"),
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
