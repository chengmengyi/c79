import 'package:flutter/material.dart';
import 'package:tm_aaaa/dialog/set/set_controller.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_dialog.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class SetDialog extends TmRootDialog<SetController>{
  Function() quit;
  SetDialog({required this.quit});

  @override
  SetController initTmController() => SetController();

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
    height: 304.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        tmImage(imageName: "set_bg",width: double.infinity,height: double.infinity),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            tmText(data: "Setting", fontSize: 32.sp, colorStr: "#8C6504"),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: (){
                tmController.clickPrivacy();
              },
              child: Container(
                width: double.infinity,
                height: 52.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.w,right: 20.w),
                decoration: BoxDecoration(
                  color: toTmColor("#ECDBA8"),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: tmText(data: "Privacy Policy", fontSize: 16.sp, colorStr: "#000000"),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: (){
                tmController.clickTerm();
              },
              child: Container(
                width: double.infinity,
                height: 52.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.w,right: 20.w),
                decoration: BoxDecoration(
                  color: toTmColor("#ECDBA8"),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: tmText(data: "Terms Of User", fontSize: 16.sp, colorStr: "#000000"),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: (){
                Get.back();
                quit.call();
              },
              child: SizedBox(
                width: 204.w,
                height: 60.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    tmImage(imageName: "set1",width: double.infinity,height: double.infinity),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        tmText(data: "Quit", fontSize: 20.sp, colorStr: "#FFFFFF"),
                        SizedBox(width: 4.w,),
                        tmImage(imageName: "set2",width: 20.w,height: 20.w),
                      ],
                    ),
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