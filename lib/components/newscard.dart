import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshub/pages/detailednews.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  const NewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.source,
    required this.category,
  });

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
                            'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                                size: 32.0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width * 0.5,
                            maxHeight: 80,
                          ),
                          child: GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,

                                builder: (context) => const DetailedNews(), // The page to display as a bottom sheet
                              );
                            },
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
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
                              const Icon(
                                Icons.bookmark,
                                size: 28.0,
                                color: Colors.grey,
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
