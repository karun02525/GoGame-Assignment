import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogame_app/src/api/model/news_model.dart';
import 'package:gogame_app/src/api/repositories/news_repo.dart';
import 'package:gogame_app/src/config/constraints.dart';
import 'package:gogame_app/src/ui/widgets/content_widget.dart';

class SportsPage extends StatefulWidget {

  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {

  bool isDataLoaded = false;
  List<Article> data=[];
  NewsRepository _repository;
  @override
  void initState() {
    super.initState();
    _repository=NewsRepository();
    getBusiness();
  }

  void getBusiness() async {
    _repository.findAllNews(Config.sportsUrl).then((value) {
      setState(() {
        isDataLoaded=true;
        data=value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    if(isDataLoaded)
      return data==null?Container(child: Center(child: Text('No data Available'))) :
      ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
            return ContentWidget(item:data[i]);
          }
      );
    else
      return Center(child: CupertinoActivityIndicator(animating: true,radius: 20,));
  }
}