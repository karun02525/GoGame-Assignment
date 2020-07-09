import 'package:flutter/material.dart';
import 'src/ui/screen/tab_news_home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "News App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        home: TabNewsHome());
  }
}
