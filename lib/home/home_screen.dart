import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './constants.dart' show Constants, AppColors, AppStyles;
import './conversation_page.dart';
import 'contacts_page.dart';
import 'discover_page.dart';
import 'functions_page.dart';
import '../i18n/strings.dart' show Strings;
import './conversation_page.dart';

enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    item = BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: Text(title),
      backgroundColor: Colors.white,
    );
}

class HomeScreen extends StatefulWidget {

  String title = Strings.TitleWechat;
  Color headerColor;

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const HeaderColor = const Color(AppColors.PrimaryColor);
  PageController _pageController;
  int _currentIndex  = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  List<Widget> _mainActions;
  List<Widget> _functionActions;

  void initState() {
    super.initState();
    widget.headerColor = HeaderColor;

    // 初始化前3个界面的操作按钮
    _mainActions = [
      IconButton(
        icon: Icon(
            IconData(
              0xe7d2,
              fontFamily: Constants.IconFontFamily,
            ),
            size: Constants.ActionIconSize,
            color: AppColors.ActionIconColor),
        onPressed: () {
          print('点击了搜索按钮');
        },
      ),
      Container(width: 16.0),
      Theme(
        data: ThemeData(cardColor: Color(AppColors.ActionMenuBgColor)),
        child: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<ActionItems>>[
              PopupMenuItem(
                child: _buildPopupMunuItem(0xe63f, Strings.MenuGroupChat),
                value: ActionItems.GROUP_CHAT,
              ),
              PopupMenuItem(
                child: _buildPopupMunuItem(0xe618, Strings.MenuAddFriends),
                value: ActionItems.ADD_FRIEND,
              ),
              PopupMenuItem(
                child: _buildPopupMunuItem(0xe650, Strings.MenuQRScan),
                value: ActionItems.QR_SCAN,
              ),
              PopupMenuItem(
                child: _buildPopupMunuItem(0xe685, Strings.MenuPayments),
                value: ActionItems.PAYMENT,
              ),
              PopupMenuItem(
                child: _buildPopupMunuItem(0xe60c, Strings.MenuHelp),
                value: ActionItems.HELP,
              ),
            ];
          },
          icon: Icon(
              IconData(
                0xe657,
                fontFamily: Constants.IconFontFamily,
              ),
              size: Constants.ActionIconSize + 4.0,
              color: AppColors.ActionIconColor),
          onSelected: (ActionItems selected) {
            print('点击的是$selected');
          },
        ),
      ),
      Container(width: 16.0),
    ];
    _functionActions = [
      IconButton(
        icon: Icon(
            IconData(
              0xe60a,
              fontFamily: Constants.IconFontFamily,
            ),
            size: Constants.ActionIconSize + 4.0,
            color: AppColors.ActionIconColor),
        onPressed: () {
          print('打开相机拍短视频');
        },
      ),
      Container(width: 16.0),
    ];

    _navigationViews = [
      NavigationIconView(
        title: Strings.TitleWechat,
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
        title: Strings.TitleContact,
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
        title: Strings.TitleDiscovery,
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
        title: Strings.TitleMe,
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
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      // 微信聊天界面
      ConversationPage(),
      // 通讯录界面
      ContactsPage(),
      // 发现界面
      DiscoverPage(),
      // 我的界面
      FunctionsPage(),
    ];
  }

_buildPopupMunuItem(int iconName, String title) {
  return Row(
    children: <Widget>[
      Icon(
          IconData(
            iconName,
            fontFamily: Constants.IconFontFamily,
          ),
          size: 22.0,
          color: const Color(AppColors.AppBarPopupMenuColor)),
      Container(width: 12.0),
      Text(title,
          style:
              TextStyle(color: const Color(AppColors.AppBarPopupMenuColor))),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    // 此处新增以下3行
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(_currentIndex);
        });
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: AppStyles.TitleStyle),
        
        // 去除appBar下面的阴影
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: widget.headerColor,
        actions: _currentIndex == 3 ? _functionActions : _mainActions,
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
            switch(index) {
              case 0:
                widget.title = Strings.TitleWechat;
                widget.headerColor = HeaderColor;
                break;
              case 1:
                widget.title = Strings.TitleContact;
                widget.headerColor = HeaderColor;
                break;
              case 2:
                widget.title = Strings.TitleDiscovery;
                widget.headerColor = HeaderColor;
                break;
              case 3:
                widget.title = '';
                widget.headerColor = Colors.white;
                break;
            }
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    ); 
  }
}