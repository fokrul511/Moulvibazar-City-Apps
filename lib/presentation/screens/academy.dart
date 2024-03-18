import 'package:clg_final_projects/presentation/model/academy_list.dart';
import 'package:clg_final_projects/presentation/widgets/academy_show_data_screen.dart';
import 'package:flutter/material.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("শিক্ষা প্রতিষ্ঠান"),
      ),
      body: ListView.builder(
        itemCount: academyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcademyShowDataScreen(
                          academyName: academyList[index]["institute"],
                          image: academyList[index]['image'],
                          ditails: academyList[index]['ditails'],
                          location: academyList[index]['Location'],
                          phone: academyList[index]['phone'],
                          principal: academyList[index]['principal'],
                        ),
                      ));
                },
                title: Text(academyList[index]["institute"]),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          );
        },
      ),
    );
  }
}
