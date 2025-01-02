import 'dart:io';

import 'package:clg_final_projects/presentation/widgets/no_internet/no_net.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkNetwork();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
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

  Future<void> _checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isOffline = true;
      });
    } else {
      // Perform an active internet check
      try {
        final result = await InternetAddress.lookup('google.com');
        setState(() {
          isOffline = result.isEmpty || result[0].rawAddress.isEmpty;
        });
      } on SocketException catch (_) {
        setState(() {
          isOffline = true;
        });
      }
    }

    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.none) {
        setState(() {
          isOffline = true;
        });
      } else {
        try {
          final result = await InternetAddress.lookup('google.com');
          setState(() {
            isOffline = result.isEmpty || result[0].rawAddress.isEmpty;
          });
        } on SocketException catch (_) {
          setState(() {
            isOffline = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (!isOffline) {
                controller.reload();
              } else {
                _showSnackBar("No internet connection");
              }
            },
          ),
        ],
      ),
      body: isOffline
          ? noNetworkImage(
              message: "No Internet Connection",
              subMessage: "Please check your network and try again.",
              ontap: _checkNetwork,
              image: "assets/icons/no-net-image.png",
            )
          : Stack(
              children: [
                WebViewWidget(
                  controller: controller,
                ),
                if (loadingPercentage < 100)
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/news/loading- 1735634419315.json',
                          // Replace with your Lottie file path
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Loading, please wait...",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildOfflineWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/animation/loder - 1735626510638.json',
            // Replace with an appropriate Lottie offline animation file
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            "You are offline. Please check your internet connection.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _checkNetwork,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
