import 'package:flutter/material.dart';
import 'package:flutter_application_wechat_clone/home/conversation_page.dart';
import '../home/constants.dart' show AppColors;

// 此处是模拟登陆信息的图标，实际开发需要从后端传过来具体数据
enum Device {
  MAC, WIN
}

class Conversation {
  const Conversation({
    // @required表示不能省略
    @required this.avatar,
    @required this.title,
    this.titleColor: AppColors.TitleTextColor,
    this.des,
    @required this.updateAt,
    this.isMute: false,
    this.unreadMsgCount : 0,
    this.displayDot : false,
  }) : assert(avatar != null),
       assert(title != null),
       assert(updateAt != null);

  // 头像
  final String avatar;
  final String title;
  // 标题颜色
  final int titleColor;
  // 会话描述
  final String des;
  // 最新消息时间
  final String updateAt;
  // 是否开启免打扰模式
  final bool isMute;
  // 未读消息数量
  final int unreadMsgCount;
  // 未读消息显示数字还是圆点
  final bool displayDot;
  // 图片来源于网络还是服务器
  bool isAvatarFromNet() {
    if(this.avatar.indexOf('http') == 0 || 
       this.avatar.indexOf('https') == 0) {
         return true;
    }
    return false;
  }
}

class ConversationPageData {
  // 构造函数
  const ConversationPageData({
    this.device,
    this.conversations,
  });

  final Device device;
  final List<Conversation> conversations;

  static mock() {
    return ConversationPageData(device: Device.WIN, conversations: mockConversations);
  }
  static List<Conversation> mockConversations = [
    const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      des: '',
      updateAt: '21:56',
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      des: '豪车与出租车刮擦 两车主划拳定责',
      updateAt: '20:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      des: '25元现金助力开学季',
      updateAt: '19:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/42.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:58',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/40.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '14:56',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '11:37',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '10:05',
      isMute: false,
      unreadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
      title: 'Jeff',
      des: '你准备去哪吃早饭？',
      updateAt: '7:23',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/80.jpg',
      title: 'Ali',
      des: '你周末有时间吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
      title: 'Jeff',
      des: '今晚要去打球吗？',
      updateAt: '4月3日',
      isMute: true,
      unreadMsgCount: 0,
    ),
  ];
}