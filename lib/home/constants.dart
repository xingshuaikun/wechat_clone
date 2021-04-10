import 'package:flutter/material.dart';

// 颜色
class AppColors {
  static const PrimaryColor = 0xffebebeb;
  static const ActionMenuBgColor = 0xff4c4c4c;
  static const TitleColor = 0xff181818;
  static const NewTagBg = 0xfffa5251;
  // 与具体联系人的聊天输入框背景颜色
  static const ChatBoxBg = 0xfff7f7f7;
  // 与具体联系人的聊天输入框的光标颜色
  static const ChatBoxCursorColor = 0xff07c160;
  static const ButtonArrowColor = 0xffadadad;
  
  // 发现页面背景颜色
  static const BackgroundColor = 0xffededed;

  static const AppBarColor = 0xff393a3f; 
  static const TabIconActive = 0xff46c11b;
  static const TabIconNormal = 0xff999999;

  // 微信聊天界面的加号里面的5个组件的背景
  static const AppBarAddColor = 0xff4c4c4c;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const ActionIconColor = Colors.black;
  static const CardBgColor = Colors.white;
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

  // 通讯录不同首字母联系人的主题背景颜色
  static const ContactGroupTitleBg = 0xffebebeb;
  // 通讯录不同首字母联系人的字体颜色
  static const ContactGroupTitleText = 0xff888888;
  // 通讯录首字母索引值在该页显示的颜色
  static const IndexLetterBoxBg = Colors.black45;

  // 我的页面的头像背景颜色
  static const HeaderCardBg = Colors.white;
  // 我的页面的头像旁边的昵称颜色
  static const HeaderCardTitleText = 0xff353535;
  // 我的页面的头像旁边的微信号颜色
  static const HeaderCardDesText = 0xffa9a9a9;
  // 按钮提示信息颜色
  static const ButtonDesText = 0xffa9a9a9;
}

// 字体
class AppStyles {
  static const NewTagTextStyle = TextStyle(
    fontSize: Constants.DesTextSize,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
  // 与具体联系人聊天输入框中已经输入的文字的字体格式
  static const ChatBoxTextStyle = TextStyle(
    fontSize: Constants.ContentTextSize,
    color: const Color(AppColors.TitleColor)
  );

  static const TitleStyle = TextStyle(
    fontSize: Constants.TitleTextSize,
    color: const Color(AppColors.TitleColor),
  );
  static const DesStyle = TextStyle(
    fontSize: Constants.DesTextSize,
    color: Color(AppColors.DesTextColor),
  );
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );

  // 设备登陆信息字体
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: Constants.DesTextSize,
    color: Color(AppColors.DeivceInfoItemText),
  );

  // 通讯录不同首字母联系人的字母字体
  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ContactGroupTitleText),
  );
  // 通讯录首字母索引值在该页显示的字体
  static const IndexLetterBoxTextStyle = TextStyle(
    fontSize: 64.0,
    color: Colors.white,
  );

  // 我的页面的头像旁边的昵称字体
  static const HeaderCardTitleTextStyle = TextStyle(
    fontSize: 20.0,
    color: Color(AppColors.HeaderCardTitleText),
    fontWeight: FontWeight.bold,
  );
    // 我的页面的头像旁边的微信号字体
  static const HeaderCardDesTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.HeaderCardDesText),
    fontWeight: FontWeight.normal,
  );
  // 我的页面的按钮提示信息字体
  static const ButtonDesTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.ButtonDesText),
    fontWeight: FontWeight.bold,
  );
}

class Routes {
  static const Home = "/";
  static const Conversation = "/conversation";
}

// 图标
class Constants {
  static const ActionIconSize = 20.0;
  // 与具体联系人语音、表情、更多功能按钮大小
  static const ActionIconSizeLarge = 32.0;
  static const AvatarRadius = 4.0;
  static const TitleTextSize = 16.0;
  // 与具体联系人聊天输入框中已经输入的文字的大小
  static const ContentTextSize = 20.0;
  static const DesTextSize = 13.0;
  // 与具体联系人聊天输入框的高度
  static const ChatBoxHeight = 48.0;

  static const IconFontFamily = 'appIconFont';
  // 头像大小
  static const ConversationAvatarSize = 48.0;
  // 分割线宽度
  static const DividerWidth = 0.6;
  // 未读消息角标大小
  static const UnReadMsgNotifyDotSize = 20.0;
  // 勿扰模式图标大小
  static const ConversationMuteIconSize = 18.0;
  // 设备登陆信息高度
  // static const DeviceInfoItemHeight = 32.0;
  // 通讯录头像大小
  static const ContactAvatarSize = 42.0;
  // 通讯录首字母的索引值宽度
  static const IndexBarWidth = 24.0;
  // 通讯录首字母索引值在该页显示的大小
  static const IndexLetterBoxSize = 114.0;
  // 通讯录首字母索引值圆角在该页显示的大小
  static const IndexLetterBoxRadius = 4.0;
  // 发现页面按钮大小设置
  static const FullWidthIconButtonIconSize = 25.0;

  // 微信聊天界面长按联系人的效果
  static const String MENU_MARK_AS_UNREAD = 'MENU_MARK_AS_UNREAD';
  static const String MENU_MARK_AS_UNREAD_VALUE = '标为未读';
  static const String MENU_PIN_TO_TOP  = 'MENU_PIN_TO_TOP';
  static const String MENU_PIN_TO_TOP_VALUE = '置顶聊天';
  static const String MENU_DELETE_CONVERSATION  = 'MENU_DELETE_CONVERSATION';
  static const String MENU_DELETE_CONVERSATION_VALUE = '删除该聊天' ;
  static const String MENU_PIN_PA_TO_TOP  = 'MENU_PIN_PA_TO_TOP';
  static const String MENU_PIN_PA_TO_TOP_VALUE = '置顶公众号';
  static const String  MENU_UNSUBSCRIBE = 'MENU_UNSUBSCRIBE';
  static const String MENU_UNSUBSCRIBE_VALUE = '取消关注';
}