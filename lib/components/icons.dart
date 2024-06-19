import 'package:flutter/material.dart';

class IconsDecorated extends StatelessWidget {
  IconData icons;
  IconsDecorated({required this.icons, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icons,
          size: 24.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
