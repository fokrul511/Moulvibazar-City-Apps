import 'package:flutter/material.dart';

class TeamScreens extends StatelessWidget {
  const TeamScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 250,
                      child: Image.asset("assets/images/Photo.png",
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 90),
                        Container(
                          height: 170,
                          width: MediaQuery.sizeOf(context).width * 0.50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Fokrul Islam",
                                  style: TextStyle(
                                      fontFamily: "Dancing",
                                      fontSize: 35,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Flutter Apps Developer",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Computer Scince and Technology",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Moulvibazar Polytechnic Institute",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 90),
                        Container(
                          height: 170,
                          width: MediaQuery.sizeOf(context).width * 0.50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Dipon Deb",
                                  style: TextStyle(
                                      fontFamily: "Dancing",
                                      fontSize: 35,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Flutter Apps Developer",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Computer Scince and Technology",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Moulvibazar Polytechnic Institute",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/dipon.png",
                      width: 140,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 250,
                      child: Image.asset("assets/images/Photo.png",
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 90),
                        Container(
                          height: 170,
                          width: MediaQuery.sizeOf(context).width * 0.50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Hasan Sojib",
                                  style: TextStyle(
                                      fontFamily: "Dancing",
                                      fontSize: 35,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Flutter Apps Developer",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Computer Scince and Technology",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Moulvibazar Polytechnic Institute",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
