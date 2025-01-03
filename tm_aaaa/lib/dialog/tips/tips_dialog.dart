import 'package:flutter/material.dart';
import 'package:tm_aaaa/dialog/tips/tips_controller.dart';
import 'package:tm_aaaa/view/coins_btn_view.dart';
import 'package:tm_aaaa/view/watch_video_btn_view.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_dialog.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class TipsDialog extends TmRootDialog<TipsController>{
  Function() dismiss;
  TipsDialog({required this.dismiss});

  @override
  TipsController initTmController() => TipsController();

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
    height: 400.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        tmImage(imageName: "tips_bg",width: double.infinity,height: double.infinity),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            tmText(data: "No More Props", fontSize: 32.sp, colorStr: "#8C6504"),
            SizedBox(height: 20.h,),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                tmImage(imageName: "icon_tips",width: 84.w,height: 84.h),
                Container(
                  width: 24.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: toTmColor("#C31010")
                  ),
                  child: tmText(data: "x1", fontSize: 14.sp, colorStr: "#FFFFFF"),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.only(left: 20.w,right: 20.w),
              child: tmText(data: "Help you find matching items quickly", fontSize: 14.sp, colorStr: "#000000",textAlign: TextAlign.center),
            ),
            SizedBox(height: 20.h,),
            WatchVideoBtnView(
              onTap: (){
                tmController.clickWatchAd();
              },
            ),
            SizedBox(height: 8.h,),
            CoinsBtnView(
              onTap: (){
                tmController.clickContinue(dismiss);
              },
            ),
          ],
        ),
      ],
    ),
  );
}