import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sources_response.dart';

class NewsContainer extends StatelessWidget {
  Source selectedSource;

  NewsContainer(this.selectedSource);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(selectedSource.id ?? "", ""),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something went wrong'),
              ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
            ],
          );
        }
        if ("ok" != snapshot.data?.status) {
          // server response has code and message
          return Column(
            children: [
              Text(snapshot.data?.message ?? ""),
              ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
            ],
          );
        }

        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (_, index) {
            return NewsWidget(newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
