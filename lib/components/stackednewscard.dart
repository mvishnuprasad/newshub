import 'package:flutter/material.dart';
import 'package:newshub/components/textcomponents.dart';
import 'package:newshub/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/detailednews.dart';

class StackedNewsCard extends StatefulWidget {
  final String title;
  final String author;
  final String source;
  final String category;
  final String? url;
  const StackedNewsCard({
    super.key,
    required this.title,
    required this.author,
    required this.source,
    required this.category,
    required this.url,
  });

  @override
  State<StackedNewsCard> createState() => StackedNewsCardState();
}

class StackedNewsCardState extends State<StackedNewsCard> {
  @override
  Widget build(BuildContext context) {
    double padding = 10;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Container(
            width: width - 50,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 1,
                    offset: const Offset(2, 2))
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.url ?? URLConstants().sampleImage,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                          stops: const [0.1, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWithBackground(title: "Sports"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.author,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                          widget.source,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
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
                            builder: (context) =>
                                const DetailedNews(), // The page to display as a bottom sheet
                          );
                        },
                        child: Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
