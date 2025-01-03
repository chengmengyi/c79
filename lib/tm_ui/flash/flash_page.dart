import 'package:c79/tm_root/tm_normal_widget.dart';
import 'package:c79/tm_root/tm_root_page.dart';
import 'package:c79/tm_utils/tm_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'flash_controller.dart';

class FlashPage extends TmRootPage<FlashController>{
  @override
  FlashController initTmController() => FlashController();

  @override
  String tmBg() => "flash_bg";

  @override
  Widget initWidget() => SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [
        SizedBox(height: 140.h,),
        tmImage(imageName: "logoooo",width: 180.w,height: 180.h),
        const Spacer(),
        _progressWidget(),
        SizedBox(height: 120.h,),
      ],
    ),
  );

  _progressWidget()=>Container(
    width: 294.w,
    height: 16.h,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 2.w,right: 2.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.w),
      color: toTmColor("#5D291F"),
    ),
    child: GetBuilder<FlashController>(
      id: "pro",
      builder: (_)=>Container(
        width: (294.w)*tmController.controller.value,
        height: 12.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            gradient: LinearGradient(colors: [toTmColor("#FF7301"),toTmColor("#FFC802")])
        ),
      ),
    ),
  );
}