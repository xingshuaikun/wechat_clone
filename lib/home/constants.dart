import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xffededed; 
  static const TabIconActive = 0xff07c160;
  static const TabIconNormal = 0xff454545;
  // 微信聊天界面的加号里面的5个组件的背景
  static const AppBarAddColor = 0xff4c4c4c;
  static const AppBarPopupMenuColor = 0xffffffff;
  // 聊天界面的默认字体颜色
  static const TitleTextColor = 0xff191919;
  // 聊天界面背景色
  static const ConversationItemBg = 0xffffffff;
  // 聊天消息字体颜色
  static const DesTextColor = 0xffb2b2b2;
  // 分割线颜色
  static const DividerColor = 0xffe5e5e5;
}

class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.TitleTextColor),
  );
  static const DesStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.TitleTextColor),
  );
}

class Constants {
  static const IconFontFamily = 'appIconFont';
  // 头像大小
  static const ConversationAvatarSize = 48.0;
  // 分割线宽度
  static const DividerWidth = 1.0;
}