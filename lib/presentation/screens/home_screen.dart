import 'package:clg_final_projects/presentation/screens/blood_doner_screen.dart';
import 'package:clg_final_projects/presentation/screens/news_paper_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../model/card_lists.dart';
import '../model/data_list.dart';
import '../widgets/slider.dart';
import '../widgets/web_view_widgets.dart';
import 'academy_screen.dart';
import 'air_tricket_screen.dart';
import 'ambulance_service_screen.dart';
import 'bar_association_screen.dart';
import 'bus_tricket_screen.dart';
import 'jobs_screen.dart';
import 'resturant_service_screen.dart';
import 'wather_screen.dart';
import 'emergency_screen.dart';
import 'fire_service.dart';
import 'hospital_screen.dart';
import 'police_screens.dart';
import 'train_tricket_screen.dart';
import 'turist_screen.dart';
import '../widgets/drawer.dart';
import '../widgets/notice_board.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentMonth =
      DateFormat('MMMM').format(DateTime.now()); // Full month name
  String currentDay =
      DateFormat('dd').format(DateTime.now()); // Day of the month
  String currentYear =
      DateFormat('yyyy').format(DateTime.now()); // Current year

  ///exit function
  DateTime? currentBackPressTime;

  bool onWillPop() {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      // Set the current time when the back button is pressed
      currentBackPressTime = now;
      // Show a snack bar or dialog to prompt the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Press again to exit')),
      );
      return false; // Don't exit the app
    }
    return true; // Exit the app
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => onWillPop(), // Correctly use onWillPop here
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Moulvibazar E-Sheba",
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(top: 5, right: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color(0xff01755a),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text(
                      currentMonth,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          "$currentDay,",
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          currentYear,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SliderScreen(),
                const SizedBox(height: 16),
                const NoticeBoard(
                  noticeText: noticeText,
                ),
                const SizedBox(height: 8),
                const Text(
                  "সেবা সমূহ",
                  style: TextStyle(fontSize: 22),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: cardimageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 19 / 14),
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
                                  builder: (context) =>
                                      const PoliceStationScreen(),
                                ),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AcademyScreen(),
                                ),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FireService(),
                                ),
                              );
                              break;
                            case 5:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmergencyScreen(),
                                ),
                              );
                              break;
                            case 6:
                              Get.to(() => const WebViewStack());
                              break;
                            case 7:
                              Get.to(() => const AmbulanceServiceScreen());
                              break;

                            ///Bus Tricet section............
                            case 8:
                              Get.to(() => const BusTricketScreen());
                              break;

                            ///Weather section............
                            case 9:
                              Get.to(() => WeatherApp());
                              break;

                            ///Resturent Service section........
                            case 10:
                              Get.to(() => const RestranServiceScreen());
                              break;

                            /// Job Search Service section........
                            case 11:
                              Get.to(() => const JobsScreen());
                              break;

                            /// Train Tricket Service section........
                            case 12:
                              Get.to(() => const TrainTricketScreen());
                              break;

                            /// judges Service section........
                            case 13:
                              Get.to(() => const BarAssociationScreen());
                              break;

                            /// Blood doner Service section........
                            case 14:
                              Get.to(() => const BloodDonorScreen());
                              break;

                            /// Blood doner Service section........
                            case 15:
                              Get.to(() => const NewsPaperHomeScreen());
                              break;

                            ///
                            ///  Sports  section........
                            case 16:
                              Get.to(
                                () => const WebViewScreen(
                                  title: 'লাইভ স্পোর্টস নিউজ',
                                  url:
                                      'https://www.espncricinfo.com/live-cricket-score',
                                ),
                              );
                              break;
                            default:
                              break;
                          }
                        },
                        child: Card(
                          elevation: 3,
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // Optional: Add border radius
                                child: Lottie.asset(
                                  cardimageList[index]['image'],
                                  // Your image URL
                                  width: 65,
                                  height: 55,
                                  // Ensure consistent height
                                  fit: BoxFit.cover,
                                  // Adjust as needed
                                  // Placeholder to show while the image is loading
                                ),
                              ),
                              Text(
                                cardimageList[index]["title"],
                                style: const TextStyle(
                                  fontSize: 14,
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
          drawer: const BasicDrawer(),
        ),
      ),
    );
  }
}
