import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodDonorCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String location;
  final String phone;

  BloodDonorCard({
    super.key,
    required this.name,
    required this.bloodGroup,
    required this.location,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blood Group Badge
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                bloodGroup,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 16),

            // Donor Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.redAccent),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 20, color: Colors.green),
                      SizedBox(width: 6),
                      Text(
                        phone,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Call Button with Lottie Animation
            GestureDetector(
              onTap: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: phone,
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  log("Can't launch this URL");
                }
              },
              child: Lottie.asset(
                height: 70,
                width: 70,
                "assets/animation/call - 1735628209117.json",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
