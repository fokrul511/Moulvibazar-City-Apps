import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/logo.png'), // Hospital logo or app logo
                ),
                SizedBox(height: 10),
                Text(
                  'Hospital Finder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Find Nearby Hospitals',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Drawer Items
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Hospital List'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to hospital list screen
              Navigator.pushNamed(context, '/hospitalList');
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map View'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to map view screen
              Navigator.pushNamed(context, '/mapView');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to about us screen
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to contact screen
              Navigator.pushNamed(context, '/contact');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout functionality
              // Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
