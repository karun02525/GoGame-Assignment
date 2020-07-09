import 'package:flutter/material.dart';
import 'package:gogame_app/src/ui/screen/tabs/sports.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'tabs/business.dart';
import 'tabs/headlines.dart';
import 'tabs/technology.dart';

class TabNewsHome extends StatefulWidget {

  @override
  TabNewsHomeState createState() {
    return new TabNewsHomeState();
  }
}

class TabNewsHomeState extends State<TabNewsHome> with AutomaticKeepAliveClientMixin{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final  _pages = [
    HeadlinesPage(),
    SportsPage(),
    TechnologyPage(),
    BusinessPage()
  ];
  int _currentPage = 0;

  void changePage(int i){
    setState(() {
      _currentPage = i;
      updateKeepAlive();
    });
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "GoGame",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),
            ),
          ),
          key: _scaffoldKey,
          body: _pages[_currentPage],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentPage,
            //fixedColor: Colors.greenAccent,
              //type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.fire),
                    title: Text("Headlines"),
                    backgroundColor: Colors.redAccent
                ),
                BottomNavigationBarItem(
                  icon: Icon(MdiIcons.run),
                  title: Text("Sports"),
                  backgroundColor: Colors.blueAccent
                ),
                BottomNavigationBarItem(
                  icon: Icon(MdiIcons.cellphoneAndroid),
                  title: Text("Technology"),
                  backgroundColor: Colors.green
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  title: Text("Business"),
                  backgroundColor: Colors.amber
                ),
              ],
              onTap: (int index) => changePage(index)
          ),
        ),
      ),
      onWillPop: (){},
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



}

