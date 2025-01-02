import 'package:clg_final_projects/presentation/screens/news_ui/news_screen.dart';
import 'package:clg_final_projects/presentation/widgets/custom_snack_bar.dart';
import 'package:clg_final_projects/presentation/widgets/moulvibazar_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPaperHomeScreen extends StatelessWidget {
  const NewsPaperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("মৌলভীবাজার জেলাসহ সারাদেশের প্রতিদিনের খবর"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: ClipRRect(

              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: AssetImage('assets/news/news.jpg'),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
          ),
          GradientTextContainer(
            title: "জাতীয় সকল পত্রিকা",
            onTap: () {
              Get.to(() => const NewsUI());
              print("জাতীয় সকল পত্রিকা tapped!");
            },
          ),
          GradientTextContainer(
            title: "সিলেট বিভাগের সকল পত্রিকা",
            onTap: () {
              CustomSnackbar.show(
                context,
                message: "শীঘ্রই আপডেট আসছে",
                actionLabel: "Undo",
                onActionPressed: () {
                  // Handle action
                  print("Undo action pressed");
                },
                backgroundColor: Colors.deepPurple,
                textColor: Colors.white,
                actionColor: Colors.yellow,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(10),
              );

              print("সিলেট বিভাগের সকল পত্রিকা tapped!");
            },
          ),
          GradientTextContainer(
            title: "মৌলভীবাজার জেলার সকল পত্রিকা",
            onTap: () {
              Get.to(() => const MoulvibazarNews());
              print("মৌলভীবাজার জেলার সকল পত্রিকা tapped!");
            },
          ),

        ],
      ),
    );
  }
}

class GradientTextContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const GradientTextContainer({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
