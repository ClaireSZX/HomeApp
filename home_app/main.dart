import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AddDeviceScreen(),
  ));
}

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Device'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(
              Icons.bluetooth_searching,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            const Text(
              'Bluetooth Connect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Searching for device...'),
            const SizedBox(height: 16),
            const Text(
              'Cannot find device?',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Add Manually',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  _CategoryTile(
                    category: 'Electrical',
                    items: ['Plug (BLE+Wi-Fi)', 'Socket (Wi-Fi)', 'Socket (Zigbee)'],
                  ),
                  _CategoryTile(
                    category: 'Lighting',
                    items: ['Tapo Smart Bulb (Wi-Fi)', 'Wiz Smart Bulb (Wi-Fi & Bluetooth)', "Philip's Hue (Zigbee, Wi-Fi, Bluetooth)"],
                  ),
                  _CategoryTile(
                    category: 'Sensors',
                    items: ['Socket (BLE)', 'Dualband Plug (2.4GHz & 5GHz)', 'Socket (NB-IoT)'],
                  ),
                  _CategoryTile(
                    category: 'Switch',
                    items: [],
                  ),
                  _CategoryTile(
                    category: 'Camera & Lock',
                    items: ['TAPO T100 Smart Motion Sensor', 'APO T110 Your Window & Doors Sensor'],
                  ),
                  _CategoryTile(
                    category: 'Leisure',
                    items: [],
                  ),
                  _CategoryTile(
                    category: 'Kitchen Appliances',
                    items: [
                      'Airfryer Combi 7000 Series XXL',
                      'Airfryer 5000 Series XL',
                      'Philips All-in-One Cooker',
                      'Philips Electric Pressure Cooker',
                      'Blender'
                    ],
                  ),
                  _CategoryTile(
                    category: 'Home Appliances',
                    items: [],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QRCodeScannerScreen(),
                  ),
                );
              },
              child: const Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String category;
  final List<String> items;

  const _CategoryTile({
    required this.category,
    this.items = const [],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => _CategoryDetails(category: category, items: items),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _CategoryDetails extends StatelessWidget {
  final String category;
  final List<String> items;

  const _CategoryDetails({
    required this.category,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            category,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QRCodeScannerScreen extends StatelessWidget {
  const QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan to add device'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const QRViewPlaceholder(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for scanning from gallery
                },
                icon: const Icon(Icons.image),
                label: const Text('Scan from Gallery'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for turning on flashlight
                },
                icon: const Icon(Icons.flashlight_on),
                label: const Text('Turn on flashlight'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QRViewPlaceholder extends StatelessWidget {
  const QRViewPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('QR Code Scanner Placeholder'),
    );
  }
}
