import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconImagePath;
  final String categoryName;

  const CategoryCard({
    super.key,
    required this.iconImagePath,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 200, // Keep the width fixed
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(100, 44, 12, 100),
              Colors.grey,
            ],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: [
            Image.asset(
              iconImagePath,
              height: 90, // Increase the height of the image
              width: 90,  // Increase the width of the image
            ),
            const SizedBox(height: 4), // Use height instead of width for vertical spacing
            Text(
              categoryName,
              style: const TextStyle(
                fontSize: 20, // Increase the font size of the text
                fontWeight: FontWeight.w300,
                fontFamily: 'Workspace',
                color: Colors.white, // Change text color to white for better visibility
              ),
            ),
          ],
        ),
      ),
    );
  }
}