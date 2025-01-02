import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clg_final_projects/presentation/widgets/expandable_cards.dart';

class AcademyShowDataScreen extends StatelessWidget {
  final String academyName;
  final String phone;
  final String principal;
  final String location;
  final String ditails;
  final String image;
  final String? howToGo;
  final String? locationLink;
  final List<String> coursesOffered;
  final List<String> campusFacilities;

  const AcademyShowDataScreen({
    Key? key,
    required this.academyName,
    required this.phone,
    required this.principal,
    required this.location,
    required this.ditails,
    required this.image,
    this.howToGo,
    this.locationLink,
    required this.coursesOffered,
    required this.campusFacilities,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(academyName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(image: image),
            const Divider(),
            Expanded(
              child: Marquee(
                text:
                'ভর্তি সংক্রান্ত যেকোনো তথ্যের জন্য পাশে দেয়া নাম্বারে যোগাযোগ করুন। রেজিস্ট্রারঃ $phone ',
                style: const TextStyle(
                  fontSize: 18,
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "ঠিকানা: ",
                          style: TextStyle(
                            fontSize: 20,
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
                            fontSize: 20,
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
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ditails,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        ExpandableCard(
                          cardMargin: const EdgeInsets.all(0),
                          title: 'কীভাবে যাবেন',
                          expandedContent: Column(
                            children: [
                              Text(
                                howToGo ?? '',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.location_on_sharp),
                                  onPressed: () async {
                                    await _launchInAppWithBrowserOptions(
                                        Uri.parse(locationLink.toString()));
                                  },
                                  label: const Text('View on Map'),
                                ),
                              ),
                            ],
                          ),
                          avatarText: '',
                          subtitle: '',
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Courses Offered",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: coursesOffered.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                coursesOffered[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Campus Facilities",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: campusFacilities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                campusFacilities[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
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
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
