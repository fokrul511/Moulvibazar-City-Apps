import 'dart:developer';

import 'package:clg_final_projects/presentation/model/emergency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Emergency Hotline"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: emergencyList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(emergencyList[index]["Image"]),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: emergencyList[index]["phone"],
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                log("can't lounce this url".toString());
                              }
                            },
                            icon: const Icon(
                              Icons.call,
                              size: 40,
                              color: Colors.green,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReadMoreEmeargency(
                                        webUrl: emergencyList[index]["webUrl"],
                                        phone: emergencyList[index]["phone"],
                                        discription: emergencyList[index]
                                            ["Discription"],
                                        image: emergencyList[index]["Image"]),
                                  ),
                                );
                              },
                              child: const Text(
                                "Read More",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class ReadMoreEmeargency extends StatelessWidget {
  final String phone;
  final String image;
  final String discription;
  final String? webUrl;

  const ReadMoreEmeargency(
      {super.key,
      required this.phone,
      required this.discription,
      this.webUrl,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(phone),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(child: Image.asset(image)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "বিস্তারিত:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(discription,
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  Text("ওয়েব লিংক: $webUrl",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
