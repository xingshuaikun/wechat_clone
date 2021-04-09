import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart' show Conversation, Device, ConversationPageData;

class _ConversationItem extends StatelessWidget {
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
      );
    }
    else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    Widget avatarContainer;
    if(conversation.unreadMsgCount > 0) {
      // 未读消息角标
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(conversation.unreadMsgCount.toString(), style: AppStyles.UnreadMsgCountDotStyle),
      );

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText
          ),
        ],
      );
    }
    else {
      avatarContainer = avatar;
    }

    // 勿扰模式图标
    var _rightArea = <Widget> [
      Text(conversation.updateAt, style: AppStyles.DesStyle),
      SizedBox(height: 10.0),
    ];
    if(conversation.isMute) {
      _rightArea.add(
        Icon(IconData(
          0xe610,
          fontFamily: Constants.IconFontFamily), 
          color: Color(AppColors.ConversationMuteIcon), 
          size: Constants.ConversationMuteIconSize
        )
      );
    }
    else {
      _rightArea.add(
        Icon(IconData(
          0xe610,
          fontFamily: Constants.IconFontFamily), 
          color: Colors.transparent,
          size: Constants.ConversationMuteIconSize
        )
      );
    }

    return Material(
      color: Color(AppColors.ConversationItemBg),
      child: InkWell(
        onTap: () {
          print('打开会话：${conversation.title}');
        },
        onTapDown: (TapDownDetails details) {
          tapPos = details.globalPosition;
        },
        onLongPress: () {
          _showMenu(context, tapPos);
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          //  分割线
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(AppColors.DividerColor), 
                width: Constants.DividerWidth
              ),
            )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              avatarContainer,
              Container(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(conversation.title, style: AppStyles.TitleStyle),
                    Text(conversation.des, style: AppStyles.DesStyle),
                  ],
                ),
              ),
              Container(width: 10.0),
              Column(
                children: _rightArea,
              ),
            ],
          ),
        ),
      )
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
    return device == Device.WIN ? 0xe86f : 0xe640;
  }

  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
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
          Icon(IconData(
            this.IconName,
            fontFamily: Constants.IconFontFamily
          ), size: 24.0, color: Color(AppColors.DeviceInfoItemIcon)),
          SizedBox(width: 16.0),
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if(data.device != null) {
          // 需要显示其他设备的信息
          if(index == 0) {
            return _DeviceInfoItem(device: data.device);
          }
          return _ConversationItem(conversation: mockConversations[index - 1]);
        }
        // 不需要显示其他设备的信息
        else {
          return _ConversationItem(conversation: mockConversations[index]);
        }
      },
      itemCount: data.device != null ? mockConversations.length + 1 : mockConversations.length,
    );
  }
}