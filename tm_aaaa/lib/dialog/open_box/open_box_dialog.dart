import 'package:flutter/material.dart';
import 'package:tm_aaaa/dialog/open_box/open_box_controller.dart';
import 'package:tm_aaaa/view/watch_video_btn_view.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_dialog.dart';
import 'package:tm_root/tm_root/tm_root_page.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class OpenBoxDialog extends TmRootDialog<OpenBoxController>{
  Function() clickContinue;
  OpenBoxDialog({required this.clickContinue});

  @override
  OpenBoxController initTmController() => OpenBoxController();

  @override
  Widget initWidget() => Container(
    margin: EdgeInsets.only(left: 36.w,right: 36.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
           tmController.clickContinue(clickContinue);
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
    height: 434.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        tmImage(imageName: "open_box_bg",width: double.infinity,height: double.infinity),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            tmText(data: "Congratulation", fontSize: 32.sp, colorStr: "#8C6504"),
            SizedBox(height: 16.h,),
            tmImage(imageName: "open_box",width: 120.w,height: 120.w),
            SizedBox(height: 16.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                tmImage(imageName: "gold",width: 28.w,height: 28.w),
                SizedBox(width: 2.w,),
                tmText(data: "+50,000", fontSize: 32.sp, colorStr: "#DB8700"),
              ],
            ),
            SizedBox(height: 16.h,),
            WatchVideoBtnView(
              text: "Claim",
              onTap: (){

              },
            ),
            SizedBox(height: 8.h,),
            InkWell(
              onTap: (){
                tmController.clickContinue(clickContinue);
              },
              child: SizedBox(
                width: 264.w,
                height: 60.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    tmImage(imageName: "btn2",width: double.infinity,height: double.infinity),
                    tmText(data: "Keep Challenging", fontSize: 20.sp, colorStr: "#000000"),
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