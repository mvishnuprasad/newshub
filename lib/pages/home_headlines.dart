import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/components/icons.dart';
import 'package:newshub/models/newsapimodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../methods/list_generate_methods.dart';
import '../services/dataprovider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsData = ref.watch(countryProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: newsData.when(
            data: (userData) {
              List<Article> articleList = userData.map((e) => e).toList();
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconsDecorated(icons: Icons.menu_rounded),
                            Row(
                              children: [
                                IconsDecorated(icons: Icons.search),
                                SizedBox(width: 10),
                                IconsDecorated(icons: Icons.notifications),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Breaking News",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            enableInfiniteScroll: true,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 1200),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                          ),
                          items: generateStackedNewsCards(articleList)
                              .map((widget) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: widget,
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Recommendations",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: articleList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: newsCard(
                                  articleList,
                                  index,
                                  ref
                                          .watch(savedTitleProvider)
                                          .contains(articleList[index].title)
                                      ? true
                                      : false),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
