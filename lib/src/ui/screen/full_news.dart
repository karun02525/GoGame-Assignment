import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:gogame_app/src/ui/widgets/text_widget.dart';
import 'package:gogame_app/src/utils/global.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class FullNews extends StatefulWidget {

  final String imgPath,title,content,url,source;
     final DateTime date;
  FullNews({this.imgPath,this.url,this.title,this.content,this.source,this.date});

  @override
  _FullNewsState createState() => _FullNewsState();
}

class _FullNewsState extends State<FullNews> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment(-1.05, 1),
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: ()=> Navigator.of(context).pop()
                )
            ),

            Visibility(
              visible: widget.imgPath != null,
              child: Hero(
                tag: widget.imgPath??'',
                child: Image.network(widget.imgPath ?? ''),
              ),
            ),

            TextWidget(title:  widget.title??'',
                isBold: true,
                fontSize: 19,
                top: 10,
                left: 10),

            TextWidget(title: widget.content??'',
                fontSize: 15,
                top: 10,
                left: 10),


            TextWidget(title:Global.timeAgo(widget.date),
              fontSize: 14,
              color: Colors.blue,
              top: 10,
              isBold: true,
              left: 10,
              bottom: 20,
            ),

            Divider(),

            FlatButton.icon(
              icon: Icon(Icons.open_in_new),
                label: Text("Read Full Story"),
                onPressed: ()=>Navigator.of(context).push(
                   CupertinoPageRoute(builder: (context)=> WebviewScaffold(
                      url: widget.url??'',
                      withZoom: true,
                      appBar: AppBar(title: Row(
                        children: <Widget>[
                          Icon(MdiIcons.newspaper),
                          Text("  "+widget.source??''),
                        ],
                      ),),
                    initialChild: Center(child: CircularProgressIndicator()),
                  )
                  ),
                ),
            ),
          ],
        ),
      )
    );
  }
}
