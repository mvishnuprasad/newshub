import 'package:flutter/material.dart';
import 'package:newshub/pages/homepage.dart';

void main() {
  runApp(const NewsHub());
}
class NewsHub extends StatelessWidget {
  const NewsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
