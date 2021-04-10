import 'package:flutter/material.dart';
import 'full_width_button.dart';
import 'constants.dart' show AppColors, Constants;
import '../i18n/strings.dart' show Strings;

class DiscoverPage extends StatefulWidget {
  @override
  
  _DiscoverPageState createState() => _DiscoverPageState();
}


class _DiscoverPageState extends State<DiscoverPage> {
  static const SEPARATE_SIZE = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FullWidthButton(
              iconPath: 'assets/images/ic_social_circle.png',
              title: Strings.FriendsCircle,
              customWidget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FullWidthButton.iconTag(
                      'https://randomuser.me/api/portraits/women/60.jpg',
                      showDot: true,
                      isBig: true),
                  SizedBox(width: 12.0),
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_quick_scan.png',
              title: Strings.Scan,
              showDivider: true,
              onPressed: () {
                print('点击了扫一扫');
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_shake_hands.png',
              title: Strings.Shake,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_feeds.png',
              title: Strings.KnowMore,
              showDivider: true,
              customWidget: Row(
                children: <Widget>[FullWidthButton.tag('NEW')],
              ),
              onPressed: () {},
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_quick_search.png',
              title: Strings.SearchMore,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_people_nearby.png',
              title: Strings.FriendsNearby,
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_bottle_msg.png',
              title: Strings.FlowMessage,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_shopping.png',
              title: Strings.Shopping,
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_game_entry.png',
              title: Strings.Games,
              customWidget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FullWidthButton.desText('注册领时装抢红包'),
                  SizedBox(width: 6.0),
                  FullWidthButton.iconTag('assets/images/ad_game_notify.png',
                      showDot: true),
                  SizedBox(width: 12.0),
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_mini_program.png',
              title: Strings.MiniPrograms,
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
          ],
        ),
      ),
    );
  }
}
