import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff393a3f; 
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
  // 未读消息角标背景
  static const NotifyDotBg = 0xffff3e3e;
  // 未读消息角标文字颜色
  static const NotifyDotText = 0xffffffff;
  // 勿扰模式图标颜色
  static const ConversationMuteIcon = 0xffd8d8d8;
  // 设备登录背景颜色
  static const DeviceInfoItemBg = 0xfff5f5f5;
  // 设备登录字体颜色
  static const DeivceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
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
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );
  // 设备登陆信息字体
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DeivceInfoItemText),
  );
}

class Constants {
  static const IconFontFamily = 'appIconFont';
  // 头像大小
  static const ConversationAvatarSize = 48.0;
  // 分割线宽度
  static const DividerWidth = 1.0;
  // 未读消息角标大小
  static const UnReadMsgNotifyDotSize = 20.0;
  // 勿扰模式图标大小
  static const ConversationMuteIconSize = 18.0;
  // 设备登陆信息高度
  // static const DeviceInfoItemHeight = 32.0;
  // 通讯录头像大小
  static const ContactAvatarSize = 36.0;
}