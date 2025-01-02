import 'package:flutter/material.dart';

class noNetworkImage extends StatelessWidget {
  final String message;
  final String subMessage;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final VoidCallback ontap;
  final String? image;

  const noNetworkImage({
    super.key,
    required this.message,
    required this.subMessage,
    this.icon,
    this.iconSize,
    this.iconColor,
    required this.ontap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: ontap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   icon ?? Icons.search_off,
              //   size: iconSize ?? AppDimensions.SIZE_100,
              //   color: iconColor ?? AppColors.grey,
              // ),
              Image(
                image: AssetImage(image ?? ''),
                height: 200,
                width: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 50);
                },
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                subMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 8,
              ),

              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: ontap,
                  child: Text(
                    "Retry",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
