import 'package:flutter/material.dart';
import 'package:home_app/addDevice'; // Import the addDevice.dart file
import 'package:home_app/util/category_cards.dart';


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
          SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    categoryName: 'OLED TV',
                    iconImagePath: 'asset/tvicon.jpeg',
                  ),
                  CategoryCard(
                    categoryName: 'Lamp',
                    iconImagePath: 'asset/lampicon.png', 
                  ),
                  CategoryCard(
                    categoryName: 'Air conditioner',
                    iconImagePath: 'asset/aircond.jpeg'
                  ),

                  SizedBox(width: 10),
                ],
              ),
            ),

          SizedBox(height: 50),

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
            'Curtains closed', // Corrected path
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


  // Reusable Widget for Mode Tiles with Images
  Widget _buildModeTile(
    String modeName,
    String brightness,
    String temperature,
    String humidity,
    String curtainsStatus,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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