import 'package:flutter/material.dart';
import 'package:newshub/models/newsapimodel.dart';
import 'package:newshub/services/apiservice.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Article> imageURLList = [];
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    // setState(() {
    //   isLoading = true;
    //   errorMessage = '';
    // });

    try {
      final imgList = await NewsAPIService().getNewsData();
      setState(() {
        imageURLList = (imgList);


      });
    } catch (e) {
      setState(() {
        print(e);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

            Text("${imageURLList.first.title}")

        ],
      ),
    );
  }
}
