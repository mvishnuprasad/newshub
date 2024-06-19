import 'package:flutter/material.dart';
import 'package:newshub/components/icons.dart';
import 'package:newshub/components/newscard.dart';
import 'package:newshub/components/stackednewscard.dart';
import 'package:newshub/constants/constants.dart';
import 'package:newshub/models/newsapimodel.dart';
import 'package:newshub/services/apiservice.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Article> imageURLList = [];
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    // setState(() {
    //   isLoading = true;
    //   errorMessage = '';
    // });

    try {
      final imgList = await NewsAPIService().getNewsData();
      setState(() {
        imageURLList = (imgList.data['articles'] as List)
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
        //imageURLList = (imgList);
      });
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> customWidgets = [
      StackedNewsCard(
          title: TempNews().title,
          author: "author",
          source: "source",
          category: "category"),
      StackedNewsCard(
          title: TempNews().title,
          author: "author",
          source: "source",
          category: "category"),
      StackedNewsCard(
          title: TempNews().title,
          author: "author",
          source: "source",
          category: "category"),
    ];
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //children: [Text("${imageURLList.first.title}")],
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconsDecorated(icons: Icons.menu_rounded),
                      Row(
                        children: [
                          IconsDecorated(icons: Icons.search),
                          const SizedBox(
                            width: 10,
                          ),
                          IconsDecorated(icons: Icons.notifications),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 30),
                  child: Text(
                    "Breaking News",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    enableInfiniteScroll: true,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1
                  ),
                  items: customWidgets.map((widget) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: widget,
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20,bottom: 20),
                  child: Text(
                    "Recommendations",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            child: NewsCard(
                                title: TempNews().title,
                                author: "Ron Miller",
                                source: "Reuters",
                                category: "Geopolitics"),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
