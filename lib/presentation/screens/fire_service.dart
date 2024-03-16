import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FireService extends StatelessWidget {
  const FireService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("মৌলভীবাজার ফায়ার স্টেশন"),
      ),
      body: Card(
        child: Column(
          children: [
            Image.asset("assets/fire_service_image/fireService.jpg"),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                  ),
                  onPressed: ()async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: "01901023658",
                    );
                    if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                    } else {
                    log("can't launce this url".toString());
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Call Now"),
                      SizedBox(width: 10,),
                      Icon(Icons.call,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
