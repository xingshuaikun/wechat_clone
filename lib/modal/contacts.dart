import 'package:flutter/material.dart';

class Contact {
  const Contact({
    @required this.avatar,
    @required this.name,
    @required this.nameIndex,
  });

  // 头像
  final String avatar;
  // 名字
  final String name;
  // 名字索引
  final String nameIndex;
}

class ContactsPageData {
  final List<Contact> contacts = [
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/51.jpg',
      name: 'Allen',
      nameIndex: 'A',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/70.jpg',
      name: 'Angel',
      nameIndex: 'A',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/36.jpg',
      name: '阿里木',
      nameIndex: 'A',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
      name: 'Beverly',
      nameIndex: 'B',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/73.jpg',
      name: 'Ben',
      nameIndex: 'B',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/88.jpg',
      name: '波涛',
      nameIndex: 'B',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/46.jpg',
      name: 'Carl',
      nameIndex: 'C',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/67.jpg',
      name: 'Christal',
      nameIndex: 'C',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/67.jpg',
      name: '长乐',
      nameIndex: 'C',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/90.jpg',
      name: 'Delia',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/57.jpg',
      name: '大奔',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/21.jpg',
      name: 'Emma',
      nameIndex: 'E',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/34.jpg',
      name: '二叔',
      nameIndex: 'E',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/11.jpg',
      name: '二舅',
      nameIndex: '',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/46.jpg',
      name: 'Flora',
      nameIndex: 'F',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/82.jpg',
      name: '帆帆',
      nameIndex: 'F',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/5.jpg',
      name: '风儿',
      nameIndex: 'F',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/28.jpg',
      name: '哥',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/92.jpg',
      name: '光光',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/77.jpg',
      name: '郭少',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/20.jpg',
      name: 'Hannah',
      nameIndex: 'H',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/66.jpg',
      name: '海洋',
      nameIndex: 'H',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/92.jpg',
      name: '黄河',
      nameIndex: 'H',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      name: 'Ida',
      nameIndex: 'I',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/27.jpg',
      name: 'Iloveyou',
      nameIndex: 'I',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/37.jpg',
      name: '矮低胖',
      nameIndex: 'I',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/31.jpg',
      name: 'Jessie',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/60.jpg',
      name: '建党',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/81.jpg',
      name: '建国',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/79.jpg',
      name: 'Katherine',
      nameIndex: 'K',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/78.jpg',
      name: '矿大',
      nameIndex: 'K',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/16.jpg',
      name: '矿长',
      nameIndex: 'K',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/66.jpg',
      name: 'Lora',
      nameIndex: 'L',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/77.jpg',
      name: '老代',
      nameIndex: 'L',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
      name: '老大',
      nameIndex: 'L',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/39.jpg',
      name: '老二',
      nameIndex: 'L',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/72.jpg',
      name: 'Maria',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/62.jpg',
      name: '牡丹',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/50.jpg',
      name: '茉莉',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      name: 'Natasha',
      nameIndex: 'N',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/8.jpg',
      name: '牛牛',
      nameIndex: 'N',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/4.jpg',
      name: '宁静致远',
      nameIndex: 'N',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
      name: 'Odalys',
      nameIndex: 'O',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/74.jpg',
      name: '哦',
      nameIndex: 'O',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/2.jpg',
      name: '鸥',
      nameIndex: 'O',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
      name: 'Polly',
      nameIndex: 'P',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
      name: '鹏鹏',
      nameIndex: 'P',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/65.jpg',
      name: '拍一拍',
      nameIndex: 'P',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      name: 'Queenie',
      nameIndex: 'Q',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/72.jpg',
      name: '青山',
      nameIndex: 'Q',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/19.jpg',
      name: '钱老大',
      nameIndex: 'Q',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/82.jpg',
      name: 'Rose',
      nameIndex: 'R',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/47.jpg',
      name: '若曦',
      nameIndex: 'R',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/6.jpg',
      name: '弱鸡',
      nameIndex: 'R',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      name: 'Sofia',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/31.jpg',
      name: 'Shelly',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/12.jpg',
      name: 'Sindy',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/41.jpg',
      name: '胜利',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/70.jpg',
      name: '世界',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/33.jpg',
      name: '书呆子',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: 'Tina',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      name: 'Una',
      nameIndex: 'U',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/84.jpg',
      name: 'UFO',
      nameIndex: 'U',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/13.jpg',
      name: 'U盘',
      nameIndex: 'U',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/72.jpg',
      name: 'Victoria',
      nameIndex: 'V',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/15.jpg',
      name: '王一博',
      nameIndex: 'W',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/49.jpg',
      name: '哇哦',
      nameIndex: 'W',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      name: 'Winifred',
      nameIndex: 'W',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/93.jpg',
      name: '旺旺',
      nameIndex: 'W',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
      name: 'Xenia',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/4.jpg',
      name: '西方',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/14.jpg',
      name: '小孩',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/7.jpg',
      name: '心跟心走',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      name: '徐州',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/34.jpg',
      name: '虚竹',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: '小宝贝儿',
      nameIndex: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/18.jpg',
      name: 'Yolanda',
      nameIndex: 'Y',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/82.jpg',
      name: '阳光',
      nameIndex: 'Y',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
      name: '一公',
      nameIndex: 'Y',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: 'Zoey',
      nameIndex: 'Z',
    ),
  ];

  static ContactsPageData mock() {
    return ContactsPageData();
  }
}