import 'package:flutter/material.dart';

void main() {
  runApp(profilepage());
}

class profilepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'John Addams',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Email Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'john2432@gmail.com',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Customise',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Bio/About me'),
              onTap: () {
                // Navigate to bio/about me page
              },
            ),
            ListTile(
              title: Text('Share username'),
              onTap: () {
                // Implement share username functionality
              },
            ),
            ListTile(
              title: Text('Themes'),
              onTap: () {
                // Navigate to themes page
              },
            ),
            ListTile(
              title: Text('Delete User'),
              onTap: () {
                // Implement delete user functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}