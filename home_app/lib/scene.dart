import 'package:flutter/material.dart';

void main() {
  runApp(scenepage());
}

class scenepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  final List<String> items = ['Smoke Alarm', 'Disaster Warning', 'Flood', 'Fire'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scenes'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              title: Text(item),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text(
          'Example emergency settings',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}