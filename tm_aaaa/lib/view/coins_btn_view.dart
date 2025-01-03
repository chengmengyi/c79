import 'package:flutter/material.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class CoinsBtnView extends StatelessWidget{
  Function() onTap;
  CoinsBtnView({required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: (){
      onTap.call();
    },
    child: SizedBox(
      width: 264.w,
      height: 60.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          tmImage(imageName: "btn2",width: double.infinity,height: double.infinity),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              tmText(data: "Continue", fontSize: 20.sp, colorStr: "#000000"),
              SizedBox(width: 2.w,),
              tmImage(imageName: "gold",width: 24.w,height: 24.w),
              SizedBox(width: 2.w,),
              tmText(data: "200", fontSize: 20.sp, colorStr: "#000000"),
            ],
          )
        ],
      ),
    ),
  );

}