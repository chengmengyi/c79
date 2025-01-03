import 'package:c79/tm_root/tm_normal_widget.dart';
import 'package:c79/tm_root/tm_root_page.dart';
import 'package:c79/tm_ui/a/page/a_play/a_play_controller.dart';
import 'package:c79/tm_ui/a/view/gold/a_gold_view.dart';
import 'package:c79/tm_ui/a/view/star/a_star_view.dart';
import 'package:c79/tm_utils/tm_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class APlay extends TmRootPage<APlayController>{
  @override
  APlayController initTmController() => APlayController();

  @override
  String tmBg() => "play_bg";

  @override
  Widget initWidget() => SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: [
        Column(
          children: [
            _topWidget(),
            _progressWidget(),
            SizedBox(height: 12.h,),
            _levelWidget(),
            SizedBox(height: 30.h,),
            _patternWidget(),
            SizedBox(height: 40.h,),
            _selectedWidget(),
            SizedBox(height: 20.h,),
          ],
        ),
        _animatorWidget(),
      ],
    ),
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 12.w,),
      AGoldView(tag: "a_play",),
      SizedBox(width: 8.w,),
      AStarView(tag: "a_play",),
      const Spacer(),
      InkWell(
        child: tmImage(imageName: "set",width: 36.w,height: 36.w),
      ),
      SizedBox(width: 12.w,),
    ],
  );

  _progressWidget()=>Container(
    width: double.infinity,
    height: 68.h,
    margin: EdgeInsets.only(left: 12.w,right: 12.w,top: 12.h),
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        tmImage(imageName: "progress_bg",width: double.infinity,height: double.infinity),
        Container(
          margin: EdgeInsets.only(left: 12.w,right: 12.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  tmImage(imageName: "progress1",width: double.infinity,height: 12.h),
                  Container(
                    margin: EdgeInsets.only(left: 2.w,right: 2.w),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.5,
                        child: tmImage(imageName: "progress2",width: double.infinity,height: 8.h),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4.h,),
              SizedBox(
                width: double.infinity,
                height: 20.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: tmImage(imageName: "star2",width: 20.w,height: 20.h),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          strokeText(data: "5", fontSize: 14.sp, colorStr: "#FFFFFF", strokeColorStr: "#9C4F2A"),
                          SizedBox(width: 2.w,),
                          tmImage(imageName: "star",width: 20.w,height: 20.h),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          strokeText(data: "10", fontSize: 14.sp, colorStr: "#FFFFFF", strokeColorStr: "#9C4F2A"),
                          SizedBox(width: 2.w,),
                          tmImage(imageName: "star",width: 20.w,height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
  
  _levelWidget()=>InkWell(
    onTap: (){
    },
    child: tmText(
        data: "Level 1",
        fontSize: 24.sp,
        colorStr: "#FFFFFF",
        shadows: [
          Shadow(
            color: toTmColor("#FF8A0E"),
            offset: const Offset(1.0, 2.0),
          ),
        ]
    ),
  );

  _patternWidget()=>GetBuilder<APlayController>(
    id: "pattern",
    builder: (_){
      List<Widget> widgetList=[];
      for(var index=0;index<tmController.patternList.length;index++){
        var value = tmController.patternList[index];
        widgetList.add(
            Container(
              margin: index==1?EdgeInsets.only(left: 28.w,top: 28.w):null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(4, (shuIndex){
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(4, (hengIndex){
                      var bean = value[shuIndex*4+hengIndex];
                      if(bean.selIcon.isEmpty||bean.show==false){
                        return Container(
                          width: 56.w,
                          height: 56.w,
                          key: bean.globalKey,
                          // color: index==0?Colors.blue.withOpacity(0.5):Colors.red.withOpacity(0.5),
                        );
                      }
                      return SizedBox(
                        key: bean.globalKey,
                        child: InkWell(
                          onTap: (){
                            tmController.clickPattern(bean);
                          },
                          child: tmImage(
                            imageName: bean.covered==true?bean.unsIcon:bean.selIcon,
                            width: 56.w,
                            height: 56.w,
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
            )
        );
      }
      return Visibility(
        visible: tmController.showPattern,
        maintainAnimation: true,
        maintainState: true,
        maintainSize: true,
        child: Stack(
          children: widgetList,
        ),
      );
    },
  );

  _selectedWidget()=>Container(
    width: 6*(52.w)+8.w,
    height: 60.w,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 4.w,right: 4.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.w),
      color: toTmColor("#532511"),
    ),
    child: GetBuilder<APlayController>(
      id: "selectedList",
      builder: (_)=>SizedBox(
        width: double.infinity,
        height: 52.w,
        key: tmController.selectedListGlobalKey,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tmController.selectedList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            var bean = tmController.selectedList[index];
            return tmImage(imageName: bean.selIcon,width: 52.w,height: 52.w);
          },
        ),
      ),
    ),
  );

  _animatorWidget() => GetBuilder<APlayController>(
    id: "animator",
    builder: (_){
      // var value = tmController.patternAnimation?.value;
      // var dx = value?.dx??0;
      // var dy = value?.dy??0;
      // return Visibility(
      //   visible: null!=tmController.patternAnimation,
      //   child: Container(
      //     margin: EdgeInsets.only(left: dx<=0?0:dx,top: dy<=0?0:dy),
      //     child: tmImage(imageName: tmController.currentSelectedPatternBean?.selIcon??"icon_sel1",width: 52.w,height: 52.w),
      //   ),
      // );
      return null==tmController.patternAnimation?
      Container():
      AnimatedBuilder(
        animation: tmController.patternAnimation!,
        builder: (context, child) {
          return Transform.translate(
            offset: tmController.patternAnimation!.value,
            child: tmImage(imageName: tmController.currentSelectedPatternBean?.selIcon??"icon_sel1",width: 52.w,height: 52.w),
          );
        },
      );
    },
  );
}