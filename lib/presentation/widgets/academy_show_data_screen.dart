import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AcademyShowDataScreen extends StatelessWidget {
  final String academyName;
  final String phone;
  final String principal;
  final String location;
  final String ditails;
  final String image;

  const AcademyShowDataScreen({
    Key? key,
    required this.academyName,
    required this.phone,
    required this.principal,
    required this.location,
    required this.ditails,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(academyName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(image: image),
          const Divider(),
          Expanded(
            child: Marquee(
              text:
              'ভর্তি সংক্রান্ত যেকোনো তথ্যের জন্য পাশে দেয়া নাম্বারে যোগাযোগ করুন। রেজিস্ট্রারঃ $phone',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        academyName,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "ঠিকানা: ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "অধ্যক্ষ: ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        principal,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "পরিচিতি: ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ditails,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String image;

  const ImageWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
