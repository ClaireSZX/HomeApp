import 'package:flutter/material.dart';
import 'package:home_app/addDevice'; // Import the addDevice.dart file

class LivingRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Living Room'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Living Room Title
          Text(
            'Living Room',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),

          // Connected and Active Devices
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '4 connected devices',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '2 active devices',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Temperature and Humidity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoTile('20C', 'Temperature'),
              _buildInfoTile('66%', 'Humidity'),
            ],
          ),
          SizedBox(height: 24),

          // Devices Section
          Text(
            'Devices',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDeviceTile(
                'OLED TV',
                'assets/tv icon.png', // Corrected path
              ),
              _buildDeviceTile(
                'Air Conditioner',
                'assets/air cond icon.png', // Corrected path
              ),
              _buildDeviceTile(
                'Main Lamp',
                'assets/lamp icon.png', // Corrected path
              ),
            ],
          ),
          SizedBox(height: 24),

          // Modes Section
          Text(
            'Modes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildModeTile(
            'Cinema Mode',
            '10%-yellow',
            '18C',
            '80%',
            'Curtains closed',
            'assets/cinema_mode.png', // Corrected path
          ),
          SizedBox(height: 24),

          // Turn On Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add functionality to turn on devices
              },
              child: Text('Turn On'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button ("+") with navigation function
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddDeviceScreen()), // Navigate to AddDeviceScreen
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Reusable Widget for Info Tiles (Temperature and Humidity)
  Widget _buildInfoTile(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Reusable Widget for Device Tiles with Images
  Widget _buildDeviceTile(String deviceName, String imagePath) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 64,
              height: 64,
            ),
            SizedBox(height: 8),
            Text(
              deviceName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Mode Tiles with Images
  Widget _buildModeTile(
    String modeName,
    String brightness,
    String temperature,
    String humidity,
    String curtainsStatus,
    String imagePath,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 64,
              height: 64,
            ),
            SizedBox(height: 8),
            Text(
              modeName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Brightness: $brightness',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Temperature: $temperature',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Humidity: $humidity',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Curtains: $curtainsStatus',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
