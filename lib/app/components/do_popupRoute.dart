import 'package:flutter/material.dart';

class DoPopupRoute extends PopupRoute {
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

  DoPopupRoute({
    this.coverColor,
    required this.contentView,
    required this.contentPosition,
    required this.contentWidth,
    required this.contentHeight,
    required this.offset,
  });

  @override
  Color? get barrierColor => coverColor;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return CustomSingleChildLayout(
      delegate: DropDownMenuRouteLayout(
          position: contentPosition,
          menuWidth: contentWidth,
          menuHeight: contentHeight,
          offset: offset),
      child: SizeTransition(
        sizeFactor:
            Tween<double>(begin: 0.0, end: 1.0).animate(animation), //下拉动画
        child: contentView,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

///下拉选择布局控制器
class DropDownMenuRouteLayout extends SingleChildLayoutDelegate {
  final Rect position;
  final double menuHeight;
  final double menuWidth;
  final double offset;
  DropDownMenuRouteLayout(
      {required this.position,
      required this.menuWidth,
      required this.menuHeight,
      required this.offset});

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    //控制下拉控件的宽高
    return BoxConstraints.loose(Size(menuWidth, menuHeight));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    //控制下拉控件显示位置，这里始终居于点击控件的下方
    return Offset(offset, position.bottom + 5);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
