import 'package:flutter/material.dart';
import 'package:tm_aaaa/dialog/selected_full/selected_full_controller.dart';
import 'package:tm_aaaa/view/watch_video_btn_view.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_dialog.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class SelectedFullDialog extends TmRootDialog<SelectedFullController>{
  Function() tryAgain;
  SelectedFullDialog({required this.tryAgain});

  @override
  SelectedFullController initTmController() => SelectedFullController();

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
    height: 360.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        tmImage(imageName: "full_bg",width: double.infinity,height: double.infinity),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            tmText(data: "No More Place!", fontSize: 32.sp, colorStr: "#8C6504"),
            SizedBox(height: 20.h,),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                tmImage(imageName: "icon_revoke",width: 84.w,height: 84.h),
                Container(
                  width: 24.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: toTmColor("#C31010")
                  ),
                  child: tmText(data: "x3", fontSize: 14.sp, colorStr: "#FFFFFF"),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            WatchVideoBtnView(
              onTap: (){
                tmController.clickWatchAd();
              },
            ),
            SizedBox(height: 8.h,),
            InkWell(
              onTap: (){
                tmController.clickTryAgain(tryAgain);
              },
              child: SizedBox(
                width: 264.w,
                height: 60.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    tmImage(imageName: "btn2",width: double.infinity,height: double.infinity),
                    tmText(data: "Retry Again", fontSize: 20.sp, colorStr: "#000000"),
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