import 'package:flutter/material.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/style/my_theme_data.dart';
import 'package:news_app/ui/full_news.dart';
import 'package:news_app/ui/home/home_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      //darkTheme: MyThemeData.lightTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        FullNews.routeName: (_) => FullNews(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
