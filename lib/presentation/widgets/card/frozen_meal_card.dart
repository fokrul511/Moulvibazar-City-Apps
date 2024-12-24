import 'package:flutter/material.dart';

class FrozenMealCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconAsset;
  final double? height;
  final Color? backgroundColor;

  const FrozenMealCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    this.height,
    this.backgroundColor, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: backgroundColor ?? Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              // Rounded corners for the image
              child: Image.network(
                iconAsset,
                height: height ?? 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: height,
                    width: height,
                    color: Colors.grey[300], // Placeholder color
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
