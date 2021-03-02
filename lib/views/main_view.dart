import 'package:fastcode_design/shared/helpers/icon_helper.dart';
import 'package:fastcode_design/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  PageController _viewCtrl = PageController();
  int _currentView = 2;
  int _oldView = 0;

  List<Widget> _views = [
    HomeView(),
  ];

  List<Icon> _icons = [
    Icon(Icons.mic_none, size: 30.0, color: Colors.grey[300]),
    Icon(Icons.textsms_outlined, size: 30.0, color: Colors.grey[300]),
    Icon(Icons.home, size: 40.0,color: Colors.white),
    Icon(Icons.favorite_outline_rounded, size: 30.0, color: Colors.grey[300]),
    Icon(Icons.search_outlined, size: 30.0, color: Colors.grey[300])
  ];

  @override
  void dispose() {
    _viewCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget> [
          PageView(
            controller: _viewCtrl,
            children: _views,
            onPageChanged: _changeView,
          ),
          _bottomNavigationBar()
        ]
      ),
    );
  }

  Widget _bottomNavigationBar(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: CurvedNavigationBar(
          index: _currentView,
          height: 60.0,
          items: <Widget>[
            for (var icon in _icons) 
              Container(
                width: 40.0,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(6.0),
                child: icon
              )
          ],
          color: Colors.black,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.black,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (int index){
            _changeView(index);
            _viewCtrl.jumpToPage(index);
          },
        )
      )
    );
  }

  void _changeView(int index){
    setState(() {  
      IconData oldIcon = getOutlineIcon(_currentView);
      IconData newIcon = getFilledIcon(index);
      _oldView = _currentView;
      _currentView = index;
      _icons[_oldView] = Icon(oldIcon, size: 30.0, color: Colors.grey[300]);
      _icons[_currentView] = Icon(newIcon, size: 40.0, color: Colors.white);
    });
  }

}