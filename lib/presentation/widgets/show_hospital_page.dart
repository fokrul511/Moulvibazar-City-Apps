import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalShowPage extends StatelessWidget {
  final String? hospitalNameEng;
  final String? hospitalBng;
  final String? image;
  final String? contactnumber;
  final String? address;
  final String? ditailsofhospital;

  const HospitalShowPage(
      {super.key, this.hospitalNameEng,
      this.hospitalBng,
      this.image,
      this.contactnumber,
      this.address,
      this.ditailsofhospital});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospitalNameEng ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(image ?? ""),
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalBng ?? "",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Address:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    address ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Contact:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        contactnumber ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () async {
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: contactnumber,
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                log("can't lounce this urls".toString());
                              }
                            },
                        child:Text("Call Now")),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "প্রতিষ্ঠান সম্পর্কে:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    ditailsofhospital ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
