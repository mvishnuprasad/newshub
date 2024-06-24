import 'package:flutter/material.dart';
import 'package:newshub/constants/initializers.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/url_constants.dart';
import '../main.dart';

void main() {
  runApp(MaterialApp(
    home: LandingPage(),
  ));
}

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPageValue = 0;

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color:
              isActive ? AppColors.primaryColor : AppColors.primaryAccentColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2cd3c3),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: URLConstants.onboarding.length,
              onPageChanged: (int page) {
                getChangedPageAndMoveBar(page);
              },
              itemBuilder: (context, index) {
                return Screen(
                  index: index,
                  isVisible:
                      currentPageValue == URLConstants.onboarding.length - 1
                          ? true
                          : false,
                );
              },
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < URLConstants.onboarding.length; i++)
                        if (i == currentPageValue) ...[circleBar(true)] else
                          circleBar(false),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class Screen extends StatelessWidget {
  final int index;
  final bool isVisible;
  const Screen({super.key, required this.index, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.highLight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Image.network(URLConstants.onboarding[index]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Initializers.headlines.keys.toList()[index],
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                const SizedBox(height: 20),
                Text(
                  Initializers.headlines.values.toList()[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryAccentColor),
                ),
                const SizedBox(height: 40),
                Visibility(
                  visible: isVisible,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.primaryAccentColor,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const NewsHub()));
                    },
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(26))),
                    child: Icon(
                      Icons.arrow_forward,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
