import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  final String avatarText;
  final Color avatarBgColor;
  final Color avatarTextColor;
  final String title;
  final String subtitle;
  final Widget expandedContent;
  final double? elevation;
  final Color? cardColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? contentTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? cardMargin;

  const ExpandableCard({
    super.key,
    required this.avatarText,
    required this.title,
    required this.subtitle,
    required this.expandedContent,
    this.avatarBgColor = Colors.green,
    this.avatarTextColor = Colors.white,
    this.elevation = 4,
    this.cardColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.contentTextStyle,
    this.contentPadding,
    this.cardMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 4,
      margin: cardMargin ?? const EdgeInsets.all(16.0),

      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleTextStyle ??
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   subtitle,
                    //   style: subtitleTextStyle ??
                    //       const TextStyle(fontSize: 14, color: Colors.grey),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          children: [
            Padding(
              padding: contentPadding ?? const EdgeInsets.all(16.0),
              child: DefaultTextStyle(
                style: contentTextStyle ??
                    const TextStyle(fontSize: 14, color: Colors.black),
                child: expandedContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
