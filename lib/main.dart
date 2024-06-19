import 'package:flutter/material.dart';
import 'package:newshub/pages/homepage.dart';
import 'package:newshub/pages/launchscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/navbar.dart';

void main() {
  runApp(const ProviderScope(child: Splash(),));
}

class NewsHub extends StatelessWidget {
  const NewsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: navBar(),
      ),
    );
  }
}
