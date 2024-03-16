import 'package:clg_final_projects/presentation/model/hospital_data_list.dart';
import 'package:clg_final_projects/presentation/widgets/show_hospital_page.dart';
import 'package:flutter/material.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: hospitalDataList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HospitalShowPage(
                        hospitalNameEng: hospitalDataList[index]
                            ["hospitalNameEng"],
                        hospitalBng: hospitalDataList[index]["hospitalBng"],
                        image: hospitalDataList[index]["image"],
                        address: hospitalDataList[index]["Address"],
                        contactnumber: hospitalDataList[index]["ContactNumber"],
                        ditailsofhospital: hospitalDataList[index]["DitailsofHospital"],
                      ),
                    ),
                  );
                },
                title: Text(
                  hospitalDataList[index]["hospitalNameEng"] ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text("Moulvibazar"),
                trailing: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/medical.png"),
                  backgroundColor: Colors.transparent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
