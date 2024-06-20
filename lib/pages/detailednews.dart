import 'package:flutter/material.dart';
import 'package:newshub/constants/url_constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/icons.dart';
import '../constants/initializers.dart';
import '../models/newsapimodel.dart';

class DetailedNews extends StatelessWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  final String? url;
  final String? description;

  const DetailedNews(
      {super.key,
      required this.title,
      required this.author,
      required this.source,
      required this.category,
      this.url,
      this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(children: [
              Image.network(
                'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                alignment: Alignment.topCenter,
                width: width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconsDecorated(icons: Icons.arrow_back),
                    IconsDecorated(icons: Icons.share),
                  ],
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.55,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
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
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
