import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:newshub/pages/home_detailed.dart';
import '../constants/url_constants.dart';
import '../persistance/newsmodel.dart';

class NewsCard extends StatefulWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  final String? url;
  final String? content;
  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.source,
    required this.category,
    required this.url,
    required this.content,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void _saveToHive() async {
    final newsBox = await Hive.openBox<NewsModel>('newsBox');
    var newsModel = NewsModel(
      title: widget.title,
      author: widget.author,
      source: widget.source,
      category: widget.category,
      url: widget.url,
      description: widget.content,
    );
    await newsBox.add(newsModel);
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    double padding = 10;
    double width = MediaQuery.of(context).size.width;

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
                            widget.url ?? URLConstants().sampleImage,
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
                                widget.category,
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
                                        title: widget.title,
                                        author: widget.author,
                                        source: widget.source,
                                        category: widget.category,
                                        url: widget.url,
                                        description: widget.content,
                                      ) // The page to display as a bottom sheet
                                  );
                            },
                            child: Text(
                              widget.title,
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
                                      widget.author,
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
                                      widget.source,
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
                                  _toggleBookmark();
                                  _saveToHive();
                                },
                                child: Icon(
                                  isBookmarked
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
