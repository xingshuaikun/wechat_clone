import 'package:flutter/material.dart';

class Profile {
  const Profile({
    @required this.name,
    @required this.avatar,
    @required this.account,
  });

  final String name;
  final String avatar;
  final String account;

}

const Profile me = Profile(
  name: 'ikun',
  avatar: 'https://randomuser.me/api/portraits/men/62.jpg',
  account: 'xing_shuaikun',
);