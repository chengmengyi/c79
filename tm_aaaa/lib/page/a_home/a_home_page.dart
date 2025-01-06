import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm_aaaa/page/a_home/a_home_controller.dart';
import 'package:tm_aaaa/view/gold/a_gold_view.dart';
import 'package:tm_aaaa/view/star/a_star_view.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_page.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

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
      _boxLogoWidget(),
      const Spacer(),
      _btnWidget(),
      SizedBox(height: 160.h,),
    ],
  );

  _boxLogoWidget()=>SizedBox(
    width: double.infinity,
    height: 180.h,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: InkWell(
            onTap: (){
              tmController.test();
            },
            child: tmImage(imageName: "logoooo",width: 180.w,height: 180.h),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 16.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 68.w,
                  height: 68.w,
                  alignment: Alignment.center,
                  // child: CircularProgressIndicator(
                  //   value: 0.5,
                  //   color: Colors.white,
                  //   backgroundColor: toTmColor("#5B2516").withOpacity(0.4),
                  // ),
                  decoration: BoxDecoration(
                    color: toTmColor("#5B2516").withOpacity(0.4),
                    borderRadius: BorderRadius.circular(34.w),
                  ),
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: toTmColor("#5B2516"),
                      borderRadius: BorderRadius.circular(30.w),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    tmController.showStarDialog();
                  },
                  child: tmImage(imageName: "box",width: 60.w,height: 60.w,),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 12.w,),
      AGoldView(tag: "a_home",),
      SizedBox(width: 8.w,),
      AStarView(tag: "a_home",),
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