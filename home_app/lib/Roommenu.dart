import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RoomsPage(),
    );
  }
}

class RoomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text('Your Rooms'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildRoomCard(
            context,
            'Living Room',
            '2/4 devices is on',
            '8\'18"',
          ),
          SizedBox(height: 16),
          _buildRoomCard(
            context,
            'Main Bedroom',
            '3/5 devices is on',
            '22"',
          ),
          SizedBox(height: 16),
          _buildRoomCard(
            context,
            'Bathroom',
            '2/3 devices is on',
            '23"',
          ),
          SizedBox(height: 16),
          _buildRoomCard(
            context,
            'Kitchen',
            '1/5 devices is on',
            '23"',
          ),
          SizedBox(height: 16),
          _buildRoomCard(
            context,
            'Office Room',
            '2/4 devices is on',
            '23"',
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCard(
    BuildContext context,
    String roomName,
    String devicesStatus,
    String cameraStatus,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              devicesStatus,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCameraTile(cameraStatus, 'Camera'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraTile(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}