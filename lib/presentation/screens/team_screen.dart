import 'package:flutter/material.dart';

class TeamScreens extends StatelessWidget {
  const TeamScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List teamList = [
      {
        "title": "Fokrul Islam",
        "image": "url",
        "session": "2019 - 20",
      },
      {
        "title": "Dipon deb",
        "image": "url",
        "session": "2020 - 21",
      },
      {
        "title": "Hasan Sojib",
        "image": "url",
        "session": "2020 - 21",
      },
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: teamList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Column(
                  children: [
                    CircleAvatar(
                      minRadius: 80,
                    ),
                    Text(
                      teamList[index]['title'],
                      style: TextStyle(fontFamily: "Dancing", fontSize: 40),
                    ),
                    Text(
                      "Computer Technology",
                      style: TextStyle(fontFamily: "Dancing", fontSize: 30),
                    ),
                    Text(
                      "Batch(${teamList[index]['session']})",
                      style: TextStyle(fontFamily: "Dancing", fontSize: 20),
                    ),
                    Text(
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
