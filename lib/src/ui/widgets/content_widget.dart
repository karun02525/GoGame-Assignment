import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogame_app/src/api/model/news_model.dart';
import 'package:gogame_app/src/utils/global.dart';
import 'file:///D:/project/app/gogame_app/gogame_app/lib/src/ui/screen/full_news.dart';

import 'text_widget.dart';

class ContentWidget extends StatelessWidget {
  final Article item;
  ContentWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
      child: InkWell(splashColor: Colors.green,
          onTap: ()=>Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context)=>FullNews(
                imgPath:item.urlToImage,
                title: item.title,
                content: item.content,
                url: item.url,
                source:item.source.name,
                date:item.publishedAt,
              ),
            ),
          ),
          child: Card(
            elevation: 20.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: item.urlToImage != null,
                  child: Hero(
                    tag: item.urlToImage??'',
                    child: Image.network(item.urlToImage ?? ''),
                  ),
                ),
                TextWidget(title: item.title??'',
                    isBold: true,
                    fontSize: 18,
                    top: 10,
                    left: 10),
                TextWidget(title: item.description??'',
                  fontSize: 12,
                  top: 5,
                  left: 10,
                  bottom: 10,
                ),
                TextWidget(title:Global.timeAgo(item.publishedAt),
                  fontSize: 12,
                  color: Colors.blueAccent,
                  left: 10,
                  bottom: 10,
                ),
              ],
            ),
          )
      ),
    );
  }
}
