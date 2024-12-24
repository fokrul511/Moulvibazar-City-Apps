import 'package:flutter/material.dart';

class GroceryCard extends StatelessWidget {
  final String title;
  final String time;
  final String deliveryInfo;
  final String image;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? timeColor;
  final Color? infoColor;
  final VoidCallback onTap;

  const GroceryCard({
    super.key,
    required this.title,
    required this.time,
    required this.deliveryInfo,
    required this.image,
    this.backgroundColor,
    this.titleColor,
    this.timeColor,
    this.infoColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: backgroundColor ?? Colors.amber[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: titleColor ?? Colors.brown[800],
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Replaced with sized box for better readability
                      Text(
                        '$time',
                        style: TextStyle(
                          fontSize: 16,
                          color: timeColor ?? Colors.red[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        deliveryInfo,
                        style: TextStyle(
                          fontSize: 16,
                          color: infoColor ?? Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey[700],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
