import 'package:flutter/material.dart';

class TextWithBackground extends StatelessWidget {
  final String title;
  const TextWithBackground({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: measureTextWidth(title, 12) + 10,
      height: 24,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

double measureTextWidth(String text, double fontSize, {FontStyle? fontStyle}) {
  final textStyle = TextStyle(
    fontSize: fontSize,
    fontStyle: fontStyle ?? FontStyle.normal,
  );
  final textSpan = TextSpan(text: text, style: textStyle);
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  return textPainter.width;
}
