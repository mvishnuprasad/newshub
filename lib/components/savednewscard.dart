import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshub/pages/saved_detailnews.dart';
import 'package:hive/hive.dart';

import '../persistance/newsmodel.dart';

class SavedNewsCard extends StatelessWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  final String? description;
  final int index;
  const SavedNewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.source,
    required this.category,
    required this.description,
    required this.index,
  });
  void delete(int index) async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');

    await newsBox.deleteAt(index);
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    double padding = 10;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(children: [
        Container(
            width: width - 40,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.8,
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
                              GestureDetector(
                                onTap: () {
                                  delete(index);
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                  size: 32.0,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width * 0.8,
                            maxHeight: 80,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => SavedDetailNews(
                                        title: title,
                                        author: author,
                                        source: source,
                                        category: category,
                                        description: description,
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
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: width * 0.8 * 0.3,
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
                                  //_saveToHive();
                                },
                                child: const Icon(
                                  Icons.bookmark,
                                  size: 28.0,
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
