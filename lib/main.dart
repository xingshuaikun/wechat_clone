import 'package:flutter/material.dart';
import './conversation/conversation_detail_page.dart';
import './home/home_screen.dart';
import './home/constants.dart' show AppColors, Routes;

void main() => runApp(MaterialApp(
    title: '微信',
    theme: ThemeData.light().copyWith(
      primaryColor: Color(AppColors.PrimaryColor),
      cardColor: AppColors.CardBgColor,
      backgroundColor: Color(AppColors.BackgroundColor),
    ),
    initialRoute: Routes.Home,
    routes: {
      Routes.Home: (context) => HomeScreen(),
      Routes.Conversation: (context) => ConversationDetailPage()
    },
    // home: HomeScreen(),
));