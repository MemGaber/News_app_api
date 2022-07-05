import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/home/category/tab_container.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/sources_response.dart';

class CategoryDetails extends StatelessWidget {
  Category category;

  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<SourcesResponse>(
              future: ApiManager.getSources(category.id),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      const Text('Something went wrong'),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Try Again'))
                    ],
                  );
                }
                if ("ok" != snapshot.data?.status) {
                  // server response has code and message
                  return Column(
                    children: [
                      Text(snapshot.data?.message ?? ""),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Try Again'))
                    ],
                  );
                }
                // i got data from server
                var sourcesList = snapshot.data?.sources ?? [];
                return TabContainer(sourcesList);
              }),
        )
      ],
    );
  }
}
