
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/newsapimodel.dart';

class TempNews {
  String title =
      "Did Saudi Arabia really end petrodollar deal? UBS economist clarifies";
  String description =
      "Reports of Saudi Arabia ending the longstanding petrodollar deal with the US "
      "emerged last week, sparking online discussions about the potential decline of the dollar as the world's reserve currency. "
      "However, amid growing speculation about the imminent decline of the US dollars global dominance, several experts highlighted "
      "a critical flaw about the end of the petrodollar deal, pointing out there was never an agreement to begin with Paul Donovan, the "
      "chief economist at UBS Global Wealth Management, in a blog post said that the story had gained unexpected traction, serving as yet "
      "another example of the dangers of “confirmation bias.The story seems to have started in the crypto world. Many crypto speculators "
      "desperately want to believe in the dollar’s demise, said Donovan.Reports emerged that an agreement signed between Saudi Arabia and "
      "the US in 1974, being termed as the 'petrodollar deal', was not renewed and expired on June 9, 2024.The economist explained that the"
      " arrangement may have been made due to Saudi Arabia's need to invest the excess revenue from its oil sales.The US and Saudi Arabia "
      "did establish a Joint Commission for economic cooperation in June 1974. This aim was to help Saudi Arabia spend its sudden glut of "
      "dollars on US products. In July of that year, Saudi agreed to invest oil dollars in US Treasuries (this was kept confidential until 2016),"
      " said Donovan in the blog post.";
}


class Initializers {
  final List<Article> emptyList = [
    Article(
        source: Source(id: "id", name: "name"),
        author: "author",
        title: "title",
        description: "description",
        url: "url",
        urlToImage: "urlToImage",
        publishedAt: "publishedAt",
        content: "content")
  ];
  final List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  final List<IconData> categoryIcons = [
    Icons.business_center_outlined,
    Icons.movie_outlined,
    Icons.all_inclusive_outlined,
    Icons.healing_outlined,
    Icons.science_outlined,
    Icons.sports_baseball_outlined,
    Icons.laptop_outlined,
  ];

}
