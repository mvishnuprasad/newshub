import 'package:flutter/material.dart';
import 'package:newshub/constants/initializers.dart';
import 'package:newshub/main.dart';
import 'package:newshub/pages/landingpage.dart';
import '../models/newsapimodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int? isFirstInstall;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isFirstInstall = prefs.getInt("first");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isFirstInstall == 1 || isFirstInstall == null ? LandingPage() : const NewsHub()));
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
