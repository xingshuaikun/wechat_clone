import 'package:flutter/material.dart';
import '../home/constants.dart' show AppColors, Constants;
import '../modal/contacts.dart' show Contact, ContactsPageData;

class _ContactItem extends StatelessWidget {
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
  });

  final String avatar;
  final String title;
  final String groupTitle;

  // final Contact _contact = ContactPageData.mock().contacts[0];

  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon = Image.network(
      avatar,
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,
    );
    return Container(
      // padding 调整盒子内部的边距，不影响外部
      padding: EdgeInsets.only(left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
      
      // Row()代表行布局
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
      )
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> _contacts = ContactsPageData.mock().contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Contact _contact = _contacts[index];
        return _ContactItem(avatar: _contact.avatar, title: _contact.name);
      },
      itemCount: _contacts.length,
    );
  }
}