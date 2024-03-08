import 'package:flutter/material.dart';

class TeamScreens extends StatelessWidget {
  const TeamScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 250,
                  child: Placeholder(),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(height: 100),
                    Container(
                      height: 150,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dipon",
                              style: TextStyle(
                                fontFamily: "Dancing",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
