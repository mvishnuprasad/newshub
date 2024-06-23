import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:newshub/pages/home_detailed.dart';
import 'package:newshub/persistance/hive_methods.dart';
import '../constants/url_constants.dart';
import '../persistance/newsmodel.dart';
import '../services/dataprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsCard extends ConsumerWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  final String? url;
  final String? content;
  final int index;
  final bool saved;
  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.source,
    required this.category,
    required this.url,
    required this.content,
    required this.index,
    required this.saved,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var savedTitle = ref.watch(savedTitleProvider);
    double padding = 10;
    double width = MediaQuery.of(context).size.width;
    var newsModel = NewsModel(
        title: title, author: author, source: source, category: category);
    return Center(
      child: Column(children: [
        Container(
            width: width - 50,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(2, 3))
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.3,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            // ,
                            url ?? URLConstants().sampleImage,
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 12),
                              ),
                              const Icon(
                                Icons.more_horiz,
                                size: 28.0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width * 0.45,
                            maxHeight: 70,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => DetailedNews(
                                        title: title,
                                        author: author,
                                        source: source,
                                        category: category,
                                        url: url,
                                        description: content,
                                      ) // The page to display as a bottom sheet
                                  );
                            },
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: width * 0.5 * 0.3,
                                      maxHeight: 80,
                                    ),
                                    child: Text(
                                      author,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(
                                      Icons.circle,
                                      size: 6,
                                    ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: width * 0.5 * 0.3,
                                      maxHeight: 80,
                                    ),
                                    child: Text(
                                      source,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.grey,
                                          fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  HiveMethods().saveToHive(newsModel);
                                  bool titleExists = ref
                                      .read(savedTitleProvider.notifier)
                                      .state
                                      .any((item) => item == newsModel.title);

                                  if (!titleExists) {
                                    savedTitle.add(title);
                                  } else {
                                    savedTitle.remove(title);
                                  }
                                  ref
                                      .read(savedTitleProvider.notifier)
                                      .update((state) => savedTitle.toList());
                                },
                                child: Icon(
                                  ref
                                          .watch(savedTitleProvider.notifier)
                                          .state
                                          .contains(title)
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  size: 24.0,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ) //const Icon(Icons.chevron_right)
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
