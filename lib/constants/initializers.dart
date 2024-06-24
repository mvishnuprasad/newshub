import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/newsapimodel.dart';
import '../services/dataprovider.dart';

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
  static List<Article> emptyList = [
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
  static List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  static List<FutureProvider<List<Article>>> providers = [
    businessProvider,
    entertainmentProvider,
    generalProvider,
    healthProvider,
    scienceProvider,
    sportsProvider,
    technologyProvider,
  ];
  static List<IconData> categoryIcons = [
    Icons.business_center_outlined,
    Icons.movie_outlined,
    Icons.all_inclusive_outlined,
    Icons.healing_outlined,
    Icons.science_outlined,
    Icons.sports_baseball_outlined,
    Icons.laptop_outlined,
  ];
  static Map<IconData, IconData> iconNames = {
    Icons.home_rounded: Icons.home_outlined,
    Icons.category_rounded: Icons.category_outlined,
    Icons.bookmark_rounded: Icons.bookmark_outline,
    Icons.person_rounded: Icons.person_outlined,
  };
  static Map<String, String> headlines = {
    "Stay Informed, Stay Ahead!": "Your daily digest of breaking news and trending stories delivered straight to your device.",
    "Explore News That Matters": "Discover a curated selection of news articles tailored to your interests and preferences.",
    "Never Miss a Beat!": "Get real-time updates on events happening around the globe with our intuitive news app."
  };

}

class AppColors {
  static Color primaryColor = const Color(0xff3c595d);
  static Color primaryAccentColor = const Color(0xffc0dbde);
  static Color secondaryAccentColor = const Color(0xff538388);
  static Color background = const Color(0xff101212);
  static Color highLight = const Color(0xfffeffff);
}
