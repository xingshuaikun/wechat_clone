import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors,AppStyles, Constants;
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

  // 通讯录界面的图标来自网络还是本地
  bool get _isAvatarFromNet {
    if(this.avatar.startsWith('http') || this.avatar.startsWith('https')) {
      return true;
    }
    else {
      return false;
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

    // 列表项主题部分
    Widget _button = Container(
      // margin 用来设置盒子外边框
      margin: const EdgeInsets.symmetric(horizontal: 16.0,),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
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

const INDEX_BAR_WORDS = {
  "↑", "☆", 
  "A", "B", "C", "D", "E", "F", "G", 
  "H", "I", "J", "K", "L", "M", "N", 
  "O", "P", "Q", "R", "S", "T", 
  "U", "V", "W", "X", "Y", "Z", 
  "#"
};

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 链式调用，将通讯录中的好友复制三份
    _contacts..addAll(data.contacts)..addAll(data.contacts)..addAll(data.contacts);
    // 将联系人列表的好友按字母序升序排序
    _contacts.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
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
          child: Column(
            children: _letters,
          ),
        )
      ],
    );
  }
}