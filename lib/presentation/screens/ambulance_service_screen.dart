import 'dart:developer';

import 'package:flutter/material.dart';
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
              name: ambulance_service_list[index]['name'].toString(),
              address: ambulance_service_list[index]['location'].toString(),
              phone: ambulance_service_list[index]['contactNumber'].toString(),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: ambulance_service_list.length,
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
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    onPressed: ()async {
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
                    icon: const Icon(Icons.call,size: 30,color: Colors.teal,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
