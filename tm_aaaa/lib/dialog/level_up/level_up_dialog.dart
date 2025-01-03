import 'package:flutter/material.dart';
import 'package:tm_aaaa/dialog/level_up/level_up_controller.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_dialog.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class LevelUpDialog extends TmRootDialog<LevelUpController>{
  Function() dismiss;
  LevelUpDialog({required this.dismiss});

  @override
  LevelUpController initTmController() => LevelUpController();

  @override
  Widget initWidget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      tmText(data: "Well Done!", fontSize: 44.sp, colorStr: "#FFD95D"),
      SizedBox(height: 100.h,),
      tmImage(imageName: "star",width: 100.w,height: 100.h),
      SizedBox(height: 100.h,),
      InkWell(
        onTap: (){
          Get.back();
          dismiss.call();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            tmImage(imageName: "btn2",width: 264.w,height: 60.h),
            tmText(data: "Collect and Continue", fontSize: 20.sp, colorStr: "#000000")
          ],
        ),
      )
    ],
  );

}