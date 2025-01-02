import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clg_final_projects/presentation/widgets/expandable_cards.dart';

class TouristShowPage extends StatefulWidget {
  final String? name;
  final String? namebd;
  final String? image;
  final String? location;
  final String? visitDetails;
  final String? details;
  final String? howToGo;

  final String? locationLink;

  const TouristShowPage({
    super.key,
    this.name,
    this.image,
    this.location,
    this.visitDetails,
    this.details,
    this.howToGo,
    this.namebd,
    required this.locationLink,
  });

  @override
  State<TouristShowPage> createState() => _TouristShowPageState();
}

class _TouristShowPageState extends State<TouristShowPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey[700],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.namebd ?? '',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Location: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.location ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "About the Place: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.details ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    ExpandableCard(
                      cardMargin: const EdgeInsets.all(0),
                      contentPadding: const EdgeInsets.all(10),
                      avatarText: '',
                      title: 'How to Go',
                      subtitle: '',
                      expandedContent: Column(
                        children: [
                          Text(
                            widget.howToGo ?? '',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                              icon: const Icon(Icons.location_on_sharp),
                              onPressed: () async {
                                await _launchInAppWithBrowserOptions(
                                    Uri.parse(widget.locationLink.toString()));
                              },
                              label: const Text('View on Map'),
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
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
