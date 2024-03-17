import 'package:clg_final_projects/presentation/model/academy_list.dart';
import 'package:flutter/material.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                onTap: () {},
                title: Text(academyList[index]["institute"]),
              ),
            ),
          );
        },
      ),
    );
  }
}
