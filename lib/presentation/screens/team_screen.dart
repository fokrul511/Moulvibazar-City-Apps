import 'package:flutter/material.dart';

class TeamScreens extends StatelessWidget {
  const TeamScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List teamList = [
      {
        "title": "Fokrul Islam",
        "image": "assets/images/Fokrul.jpg",
        "session": "2019 - 20",
      },
      {
        "title": "Dipon deb",
        "image": "assets/images/dipon.png",
        "session": "2020 - 21",
      },
      {
        "title": "Hasan Sojib",
        "image": "assets/images/sojib.jpg",
        "session": "2020 - 21",
      },
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Developer Team"),),
      body: ListView.builder(
        itemCount: teamList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(teamList[index]["image"] ?? ""),
                      radius: 80,

                    ),
                    Text(
                      teamList[index]['title'],
                      style:
                          const TextStyle(fontFamily: "Dancing", fontSize: 40),
                    ),
                    const Text(
                      "Computer Technology",
                      style: TextStyle(fontFamily: "Dancing", fontSize: 30),
                    ),
                    Text(
                      "Batch(${teamList[index]['session']})",
                      style:
                          const TextStyle(fontFamily: "Dancing", fontSize: 20),
                    ),
                    const Text(
                      "Moulvibazar Polytecninc Institute)",
                      style: TextStyle(fontFamily: "Dancing", fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
