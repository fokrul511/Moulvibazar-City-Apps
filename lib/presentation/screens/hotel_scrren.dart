import 'package:clg_final_projects/presentation/model/hotels_list.dart';
import 'package:clg_final_projects/presentation/widgets/hotel_info_page.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Hotels and Resort"),
      ),
      body: ListView.builder(
        itemCount: hotelsList.length,
        itemBuilder: (context, index) {
          return HotelShowScreen(
            title: hotelsList[index]["title"],
            hotelimage: hotelsList[index]["image"],
            rating: hotelsList[index]["star"],
          );
        },
      ),
    );
  }
}
