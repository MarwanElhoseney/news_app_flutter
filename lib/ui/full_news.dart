import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/news_response/news.dart';
import 'package:url_launcher/url_launcher.dart';

class FullNews extends StatelessWidget {
  static const String routeName = "fullNews";

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(news.author ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(22)),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                news.title ?? ' ',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Text(
              news.description ?? ' ',
              style: TextStyle(fontSize: 12),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  news.publishedAt ?? '',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.right,
                )),
            Text(news.content ?? ""),
            InkWell(
              onTap: () {
                _launchUrl(news.url ?? "");
              },
              child: SizedBox(
                height: 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("View full article"),
                Icon(Icons.arrow_right_sharp)
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri _uri = Uri.parse(url);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_uri');
    }
  }
}
