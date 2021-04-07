import 'package:flutter/material.dart';
import './constants.dart' show Constants, AppColors;

enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,
    item = BottomNavigationBarItem(
      icon: Icon(icon, color: Color(AppColors.TabIconNormal)),
      activeIcon: Icon(activeIcon, color: Color(AppColors.TabIconActive)),
      title: Text(title, style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColors.TabIconNormal)
      )),
      backgroundColor: Colors.white,
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
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe6af,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe6c2,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe629,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe62a,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe67b,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe60f,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
  }

_build_PopupMunuItem(int iconName, String title) {
  return Row(
    children: <Widget>[
      Icon(IconData(
        iconName,
        fontFamily: Constants.IconFontFamily,
      ), size: 22.0, color: const Color(AppColors.AppBarPopupMenuColor)),
      Container(width: 12.0),
      Text(title, style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor))),
    ],
  );
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
            icon: Icon(IconData(
              0xe7d2,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0),
            onPressed: () { print("点击了搜索按钮"); },
          ),
          Container(width: 16.0),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _build_PopupMunuItem(0xe63f, "发起群聊"),
                  value: ActionItems.GROUP_CHAT
                ),
                PopupMenuItem(
                  child: _build_PopupMunuItem(0xe618, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _build_PopupMunuItem(0xe650, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _build_PopupMunuItem(0xe685, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _build_PopupMunuItem(0xe60c, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(IconData(
              0xe657,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0),
            onSelected: (ActionItems selected) { print("点击的是$selected"); },
          ),
          Container(width: 16.0),
        ],
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: botNavBar,
    ); 
  }
}