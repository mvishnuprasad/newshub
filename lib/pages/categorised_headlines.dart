import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/components/icons.dart';
import 'package:newshub/models/newsapimodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../methods/list_generate_methods.dart';
import '../services/dataprovider.dart';

class CategoryNews extends ConsumerWidget {
  final String title;
  const CategoryNews(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(categoryDataProvider);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: userData.when(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconsDecorated(icons: Icons.menu_rounded),
                            Row(
                              children: [
                                IconsDecorated(icons: Icons.search),
                                const SizedBox(width: 10),
                                IconsDecorated(icons: Icons.notifications),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Latest in $title",
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: newsCard(articleList, index),
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
