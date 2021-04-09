import 'package:flutter/material.dart';
import './home/home_screen.dart';
import './home/constants.dart' show AppColors;

void main() => runApp(MaterialApp(
    title: '微信',
    theme: ThemeData.light().copyWith(
      primaryColor: Color(AppColors.AppBarColor),
      cardColor: AppColors.CardBgColor,
    ),
    home: HomeScreen(),
));