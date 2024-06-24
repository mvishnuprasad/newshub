import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newshub/components/savednewscard.dart';
import 'package:newshub/services/dataprovider.dart';
import '../persistance/newsmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedArticles extends ConsumerWidget {
  const SavedArticles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedArticles = ref.watch(savedNewsProvider);
    return Scaffold(
      body: FutureBuilder<Box<NewsModel>>(
        future: Hive.openBox<NewsModel>('newsBox'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var newsBox = snapshot.data!;
            var savedNews = newsBox.values.toList();
            return SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saved Articles",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 40),
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: savedNews.length,
                            itemBuilder: (context, index) {
                              var news = savedNews[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: SavedNewsCard(
                                    title: news.title,
                                    author: news.author,
                                    source: news.source,
                                    category: news.category,
                                    description: news.description,
                                    index: index),
                              );
                            },
                          ),
                        ],
                      ),
                    )));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
