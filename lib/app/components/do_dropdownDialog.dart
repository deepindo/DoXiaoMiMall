import 'package:flutter/material.dart';

class DoDropDownDialog extends StatelessWidget {
  Color? barrierColor;
  //遮罩颜色
  Color? coverColor;
  //内容组件
  Widget contentView;
  //点击控件的相对位置信息
  final Rect contentPosition;
  //下拉控件高度
  final double contentHeight;
  //下拉控件宽度
  final double contentWidth;
  //偏移
  final double offset;

  DoDropDownDialog(
      {super.key,
      required this.contentView,
      required this.contentPosition,
      required this.contentHeight,
      required this.contentWidth,
      required this.offset});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void dismiss() {}
}
// class DoDropDownDialog  {
  

// }