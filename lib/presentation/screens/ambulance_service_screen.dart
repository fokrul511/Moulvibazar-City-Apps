import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/ambulance_service_list.dart';

class AmbulanceServiceScreen extends StatelessWidget {
  const AmbulanceServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("অ্যাম্বুলেন্স সার্ভিস মৌলভীবাজার"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ambulaceCard(
              name: ambulanceservicelist[index]['name'].toString(),
              address: ambulanceservicelist[index]['location'].toString(),
              phone: ambulanceservicelist[index]['contactNumber'].toString(),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: ambulanceservicelist.length,
        ),
      ),
    );
  }

  Widget ambulaceCard({
    required String name,
    required String address,
    required String phone,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 22),
            ),
            Text(address),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(phone,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: phone,
                    );
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      log("can't lounce this url".toString());
                    }
                  },
                  child: Lottie.asset(
                    height: 60,
                    width: 60,
                    "assets/animation/call - 1735628209117.json",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
