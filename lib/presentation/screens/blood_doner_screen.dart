
import 'package:clg_final_projects/presentation/widgets/blood_doner_card_widgets.dart';
import 'package:flutter/material.dart';

import '../model/blood_doner_list.dart';

class BloodDonorScreen extends StatelessWidget {
  const BloodDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মৌলভীবাজার রক্ত দাতা তালিকা'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'মৌলভীবাজার জেলা রক্ত দাতাদের তালিকা',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bloodDonors.length,
              itemBuilder: (context, index) {
                final donor = bloodDonors[index];
                return BloodDonorCard(
                  name: donor.name,
                  bloodGroup: donor.bloodGroup,
                  location: donor.location,
                  phone: donor.phone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


