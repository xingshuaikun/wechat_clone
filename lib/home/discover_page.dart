import 'package:flutter/material.dart';
import 'full_width_button.dart';
import 'constants.dart' show AppColors;

class DiscoverPage extends StatefulWidget {
  @override
  
  _DiscoverPageState createState() => _DiscoverPageState();
}


class _DiscoverPageState extends State<DiscoverPage> {
  static const SEPARATE_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_social_circle.png',
              title: '朋友圈',
              onPressed: () {
                print("点击了朋友圈");
              },
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_quick_scan.png',
              title: '扫一扫',
              showDivider: true,
              onPressed: () {
                print("点击了扫一扫");
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_shake_hands.png',
              title: '摇一摇',
              onPressed: () {
                print("点击了摇一摇");
              },
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_feeds.png',
              title: '看一看',
              showDivider: true,
              onPressed: () {
                print("点击了看一看");
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_quick_search.png',
              title: '搜一搜',
              onPressed: () {
                print("点击了搜一搜");
              },
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_people_nearby.png',
              title: '附近的人',
              showDivider: true,
              onPressed: () {
                print("点击了附近的人");
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_bottle_msg.png',
              title: '漂流瓶',
              onPressed: () {
                print("点击了漂流瓶");
              },
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_shopping.png',
              title: '购物',
              showDivider: true,
              onPressed: () {
                print("点击了购物");
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_game_entry.png',
              title: '游戏',
              onPressed: () {
                print("点击了游戏");
              },
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_mini_program.png',
              title: '小程序',
              onPressed: () {
                print("点击了小程序");
              },
            ),
          ],
        ),
      ),
    );
  }
}