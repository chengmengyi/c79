import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_aaaa/view/gold/a_gold_controller.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_view.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class AGoldView extends TmRootView<AGoldController>{
  String tag;
  AGoldView({required this.tag,});
  @override
  AGoldController initTmController() => AGoldController();

  @override
  String tmTag() => tag;

  @override
  Widget initWidget() => Stack(
    children: [
      Container(
        height: 36.h,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 50.w,right: 20.w),
        decoration: BoxDecoration(
          color: toTmColor("#000000").withOpacity(0.6),
          borderRadius: BorderRadius.circular(18.w),
        ),
        child: GetBuilder<AGoldController>(
          id: "gold",
          tag: tag,
          builder: (_)=>tmText(data: "${UserInfoAUtils.instance.userInfoABean?.gold??0}", fontSize: 20.sp, colorStr: "#FFFFFF"),
        ),
      ),
      tmImage(imageName: "gold",width: 36.w,height: 36.h),
    ],
  );
}