import 'package:flutter/material.dart';
import 'constants.dart' show Constants, AppColors, AppStyles;

class FullWidthButton extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 16.0;
  static const HEIGHT = Constants.FullWidthIconButtonIconSize + VERTICAL_PADDING * 2;
  static const TAG_IMG_SIZE = 28.0;
  static const TAG_IMG_SIZE_BIG = 32.0;
  static const DOT_RADIUS = 5.0;

  const FullWidthButton({
    @required this.iconPath,
    @required this.title,
    this.showDivider : false,
    this.showRightArrow: true,
    @required this.onPressed,
    this.des,
    this.customWidget
  }) : assert(iconPath != null),
       assert(title != null),
       assert(onPressed != null);
  
  final String iconPath;
  final String title;
  final bool showDivider;
  final bool showRightArrow;
  final VoidCallback onPressed;
  final String des;
  final Widget customWidget;
  
  @override
  Widget build(BuildContext context) {
    final Border _border = showDivider
        ? Border(
            bottom: BorderSide(
                color: const Color(AppColors.DividerColor),
                width: Constants.DividerWidth))
        : null;
    final _rightAreaElements = <Widget>[];
    if (this.customWidget != null) {
      _rightAreaElements
        ..add(Text(title, style: AppStyles.TitleStyle))
        ..add(Expanded(
          child: customWidget,
        ));
    } else if (this.des != null) {
      _rightAreaElements
        ..add(Text(title, style: AppStyles.TitleStyle))
        ..add(Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: FullWidthButton.desText(this.des),
          ),
        ));
    } else {
      _rightAreaElements.add(Expanded(
        child: Text(title, style: AppStyles.TitleStyle),
      ));
    }
    // 右边的箭头
    if (this.showRightArrow) {
      _rightAreaElements.add(FullWidthButton.arrowRight());
    }
    // 右边距
    _rightAreaElements.add(SizedBox(width: HORIZONTAL_PADDING));

    final _button = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: Constants.FullWidthIconButtonIconSize,
          height: Constants.FullWidthIconButtonIconSize,
        ),
        SizedBox(width: HORIZONTAL_PADDING),
        Expanded(
          child: Container(
            height: HEIGHT,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(border: _border),
            child: Row(
              children: _rightAreaElements,
            ),
          ),
        ),
      ],
    );

    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(left: HORIZONTAL_PADDING),
      color: Colors.white,
      child: _button,
    );
  }

  /// 按钮上的描述性文字控件
  /// * [des] 显示在文本上的信息
  static Text desText(final des) {
    return Text(des, style: AppStyles.ButtonDesTextStyle);
  }

  /// 按钮上的圆角文本标签控件
  /// * [content] 标签上的显示文本
  static Widget tag(final content) {
    return Container(
      height: 20.0,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 6.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          color: const Color(AppColors.NewTagBg),
          borderRadius: BorderRadius.circular(10.0)),
      child: Text(content, style: AppStyles.NewTagTextStyle),
    );
  }

  /// 按钮上的图片标签，可以根据 [path] 的内容自动生成assets或者网络上的图片
  /// * [path] 图片在assets文件夹中的路径或者网络上的URL
  /// * [showDot] 是否需要显示图标右上角的原点
  /// * [isBig] 图标的大小
  static Widget iconTag(final String path,
      {bool showDot = false, bool isBig = false}) {
    bool network = false;
    if (path.startsWith('http') || path.startsWith('https')) network = true;

    final _icon = ClipRRect(
      borderRadius: BorderRadius.circular(Constants.AvatarRadius),
      child: network
          ? Image.network(
              path,
              width: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
              height: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
              fit: BoxFit.contain,
            )
          : Image.asset(
              path,
              width: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
              height: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
              fit: BoxFit.contain,
            ),
    );

    if (showDot) {
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _icon,
          Positioned(
            right: isBig ? -3.0 : -7.0,
            top: isBig ? -3.0 : -7.0,
            child: Container(
              width: DOT_RADIUS * 2,
              height: DOT_RADIUS * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DOT_RADIUS),
                color: const Color(AppColors.NotifyDotBg),
              ),
            ),
          ),
        ],
      );
    }
    return _icon;
  }

  /// 按钮右边的指示箭头
  static Widget arrowRight() {
    return Icon(
        IconData(
          0xe604,
          fontFamily: Constants.IconFontFamily,
        ),
        size: 16.0,
        color: const Color(AppColors.ButtonArrowColor));
  }
}