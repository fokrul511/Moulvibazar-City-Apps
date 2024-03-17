import 'package:clg_final_projects/presentation/model/police_list.dart';
import 'package:clg_final_projects/presentation/widgets/police_detais_card.dart';
import 'package:flutter/material.dart';

class PoliceStationScreen extends StatefulWidget {
  const PoliceStationScreen({super.key});

  @override
  State<PoliceStationScreen> createState() => _PoliceStationScreenState();
}

class _PoliceStationScreenState extends State<PoliceStationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moulvibazar District Police"),
        automaticallyImplyLeading: false,
      ),
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
