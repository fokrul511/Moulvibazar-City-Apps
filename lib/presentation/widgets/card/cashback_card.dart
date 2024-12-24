import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CashbackCard extends StatelessWidget {
  final String ?cashbackCode;
  final double? cashbackAmount;
  final String ?unlockText;
  final String ?buttonText;
  final Color? cardColor;
  final Color? shadowColor;
  final TextStyle? codeTextStyle;
  final TextStyle? cashbackTextStyle;
  final TextStyle? unlockTextStyle;
  final TextStyle? buttonTextStyle;

  const CashbackCard({
    super.key,
    this.cashbackCode ,
    this.cashbackAmount,
    this.unlockText ,
    this.buttonText,
    this.cardColor,
    this.shadowColor,
    this.codeTextStyle,
    this.cashbackTextStyle,
    this.unlockTextStyle,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: (shadowColor ?? Colors.grey).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cashbackCode??'',
                    style: codeTextStyle ??
                        const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    unlockText??'',
                    style: unlockTextStyle ??
                        TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.green),
                      const SizedBox(width: 5),
                      Text(
                        'Up to \$${cashbackAmount?.toStringAsFixed(2)} cashback',
                        style: cashbackTextStyle ??
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: cashbackCode??'Copy Code'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code copied to clipboard')),
                );
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    buttonText!,
                    style: buttonTextStyle ??
                        const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
