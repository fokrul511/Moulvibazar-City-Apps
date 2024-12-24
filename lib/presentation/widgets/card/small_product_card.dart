import 'package:flutter/material.dart';

class SmallProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? shadowColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const SmallProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
    this.height,
    this.width,
    this.imageHeight,
    this.imageWidth,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.shadowColor,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 100,
        width: width ?? 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: padding ?? const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  height: imageHeight ?? 50,
                  width: imageWidth ?? 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle ??
                      const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: subtitleTextStyle ??
                      const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
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
