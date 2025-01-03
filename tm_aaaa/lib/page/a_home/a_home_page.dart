import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_aaaa/page/a_home/a_home_controller.dart';
import 'package:tm_aaaa/view/gold/a_gold_view.dart';
import 'package:tm_aaaa/view/star/a_star_view.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_page.dart';

class AHomePage extends TmRootPage<AHomeController>{
  @override
  AHomeController initTmController() => AHomeController();

  @override
  String tmBg() => "flash_bg";

  @override
  Widget initWidget() => Column(
    children: [
      _topWidget(),
      SizedBox(height: 50.h,),
      InkWell(
        onTap: (){
          tmController.test();
        },
        child: tmImage(imageName: "logoooo",width: 180.w,height: 180.h),
      ),
      const Spacer(),
      _btnWidget(),
      SizedBox(height: 160.h,),
    ],
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 12.w,),
      AGoldView(tag: "a_home",),
      SizedBox(width: 8.w,),
      AStarView(tag: "a_home",),
      const Spacer(),
      InkWell(
        child: tmImage(imageName: "set",width: 36.w,height: 36.w),
      ),
      SizedBox(width: 12.w,),
    ],
  );
  
  _btnWidget()=>InkWell(
    onTap: (){
      tmController.toPlay();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        tmImage(imageName: "btn",width: 264.w,height: 60.h),
        tmText(data: "PLAY NOW", fontSize: 20.sp, colorStr: "#000000"),
      ],
    ),
  );
}