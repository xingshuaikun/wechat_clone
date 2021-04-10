import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors, AppStyles, Constants, Routes;
import '../modal/conversation.dart' show Conversation, Device, ConversationPageData;
import '../conversation/conversation_detail_args.dart';

class _ConversationItem extends StatelessWidget {
  static const VERTICAL_PADDING = 12.0;
  static const HORIZONTAL_PADDING = 18.0;
  static const UN_READ_MSG_CIRCLE_SIZE = 20.0;
  static const UN_READ_MSG_DOT_SIZE = 12.0;

  _ConversationItem({Key key, this.conversation})
    : assert(conversation != null),
    super(key: key);

  final Conversation conversation;
  var tapPos;

  _showMenu(BuildContext context, Offset tapPos) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(
      tapPos.dx, tapPos.dy,
      overlay.size.width - tapPos.dx,
      overlay.size.height - tapPos.dy
    );
    showMenu(
      context: context, 
      position: position, 
      items: <PopupMenuItem<String>>[
        PopupMenuItem(
          child: Text(Constants.MENU_MARK_AS_UNREAD_VALUE),
          value: Constants.MENU_MARK_AS_UNREAD,
        ),
        PopupMenuItem(
          child: Text(Constants.MENU_PIN_TO_TOP_VALUE),
          value: Constants.MENU_PIN_TO_TOP,
        ),
        PopupMenuItem(
          child: Text(Constants.MENU_DELETE_CONVERSATION_VALUE),
          value: Constants.MENU_DELETE_CONVERSATION,
        ),
      ]
    ).then<String>((String selected) {
      switch (selected) {
        default:
          print('点击的菜单是：$selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 根据图片的获取方式初始化头像组件
    Widget avatar;
    if(conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
        fit: BoxFit.fill,
      );
    }
    else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
        fit: BoxFit.fill,
      );
    }

    avatar = ClipRRect(
      borderRadius: BorderRadius.circular(Constants.AvatarRadius),
      child: avatar,
    );

    Widget avatarContainer;
    if(conversation.unreadMsgCount > 0) {
      // 未读消息角标
      Widget unreadMsgCountText;
      if (conversation.displayDot) {
        unreadMsgCountText = Container(
          width: UN_READ_MSG_DOT_SIZE,
          height: UN_READ_MSG_DOT_SIZE,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UN_READ_MSG_DOT_SIZE / 2.0),
            color: Color(AppColors.NotifyDotBg),
          ),
        );
      } else {
        unreadMsgCountText = Container(
          width: UN_READ_MSG_CIRCLE_SIZE,
          height: UN_READ_MSG_CIRCLE_SIZE,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UN_READ_MSG_CIRCLE_SIZE / 2.0),
            color: Color(AppColors.NotifyDotBg),
          ),
          child: Text(conversation.unreadMsgCount.toString(),
              style: AppStyles.UnreadMsgCountDotStyle),
        );
      }

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: conversation.displayDot ? -4.0 : -6.0,
            top: conversation.displayDot ? -4.0 : -6.0,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    // 勿扰模式图标
    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyles.DesStyle),
      SizedBox(height: 10.0),
    ];
    if (conversation.isMute) {
      _rightArea.add(Icon(
          IconData(
            0xe755,
            fontFamily: Constants.IconFontFamily,
          ),
          color: Color(AppColors.ConversationMuteIcon),
          size: Constants.ConversationMuteIconSize));
    } else {
      _rightArea.add(Icon(
          IconData(
            0xe755,
            fontFamily: Constants.IconFontFamily,
          ),
          color: Colors.transparent,
          size: Constants.ConversationMuteIconSize));
    }

    return Material(
      color: Color(AppColors.ConversationItemBg),
      child: InkWell(
        onTap: () {
          print('打开会话：${conversation.title}');
          Navigator.pushNamed(context, Routes.Conversation,
              arguments: ConversationDetailArgs(title: conversation.title));
        },
        onTapDown: (TapDownDetails details) {
          tapPos = details.globalPosition;
        },
        onLongPress: () {
          _showMenu(context, tapPos);
        },
        child: Container(
          padding: const EdgeInsets.only(left: HORIZONTAL_PADDING),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              avatarContainer,
              Container(width: 12.0),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(
                    right: HORIZONTAL_PADDING,
                    top: VERTICAL_PADDING,
                    bottom: VERTICAL_PADDING),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      width: Constants.DividerWidth,
                      color: Color(AppColors.DividerColor)),
                )),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(conversation.title, style: AppStyles.TitleStyle),
                          SizedBox(height: 2.0),
                          Text(conversation.des,
                              style: AppStyles.DesStyle, maxLines: 1)
                        ],
                      ),
                    ),
                    Container(width: 10.0),
                    Column(
                      children: _rightArea,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

//构造函数
class _DeviceInfoItem extends StatelessWidget {
  const _DeviceInfoItem({
    this.device: Device.WIN
  }) :
    assert(device != null);

  final Device device;

  // 获取登陆信息的图标
  int get IconName {
    return device == Device.WIN ? 0xe6b3 : 0xe61c;
  }

  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 14.0, right: 24.0, bottom: 14.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: Constants.DividerWidth,
            color: Color(AppColors.DividerColor)
          ),
          bottom: BorderSide(
            width: Constants.DividerWidth, 
            color: Color(AppColors.DividerColor)
          ),
        ),
        color: Color(AppColors.DeviceInfoItemBg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(width: 8.0),
          Icon(IconData(
            this.IconName,
            fontFamily: Constants.IconFontFamily
          ), size: 24.0, color: Color(AppColors.DeviceInfoItemIcon)),
          SizedBox(width: 24.0),
          Text('$deviceName 微信已登陆，手机通知已关闭。', style: AppStyles.DeviceInfoItemTextStyle),
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final ConversationPageData data = ConversationPageData.mock();
  // build方法用来页面渲染和组件绘制
  @override
  Widget build(BuildContext context) {
    var mockConversations = data.conversations;
    return Container(
      color: const Color(AppColors.BackgroundColor),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (data.device != null) {
            // 需要显示其他设备的登录信息
            if (index == 0) {
              return _DeviceInfoItem(device: data.device);
            }
            return _ConversationItem(
                conversation: mockConversations[index - 1]);
          } else {
            // 不需要显示其他设备的登录信息
            return _ConversationItem(conversation: mockConversations[index]);
          }
        },
        itemCount: data.device != null
            ? mockConversations.length + 1
            : mockConversations.length,
      ),
    );
  }
}