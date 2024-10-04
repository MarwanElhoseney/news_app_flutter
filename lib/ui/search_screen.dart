import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/ui/home/news_list_widget/news_item_widget.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSearchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError == "error" ||
            snapshot.data?.status == "error") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text("Try Again"))
            ],
          );
        }
        var article = snapshot.data?.articles ?? [];
        return ListView.separated(
          itemBuilder: (context, index) => NewsItemWidget(news: article[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: article.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: ApiManager.getSearchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError == "error" ||
            snapshot.data?.status == "error") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text("Try Again"))
            ],
          );
        }
        var article = snapshot.data?.articles ?? [];
        return ListView.separated(
          itemBuilder: (context, index) => NewsItemWidget(news: article[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: article.length,
        );
      },
    );
  }
}
