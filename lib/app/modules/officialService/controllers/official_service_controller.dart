import 'package:doxiaomimall/app/services/app_fontIcons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/app_colors.dart';

class OfficialServiceController extends GetxController {
  ///服务列表
  List<Map> serviceList = [
    {
      "title": "购买无忧",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.change_circle,
          "color": Colors.orange,
          "title": "一键退换"
        },
        {
          "uniId": "s1",
          "icon": DoFontIcons.xiaomi,
          "color": Colors.orange,
          "title": "小米之家"
        },
        {
          "uniId": "s2",
          "icon": Icons.location_on,
          "color": Colors.blue,
          "title": "服务网点"
        },
        {
          "uniId": "s3",
          "icon": Icons.headset_mic_rounded,
          "color": DoColors.theme,
          "title": "客服中心"
        },
        {
          "uniId": "s4",
          "icon": Icons.money_outlined,
          "color": Colors.green,
          "title": "价格保护"
        },
        {
          "uniId": "s5",
          "icon": Icons.privacy_tip_rounded,
          "color": Colors.blue,
          "title": "查真伪/保修"
        },
        {
          "uniId": "s6",
          "icon": Icons.design_services_outlined,
          "color": DoColors.theme,
          "title": "耗材服务"
        },
      ]
    },
    {
      "title": "电池服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.battery_charging_full_outlined,
          "color": Colors.green,
          "title": "手机电池"
        },
        {
          "uniId": "s1",
          "icon": Icons.laptop_mac_outlined,
          "color": Colors.purple,
          "title": "笔记本电池"
        },
        {
          "uniId": "s2",
          "icon": Icons.card_giftcard_outlined,
          "color": DoColors.theme,
          "title": "滑板车电池"
        },
        {
          "uniId": "s3",
          "icon": Icons.watch_outlined,
          "color": DoColors.theme,
          "title": "手表电池"
        },
      ],
    },
    {
      "title": "手机美容",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.flip_to_back,
          "color": Colors.red,
          "title": "后盖彩膜"
        },
        {
          "uniId": "s1",
          "icon": Icons.line_style_sharp,
          "color": DoColors.theme,
          "title": "手机贴膜"
        },
        {
          "uniId": "s2",
          "icon": Icons.fiber_new_rounded,
          "color": Colors.blue,
          "title": "后盖换新"
        },
        {
          "uniId": "s3",
          "icon": Icons.blur_linear_outlined,
          "color": Colors.purple,
          "title": "机艺重塑"
        },
      ]
    },
    {
      "title": "安装服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.coffee_maker_rounded,
          "color": Colors.blue,
          "title": "一键安装"
        },
        {
          "uniId": "s1",
          "icon": Icons.switch_access_shortcut_rounded,
          "color": Colors.green,
          "title": "开关安装"
        },
        {
          "uniId": "s2",
          "icon": Icons.tv_rounded,
          "color": Colors.blue,
          "title": "电视安装"
        },
        {
          "uniId": "s3",
          "icon": Icons.mark_chat_read_outlined,
          "color": DoColors.theme,
          "title": "浴霸安装"
        },
        {
          "uniId": "s4",
          "icon": Icons.light_rounded,
          "color": Colors.orange,
          "title": "吸顶灯安装"
        },
        {
          "uniId": "s5",
          "icon": Icons.move_down_rounded,
          "color": Colors.green,
          "title": "电视移机"
        },
      ]
    },
    {
      "title": "维修服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.fire_extinguisher_rounded,
          "color": Colors.purple,
          "title": "一键维修"
        },
        {
          "uniId": "s1",
          "icon": Icons.attach_money_rounded,
          "color": Colors.blue,
          "title": "维修价格"
        },
        {
          "uniId": "s2",
          "icon": Icons.screen_rotation,
          "color": DoColors.theme,
          "title": "屏幕换新"
        },
        {
          "uniId": "s3",
          "icon": Icons.bookmark_added_sharp,
          "color": Colors.green,
          "title": "手机主板"
        },
        {
          "uniId": "s4",
          "icon": Icons.screen_rotation_alt_outlined,
          "color": Colors.orange,
          "title": "手机外屏碎"
        },
        {
          "uniId": "s5",
          "icon": Icons.laptop_chromebook_rounded,
          "color": Colors.green,
          "title": "笔记本主板"
        },
      ]
    },
    {
      "title": "保障服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.card_membership_rounded,
          "color": Colors.blue,
          "title": "MiCare"
        },
        {
          "uniId": "s1",
          "icon": Icons.private_connectivity_rounded,
          "color": Colors.orange,
          "title": "手机保障"
        },
        {
          "uniId": "s2",
          "icon": Icons.live_tv_outlined,
          "color": Colors.blue,
          "title": "电视保障"
        },
        {
          "uniId": "s3",
          "icon": Icons.change_circle_rounded,
          "color": Colors.green,
          "title": "以旧换新"
        },
        {
          "uniId": "s4",
          "icon": Icons.icecream_rounded,
          "color": Colors.grey,
          "title": "冰箱保障"
        },
        {
          "uniId": "s5",
          "icon": Icons.wash_rounded,
          "color": Colors.green,
          "title": "洗衣机保障"
        },
        {
          "uniId": "s6",
          "icon": Icons.air_rounded,
          "color": Colors.purple,
          "title": "空调保障"
        },
      ]
    },
    {
      "title": "清洁保养",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.smoke_free_rounded,
          "color": Colors.orange,
          "title": "油烟机清洁"
        },
        {
          "uniId": "s1",
          "icon": Icons.waterfall_chart_sharp,
          "color": Colors.green,
          "title": "洗衣机清洁"
        },
        {
          "uniId": "s2",
          "icon": Icons.air_rounded,
          "color": Colors.blue,
          "title": "空调清洁"
        },
        {
          "uniId": "s3",
          "icon": Icons.checklist_rtl_rounded,
          "color": Colors.purple,
          "title": "空调检测"
        },
        {
          "uniId": "s4",
          "icon": Icons.cleaning_services_rounded,
          "color": Colors.purple,
          "title": "笔记本清洁"
        },
      ]
    },
    {
      "title": "勘测服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.fire_extinguisher_rounded,
          "color": Colors.green,
          "title": "集成灶勘测"
        },
        {
          "uniId": "s1",
          "icon": Icons.smoking_rooms_outlined,
          "color": Colors.purple,
          "title": "净烟机勘测"
        },
      ]
    },
    {
      "title": "更多服务",
      "list": [
        {
          "uniId": "s0",
          "icon": Icons.location_city_rounded,
          "color": Colors.cyan,
          "title": "企业团购"
        },
        {
          "uniId": "s1",
          "icon": Icons.tv_rounded,
          "color": Colors.purple,
          "title": "电视贴膜"
        },
        {
          "uniId": "s2",
          "icon": Icons.public_sharp,
          "color": DoColors.theme,
          "title": "小米公益"
        },
        {
          "uniId": "s3",
          "icon": Icons.class_rounded,
          "color": Colors.green,
          "title": "小米课堂"
        },
        {
          "uniId": "s4",
          "icon": Icons.gif_box_rounded,
          "color": Colors.orange,
          "title": "礼品卡"
        },
        {
          "uniId": "s5",
          "icon": Icons.wallet_giftcard_rounded,
          "color": DoColors.theme,
          "title": "礼物码"
        },
      ]
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
