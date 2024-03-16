import 'dart:developer';
import 'package:clg_final_projects/presentation/model/police_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliceStationScreen extends StatefulWidget {
  const PoliceStationScreen({super.key});

  @override
  State<PoliceStationScreen> createState() => _PoliceStationScreenState();
}

class _PoliceStationScreenState extends State<PoliceStationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moulvibazar District Police"), automaticallyImplyLeading: false,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Image.asset(
              "assets/images/mb_police.gif",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: policeList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowScreenPoliceList(
                              thana: policeList[index]["Thana"],
                              policeOfficerName: policeList[index]
                                  ["policeName"],
                              phone: policeList[index]["phone"],
                              range: policeList[index]["range"],
                            ),
                          ),
                        );
                      },
                      title: Text(
                        policeList[index]["Thana"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_rounded),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "পুলিশ অফিসারের নাম: $policeOfficerName",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "অফিসারের পদবি: $range",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        "মোবাইল নাম্বার: $phone",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      IconButton(
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
                          icon: const Icon(
                            Icons.phone,
                            size: 30,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
