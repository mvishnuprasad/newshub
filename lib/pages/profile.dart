import 'package:flutter/material.dart';
import 'package:newshub/models/listmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/options.dart';

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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Michael B",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.normal)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 30,
                    child: Center(
                      child: Text(
                        "bmichael878@reddifmail.com",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
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
