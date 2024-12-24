import 'package:flutter/material.dart';

class DailyNecessityCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final String image;
  final Color? cardColor;
  final Color? buttonColor;
  final TextStyle? titleStyle;
  final TextStyle? buttonTextStyle;
  final EdgeInsetsGeometry? padding;

  const DailyNecessityCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.image,
    this.cardColor,
    this.buttonColor,
    this.titleStyle,
    this.buttonTextStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: cardColor ?? Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle ??
                          const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor ?? Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          buttonText,
                          style: buttonTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey[300],
                      child: const Center(
                          child: Icon(Icons.error, color: Colors.red)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
