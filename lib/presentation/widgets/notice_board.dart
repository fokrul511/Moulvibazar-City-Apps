import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';

class NoticeBoard extends StatelessWidget {
  final String noticeText;

  const NoticeBoard({Key? key, required this.noticeText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              'নোটিশ:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 35,
            padding: const EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: MarqueeText(
              alwaysScroll: true,
              text: TextSpan(
                text: noticeText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade900,
                ),
              ),
              speed: 15,
              textDirection: TextDirection.ltr,
              marqueeDirection: MarqueeDirection.rtl,
            ),
          ),
        ),
      ],
    );
  }
}
