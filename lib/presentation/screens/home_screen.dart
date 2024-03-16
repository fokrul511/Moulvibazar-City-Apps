import 'package:clg_final_projects/presentation/screens/emergency_screen.dart';
import 'package:clg_final_projects/presentation/screens/fire_service.dart';
import 'package:clg_final_projects/presentation/screens/hospital_screen.dart';
import 'package:clg_final_projects/presentation/screens/hotel_scrren.dart';
import 'package:clg_final_projects/presentation/screens/police_screens.dart';
import 'package:clg_final_projects/presentation/screens/scl_clg_screen.dart';
import 'package:clg_final_projects/presentation/screens/team_screen.dart';
import 'package:clg_final_projects/presentation/screens/turist_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List cardimageList = [
  {"image": "assets/images/airplane.png", "title": "Tourist place"},
  {"image": "assets/images/hospital.png", "title": "Hospital"},
  {"image": "assets/images/hotel.png", "title": "Hotel"},
  {"image": "assets/images/police.png", "title": "Police"},
  {"image": "assets/images/graduation.png", "title": "Academy"},
  {"image": "assets/images/firefighter.png", "title": "Fire Service"},
  {"image": "assets/Emergency_image_section/Emergency.png", "title": "Emergency"},
  {"image": "assets/images/team.png", "title": "Team"},
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Welcome To Moulvibazar",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SliderScreen(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: cardimageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TuristScreen(),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HospitalScreen(),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HotelScreen(),
                            ),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PoliceStationScreen(),
                            ),
                          );
                          break;
                        case 4:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SchoolCollageScreen(),
                            ),
                          );
                          break;
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FireService(),
                            ),
                          );
                          break;
                        case 6:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmergencyScreen(),
                            ),
                          );
                          break; case 7:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TeamScreens(),
                            ),
                          );
                          break;
                        default:
                          break;
                      }
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            cardimageList[index]['image'],
                            width: 70,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            cardimageList[index]["title"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
