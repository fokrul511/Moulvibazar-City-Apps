import 'package:flutter/material.dart';

import '../model/apps_data.dart';
import '../widgets/show_ditails_turist_screen.dart';

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
          itemCount: turistList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowDitailsScreen(
                        title: turistList[index]["name"].toString(),
                        image: turistList[index]["image"].toString(),
                        visit: turistList[index]["visit"].toString(),
                        ditails: turistList[index]["ditails"].toString(),
                      ),
                    ),
                  );
                },
                title: Text(
                  turistList[index]["name"].toString(),
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
