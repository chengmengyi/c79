import 'package:flutter/material.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class WatchVideoBtnView extends StatelessWidget{
  String? text;
  Function() onTap;
  WatchVideoBtnView({this.text,required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: (){
      onTap.call();
    },
    child: SizedBox(
      width: 264.w,
      height: 60.h,
      child: Stack(
        children: [
          tmImage(imageName: "btn",width: double.infinity,height: double.infinity),
          Align(
            alignment: Alignment.topLeft,
            child: tmImage(imageName: "video",width: 26.w,height: 26.w),
          ),
          Align(
            alignment: Alignment.center,
            child: tmText(data: text??"Watch AD", fontSize: 20.sp, colorStr: "#000000"),
          ),
        ],
      ),
    ),
  );

}