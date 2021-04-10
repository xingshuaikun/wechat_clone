import 'package:flutter/material.dart';

import '../home/constants.dart' show AppColors, AppStyles, Constants;
import './conversation_detail_args.dart';

class ConversationDetailPage extends StatefulWidget {
  @override
  _ConversationDetailPageState createState() => _ConversationDetailPageState();
}

class _ConversationDetailPageState extends State<ConversationDetailPage> {
  final maxChatBoxLinesForDisplay = 4;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 与具体联系人聊天输入框左右边距
    final paddingH = 16.0;
    // 与具体联系人聊天输入框上下边距
    final paddingV = 12.0;
    // 与具体联系人聊天输入框圆角效果
    final chatBoxRadius = 4.0;
    final ConversationDetailArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title, style: AppStyles.TitleStyle),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
                IconData(
                  0xe64c,
                  fontFamily: Constants.IconFontFamily,
                ),
                size: Constants.ActionIconSize + 4.0,
                color: AppColors.ActionIconColor
            )
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: const Color(AppColors.PrimaryColor),
        actions: [
          IconButton(
              onPressed: () {
                print('打开显示更多的下拉菜单');
              },
              icon: Icon(
                  IconData(
                    0xe609,
                    fontFamily: Constants.IconFontFamily,
                  ),
                  size: Constants.ActionIconSize + 4.0,
                  color: AppColors.ActionIconColor
              )
          ),
          SizedBox(width: 16.0)
        ],
      ),
      // Column 代表列式布局
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: const Color(AppColors.BackgroundColor),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
            // decoration 用来加分界线
            decoration: BoxDecoration(
                color: const Color(AppColors.ChatBoxBg),
                border: Border(
                    top: BorderSide(
                        color: const Color(AppColors.DividerColor),
                        width: Constants.DividerWidth))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      print('语音文字切换');
                    },
                    icon: Icon(
                        IconData(
                          0xe7e2,
                          fontFamily: Constants.IconFontFamily,
                        ),
                        size: Constants.ActionIconSizeLarge,
                        color: AppColors.ActionIconColor
                    )
                ),
                // Expanded 表示撑满布局
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(chatBoxRadius)
                    ),
                    child: LayoutBuilder(
                      builder: (context, size) {
                        // 计算当前的文本需要占用的行数
                        TextSpan _text = TextSpan(
                          text: _controller.text,
                          style: AppStyles.ChatBoxTextStyle
                        );

                        TextPainter _tp = TextPainter(
                          text: _text,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                        );
                        _tp.layout(maxWidth: size.maxWidth);

                        final _lines = (_tp.size.height / _tp.preferredLineHeight).ceil();

                        return TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10.0)
                          ),
                          controller: _controller,
                          cursorColor: const Color(AppColors.ChatBoxCursorColor),
                          maxLines: _lines < maxChatBoxLinesForDisplay ? null : maxChatBoxLinesForDisplay,
                          style: AppStyles.ChatBoxTextStyle,
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print('表情包');
                    },
                    icon: Icon(
                        IconData(
                          0xe60c,
                          fontFamily: Constants.IconFontFamily,
                        ),
                        size: Constants.ActionIconSizeLarge,
                        color: AppColors.ActionIconColor
                    )
                ),
                IconButton(
                    onPressed: () {
                      print('显示更多功能');
                    },
                    icon: Icon(
                        IconData(
                          0xe616,
                          fontFamily: Constants.IconFontFamily,
                        ),
                        size: Constants.ActionIconSizeLarge,
                        color: AppColors.ActionIconColor
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
