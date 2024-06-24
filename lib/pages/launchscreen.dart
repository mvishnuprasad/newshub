import 'package:flutter/material.dart';
import 'package:newshub/constants/initializers.dart';
import 'package:newshub/main.dart';
import '../models/newsapimodel.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LaunchScreen(),
    );
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  List<Article> imageURLList = [];
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NewsHub()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.highLight,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book_outlined,
                size: 32.0,
                color: AppColors.primaryColor,
              ),
              Text(
                "NewsHub",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryAccentColor,
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
