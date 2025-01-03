import 'package:c79/tm_root/tm_normal_widget.dart';
import 'package:c79/tm_root/tm_root_view.dart';
import 'package:c79/tm_ui/a/view/star/a_star_controller.dart';
import 'package:c79/tm_utils/tm_utils.dart';
import 'package:c79/tm_utils/user_info/user_info_a_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AStarView extends TmRootView<AStarController>{
  String tag;
  AStarView({required this.tag,});
  @override
  AStarController initTmController() => AStarController();

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
        child: GetBuilder<AStarController>(
          id: "level",
          tag: tag,
          builder: (_)=>tmText(data: "${(UserInfoAUtils.instance.userInfoABean?.level??0)+1}", fontSize: 20.sp, colorStr: "#FFFFFF"),
        ),
      ),
      tmImage(imageName: "star",width: 36.w,height: 36.h),
    ],
  );
}