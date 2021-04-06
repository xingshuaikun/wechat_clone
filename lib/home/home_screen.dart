import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon}) :
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,
    item = BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      title: Text(title),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm)
      ),
      NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.radio),
        activeIcon: Icon(Icons.rate_review)
      ),
      NavigationIconView(
        title: '发现',
        icon: Icon(Icons.tab),
        activeIcon: Icon(Icons.tab_unselected)
      ),
      NavigationIconView(
        title: '我',
        icon: Icon(Icons.portrait),
        activeIcon: Icon(Icons.power)
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击的是第$index个Tab');
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { print("点击了搜索按钮"); },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () { print("显示下拉列表"); },
          ),
        ]
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: botNavBar,
    ); 
  }
}