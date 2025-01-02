import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মৌলভীবাজার ই-সেবা'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'আসসালামু আলাইকুম প্রিয় মৌলভীবাজারবাসী,',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'আপনাদের জীবনকে আরও সহজ এবং উন্নত করতে আমরা নিয়ে এসেছি '
                  '"মৌলভীবাজার ই-সেবা" অ্যাপটি।',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'এই অ্যাপটি আপনাকে সরবরাহ করবে আপনার জেলা সম্পর্কিত সকল অনলাইন সেবা। '
                  '"মৌলভীবাজার ই-সেবা" অ্যাপটি ব্যবহার করে আপনি পাবেন:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildListItem('সরকারি এবং বেসরকারি সেবা এক জায়গায়'),
            _buildListItem('জরুরি তথ্য হাতের মুঠোয়'),
            _buildListItem('অফলাইন ব্যবহারের সুবিধা যখনই প্রয়োজন'),
            _buildListItem('আপডেটেড সেবা তথ্য'),
            _buildListItem('সহজ এবং দ্রুত সেবা গ্রহণের সুযোগ'),
            const SizedBox(height: 20),
            const Text(
              'এই অ্যাপটি আপনাকে সুবিধা প্রদান করবে:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildListItem('শিক্ষা, স্বাস্থ্য, আইনগত সেবা সহ গুরুত্বপূর্ণ তথ্য'),
            _buildListItem('হেল্পলাইন এবং প্রয়োজনীয় যোগাযোগের তথ্য'),
            const SizedBox(height: 20),
            const Text(
              'অ্যাপটি অনলাইন এবং অফলাইন উভয় মোডে ব্যবহারযোগ্য, যা আপনাকে সেবা গ্রহণে সহজতা এবং দ্রুততার সুবিধা প্রদান করবে।',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'এখনই ডাউনলোড করুন এবং আপনার দৈনন্দিন জীবনকে আরও সহজ এবং উন্নত করুন!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}