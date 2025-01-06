import 'package:flutter/material.dart';
import 'package:tm_aaaa/dialog/star_box/star_box_controller.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_dialog.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class StarBoxDialog extends TmRootDialog<StarBoxController>{
  Function() clickContinue;
  StarBoxDialog({required this.clickContinue});

  @override
  StarBoxController initTmController() => StarBoxController();

  @override
  Widget initWidget() => Container(
    margin: EdgeInsets.only(left: 36.w,right: 36.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
            Get.back();
          },
          child: tmImage(imageName: "close",width: 34.w,height: 34.w),
        ),
        SizedBox(height: 10.h,),
        _contentWidget(),
      ],
    ),
  );


  _contentWidget()=>SizedBox(
    width: double.infinity,
    height: 326.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        tmImage(imageName: "star_box_bg",width: double.infinity,height: double.infinity),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            tmText(data: "Earn More Stars", fontSize: 32.sp, colorStr: "#8C6504"),
            SizedBox(height: 20.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                tmImage(imageName: "star",width: 88.w,height: 88.w),
                SizedBox(width: 12.w,),
                tmImage(imageName: "star_box",width: 32.w,height: 32.w),
                SizedBox(width: 12.w,),
                tmImage(imageName: "box",width: 88.w,height: 88.w),
              ],
            ),
            SizedBox(height: 20.h,),
            tmText(data: "Beat Levels to earn stars", fontSize: 14.sp, colorStr: "#000000",textAlign: TextAlign.center),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: (){
                Get.back();
                clickContinue.call();
              },
              child: SizedBox(
                width: 264.w,
                height: 60.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    tmImage(imageName: "btn",width: double.infinity,height: double.infinity),
                    tmText(data: "Continue", fontSize: 20.sp, colorStr: "#000000"),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}