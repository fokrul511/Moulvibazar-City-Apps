import 'package:clg_final_projects/presentation/screens/about_app_screen.dart';
import 'package:clg_final_projects/presentation/widgets/team/dev_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BasicDrawer extends StatelessWidget {
  const BasicDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff00674f),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "মৌলভীবাজার ই-সেবা",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "জরুরী সকল সেবা হাতের মুঠোই ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Drawer Menu Items
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      "Task",
                      style: TextStyle(fontSize: 20, color: Colors.white60),
                    ),
                  ),
                  _buildDrawerItem(
                    context,
                    title: "About Developer",
                    icon: Icons.account_box_outlined,
                    onTap: () {
                      Get.to(() => Team());
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    title: "About App",
                    icon: Icons.phone_android,
                    onTap: () {
                      Get.to(() => AppInfoScreen());
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    title: "Rate us",
                    icon: Icons.star,
                    onTap: () {
                      // Handle Setting navigation
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    title: "Help",
                    icon: Icons.help_outline,
                    onTap: () {
                      // Handle Help navigation
                    },
                  ),
                  ListTile(
                    title: Text(
                      "More",
                      style: TextStyle(fontSize: 20, color: Colors.white60),
                    ),
                  ),
                  Divider(),
                  _buildDrawerItem(
                    context,
                    title: "Shere App",
                    icon: Icons.share,
                    onTap: () {
                      // Handle Help navigation
                    },
                  ),
                  _buildDrawerItem(
                    context,
                    title: "Exit",
                    icon: Icons.exit_to_app,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Exit App'),
                            content: Text('Do you want to exit the app?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Exit the app
                                  SystemNavigator.pop();
                                },
                                child: Text('Exit'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
