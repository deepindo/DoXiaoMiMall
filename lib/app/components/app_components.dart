import 'package:flutter/material.dart';
import '../services/app_screenAdapter.dart';

///通用标题头组件
Widget commonHeader(
    {required String title, Widget? trailing, Function()? onTap}) {
  return SizedBox(
    height: DoScreenAdapter.h(40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        // IconButton(onPressed: onPressed, icon: Icon(icon)),
        InkWell(
          onTap: onTap,
          child: Container(
            child: trailing,
          ),
        ),
      ],
    ),
  );
}
