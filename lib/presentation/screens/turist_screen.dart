import 'package:clg_final_projects/presentation/model/turist_data_list.dart';
import 'package:clg_final_projects/presentation/widgets/tourist_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TuristScreen extends StatelessWidget {
  const TuristScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Best Tourist Places"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: touristPlaceDataList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TouristShowPage(
                        name: touristPlaceDataList[index]["placeNameEng"].toString(),
                        namebd: touristPlaceDataList[index]["placeBng"].toString(),

                        image: touristPlaceDataList[index]["image"].toString(),
                        location: touristPlaceDataList[index]["visit"].toString(),
                        details: touristPlaceDataList[index]["details"].toString(),
                        howToGo: touristPlaceDataList[index]["howToGo"].toString(),
                        visitDetails: touristPlaceDataList[index]["howToGo"].toString(),
                        locationLink:  touristPlaceDataList[index]["locationMapLink"],
                      ),
                    ),
                  );
                },
                title: Text(
                  touristPlaceDataList[index]["placeBng"].toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.slideshow_outlined,
                  size: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
