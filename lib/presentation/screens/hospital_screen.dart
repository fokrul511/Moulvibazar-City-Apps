import 'package:clg_final_projects/presentation/model/hospital_data_list.dart';
import 'package:clg_final_projects/presentation/widgets/card/grocery_card.dart';
import 'package:clg_final_projects/presentation/widgets/show_hospital_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          itemBuilder: (BuildContext context, int index) {
            return GroceryCard(
              backgroundColor: Colors.white,
              title: "${hospitalDataList[index]['hospitalNameEng']}",
              image: "${hospitalDataList[index]['image']}",
              time: "Phone: ${hospitalDataList[index]['ContactNumber']}",
              deliveryInfo: "${hospitalDataList[index]['Address']}",
              onTap: () {
                Get.to(
                  () => HospitalShowPage(
                    image: "${hospitalDataList[index]['image']}",
                    hospitalNameEng: "${hospitalDataList[index]['hospitalNameEng']}",
                    hospitalBng: "${hospitalDataList[index]['hospitalBng']}",
                    contactNumber: "${hospitalDataList[index]['ContactNumber']}",
                    address: "${hospitalDataList[index]['Address']}",
                    detailsOfHospital: "${hospitalDataList[index]['DitailsofHospital']}",
                    howToGo: "${hospitalDataList[index]['HowToGo']}",
                    latitude: hospitalDataList[index]['latitude'],
                    longitude: hospitalDataList[index]['longitude'],

                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
