import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clg_final_projects/presentation/widgets/expandable_cards.dart';

class HospitalShowPage extends StatefulWidget {
  final String? hospitalNameEng;
  final String? docId;
  final String? image;
  final String? hospitalBng;
  final String? address;
  final String? contactNumber;
  final String? detailsOfHospital;
  final String? howToGo;
  final double? latitude;
  final double? longitude;

  const HospitalShowPage({
    super.key,
    this.hospitalNameEng,
    this.docId,
    this.image,
    this.hospitalBng,
    this.address,
    this.contactNumber,
    this.detailsOfHospital,
    this.howToGo,
    this.latitude,
    this.longitude,
  });

  @override
  State<HospitalShowPage> createState() => _HospitalShowPageState();
}

class _HospitalShowPageState extends State<HospitalShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hospitalNameEng ?? ''),
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
                      widget.hospitalBng ?? '',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Address:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.address ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Contact:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.contactNumber ?? '',
                          style: const TextStyle(fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: ()async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: widget.contactNumber,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              log("can't launch this url".toString());
                            }
                          },
                          child: Lottie.asset(
                            height: 60,
                            width: 60,
                            "assets/animation/call - 1735628209117.json",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "প্রতিষ্ঠান সম্পর্কে:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.detailsOfHospital ?? '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    ExpandableCard(
                      cardMargin: const EdgeInsets.all(0),
                      contentPadding: const EdgeInsets.all(10),
                      avatarText: '',
                      title: 'কীভাবে যাবেন',
                      subtitle: '',
                      expandedContent: Text(
                        widget.howToGo ?? '',
                        style: const TextStyle(fontSize: 16),
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
}
