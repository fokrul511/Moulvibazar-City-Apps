import 'package:flutter/material.dart';

class ProductCardTwo extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final String price;
  final String weight;
  final VoidCallback onAddPressed;
  final VoidCallback onTap;
  final bool isFavorite;
  final double width;
  final double imageHeight;
  final Color? favoriteIconColor;
  final Color? addIconColor;
  final TextStyle? productNameStyle;
  final TextStyle? priceStyle;
  final TextStyle? weightStyle;

  const ProductCardTwo({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.weight,
    required this.onAddPressed,
    required this.onTap,
    this.isFavorite = false,
    this.width = 200,
    this.imageHeight = 150,
    this.favoriteIconColor = Colors.red,
    this.addIconColor = Colors.green,
    this.productNameStyle,
    this.priceStyle,
    this.weightStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isFavorite)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: favoriteIconColor,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: productNameStyle ??
                        const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: addIconColor),
                  onPressed: onAddPressed,
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: priceStyle ??
                        const TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  weight,
                  style: weightStyle ??
                      TextStyle(
                        fontSize: 14.0,
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
