import 'package:flutter/material.dart';
import 'package:newshub/constants/initializers.dart';
import 'package:newshub/models/listmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/options.dart';
import '../constants/url_constants.dart';

void main() {
  runApp(
    const MaterialApp(home: UserProfile()),
  );
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: navBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 10, bottom: 20),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                    )),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(URLConstants().profilePic),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Michael B",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 220,
                    height: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryAccentColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "bmichael878@reddifmail.com",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                for (var i = 0; i < OptionList().profileData.length; i++)
                  Column(
                    children: [
                      ProfileOption(
                        title: OptionList().profileData.keys.toList()[i],
                        hintText: OptionList().profileData.values.toList()[i],
                        iconName: OptionList().iconsList[i],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
