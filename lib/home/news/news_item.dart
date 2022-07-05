import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: news.urlToImage == null ? Icon(Icons.broken_image)
                : Image.network(
                    news.urlToImage ?? "",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Text(news.author ?? "",style: const TextStyle(
            fontSize: 12,color: Colors.grey
          ),),
          Text(news.title ?? "",
              style: const TextStyle(
                  fontSize: 18,color: Colors.black
              )),
          Text(news.publishedAt ?? "",
              style: const TextStyle(
                  fontSize: 12,color: Colors.grey
              ),textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}
