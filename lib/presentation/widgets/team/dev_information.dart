import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final Uri fokrulCall = Uri(scheme: 'tel', path: '+8801726032986');
  final Uri fokrulEmail = Uri(scheme: 'mailto', path: 'islamfokrul2002@gmail.com');

  Future<void> makeCall() async {
    await launchUrl(fokrulCall);
  }

  Future<void> sendEmail() async {
    await launchUrl(fokrulEmail);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Developer Info'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Back button functionality
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 80.0,
                backgroundImage: CachedNetworkImageProvider('https://avatars.githubusercontent.com/u/73265474?v=4', ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Fokrul Islam',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Developer at Binary Optimizer\nFlutter Instructor at Creation IT',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.white70),
              ),
              const SizedBox(height: 20.0),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Specialization:',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Flutter App Development',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'Contact:',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Phone: +8801726032986\nEmail: islamfokrul2002@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: makeCall,
                    icon: const Icon(Icons.call, color: Colors.white, size: 30.0),
                  ),
                  IconButton(
                    onPressed: sendEmail,
                    icon: const Icon(Icons.email, color: Colors.white, size: 30.0),
                  ),
                  IconButton(
                    onPressed: () async {
                      launcher.launchUrl(
                        Uri.parse('https://web.facebook.com/humien.ahmad.9'),
                        mode: launcher.LaunchMode.externalApplication,
                      );
                    },
                    icon: const Icon(Icons.facebook, color: Colors.white, size: 30.0),
                  ),
                  IconButton(

                    onPressed: () async {
                      launcher.launchUrl(
                        Uri.parse('https://github.com/fokrul511'),
                        mode: launcher.LaunchMode.externalApplication,
                      );
                    },
                    icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white, size: 30.0),
                  ),
                  IconButton(
                    onPressed: () async {
                      launcher.launchUrl(
                        Uri.parse('https://www.linkedin.com/in/fokrul-islam-cse/'),
                        mode: launcher.LaunchMode.externalApplication,
                      );
                    },
                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 30.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
