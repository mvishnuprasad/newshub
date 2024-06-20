import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/icons.dart';
import '../constants/initializers.dart';

class SavedDetailNews extends StatelessWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  final String? description;

  const SavedDetailNews(
      {super.key,
      required this.title,
      required this.author,
      required this.source,
      required this.category,
      this.description});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconsDecorated(icons: Icons.volume_down),
                        IconsDecorated(icons: Icons.share),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12),
                                maxLines: 3,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                ),
                              ),
                              Text(
                                source,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Icon(
                                Icons.access_time_filled,
                                size: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              category,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      description ?? TempNews().description,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
