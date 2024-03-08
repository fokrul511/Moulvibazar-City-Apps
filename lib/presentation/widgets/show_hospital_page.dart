import 'package:flutter/material.dart';

class HospitalShowPage extends StatelessWidget {
  final String? hospitalNameEng;
  final String? hospitalBng;
  final String? image;
  final String? ContactNumber;
  final String? Address;
  final String? DitailsofHospital;

  HospitalShowPage(
      {this.hospitalNameEng,
      this.hospitalBng,
      this.image,
      this.ContactNumber,
      this.Address,
      this.DitailsofHospital});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospitalNameEng ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(image ?? ""),
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalBng ?? "",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Address:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Address ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Contact:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ContactNumber ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "প্রতিষ্ঠান সম্পর্কে:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DitailsofHospital ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
