import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowScreenPoliceList extends StatelessWidget {
  final String thana;
  final String policeOfficerName;
  final String range;
  final String phone;

  const ShowScreenPoliceList(
      {super.key,
        required this.thana,
        required this.policeOfficerName,
        required this.range,
        required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thana),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "পুলিশ অফিসারের নাম: $policeOfficerName",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "অফিসারের পদবি: $range",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "মোবাইল নাম্বার: $phone",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
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
                      child: const Text("Call Now"),
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
}