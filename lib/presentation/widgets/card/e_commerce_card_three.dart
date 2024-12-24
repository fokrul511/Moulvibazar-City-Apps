import 'package:flutter/material.dart';

class ECommerceCardThard extends StatelessWidget {
  final String productName;
  final String description;
  final double price;
  final String imageUrl;
  final double? rating;
  final int? reviewCount;
  final VoidCallback onTap;
  final VoidCallback addToCart;

  const ECommerceCardThard({
    super.key,
    required this.productName,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating,
    this.reviewCount,
    required this.onTap,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      // Handle favorite toggle action here
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (rating != null) ...[
                  Icon(Icons.star, color: Colors.green, size: 16),
                  Text(
                    rating.toString(),
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  if (reviewCount != null)
                    Text(
                      '($reviewCount)',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            // TertiaryButton(
            //   borderRadius: 20,
            //   backgroundColor: AppColors.backgroundColor,
            //   textColor: AppColors.textColorPrimary,
            //   textSize: 14,
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   title: 'Add to Cart',
            //   onTap: addToCart,
            // )
          ],
        ),
      ),
    );
  }
}
