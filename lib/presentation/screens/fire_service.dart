import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/fire_service_station_list.dart';
import '../widgets/notice_card.dart';

class FireService extends StatelessWidget {
  const FireService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মৌলভীবাজার সকল ফায়ার স্টেশনের নাম্বার'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'মৌলভীবাজার জেলা',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,

              itemCount: fireStations.length,
              itemBuilder: (context, index) {
                final station = fireStations[index];
                return FireStationCard(
                  title: station['title']!,
                  location: station['location']!,
                  phone: station['phone']!,
                );
              },
            ),
          ),
          const NoticeCard(),
        ],
      ),
    );
  }
}

class FireStationCard extends StatelessWidget {
  final String title;
  final String location;
  final String phone;

  const FireStationCard({super.key,
    required this.title,
    required this.location,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
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
        ),
      ),
    );
  }
}
