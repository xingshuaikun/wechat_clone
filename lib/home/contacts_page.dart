import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors, AppStyles, Constants;
import '../modal/contacts.dart' show Contact, ContactsPageData;

class _ContactItem extends StatelessWidget {
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed,
  });

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  static const double MARGIN_VERTICAL = 10.0;
  // final double BUTTON_HEIGHT = 48.0;
  static const double GROUP_TITLE_HEIGHT = 24.0;

  // 通讯录界面的图标来自网络还是本地
  bool get _isAvatarFromNet {
    if(this.avatar.startsWith('http') || this.avatar.startsWith('https')) {
      return true;
    }
    else {
      return false;
    }
  }

  static double _height(bool hasGroupTitle) {
    final _buttonHeight = MARGIN_VERTICAL * 2 + Constants.ContactAvatarSize + Constants.DividerWidth;
    if(hasGroupTitle) {
      return _buttonHeight + GROUP_TITLE_HEIGHT;
    }
    else {
      return _buttonHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 左边的图标
    Widget _avatarIcon;
    if(_isAvatarFromNet) {
      _avatarIcon = Image.network(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }
    else {
      _avatarIcon = Image.asset(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }

    // 列表项主体部分
    Widget _button = Container(
      // margin 用来设置盒子外边框
      margin: const EdgeInsets.symmetric(horizontal: 16.0,),
      padding: const EdgeInsets.symmetric(vertical: MARGIN_VERTICAL),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth, 
            color: const Color(AppColors.DividerColor)
          )
        ),
      ),
      child: Row(
        children: <Widget> [
          _avatarIcon,
          SizedBox(width: 10.0),
          Text(title),
        ],
      ),
    );

    // 分组标签
    Widget _itemBody;
    if(this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            height: GROUP_TITLE_HEIGHT,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.groupTitle, style: AppStyles.GroupTitleItemTextStyle),
          ),
          _button,
        ],
      );
    }
    else {
      _itemBody = _button;
    }

    return _itemBody;
  }
}

const INDEX_BAR_WORDS = [
  "↑", "☆", 
  "A", "B", "C", "D", "E", "F", "G", 
  "H", "I", "J", "K", "L", "M", "N", 
  "O", "P", "Q", "R", "S", "T", 
  "U", "V", "W", "X", "Y", "Z", 
  "#"
];

class ContactsPage extends StatefulWidget {
  @override
  Color _indexBarBg = Colors.transparent;
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // 用于控制列表滚动
  ScrollController _scrollController;
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      onPressed: () { print('点击添加新朋友。');},
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      onPressed: () { print('点击群聊。');},
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      onPressed: () { print('点击标签。');},
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      onPressed: () { print('点击公众号。');},
    ),
  ];
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]: 0.0};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 链式调用，将通讯录中的好友复制三份
    _contacts..addAll(data.contacts)..addAll(data.contacts)..addAll(data.contacts);
    // 将联系人列表的好友按字母序升序排序
    _contacts.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    _scrollController = new ScrollController();
    // 计算用于 IndexBar 进行定位的关键通讯录列表项的位置
    var _totalPos = _functionButtons.length * _ContactItem._height(false);
    for(int i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;
      if(i > 0 &&_contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0) {
        _hasGroupTitle = false;
      }
      if(_hasGroupTitle) {
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      _totalPos += _ContactItem._height(_hasGroupTitle);
    }
  }

  @override
  void dispose() {
    // 销毁通讯录首字母索引控制滚动列表
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();

    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            if(index < _functionButtons.length) {
              return _functionButtons[index];
            }
            int _contactIndex = index - _functionButtons.length;
            // 相同首字母的联系人排在一个首字母下
            bool _isGroupTitle = true;
            Contact _contact = _contacts[_contactIndex];
            if(_contactIndex >= 1 && _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
              _isGroupTitle = false;
            }

            return _ContactItem(
              avatar: _contact.avatar, 
              title: _contact.name, 
              groupTitle: _isGroupTitle ? _contact.nameIndex : null
            );
          },
          itemCount: _contacts.length + _functionButtons.length,
        ),
        Positioned(
          width: Constants.IndexBarWidth,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: Container(
            color: widget._indexBarBg,
            // 手势检测
            child: GestureDetector(
              // 点下去触发
              onVerticalDragDown: (DragDownDetails details) {
                setState(() {
                  widget._indexBarBg = Colors.black26;
                });
                _scrollController.animateTo(
                  _letterPosMap['Y'], 
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn, 
                );
              },
              // 点下去滑动松开触发
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  widget._indexBarBg = Colors.transparent;
                });
              },
              // 点下去松开触发
              onVerticalDragCancel: () {
                setState(() {
                  widget._indexBarBg = Colors.transparent;
                });
              },
              child: Column(
                children: _letters,
              ),
            ),
          ),
        )
      ],
    );
  }
}