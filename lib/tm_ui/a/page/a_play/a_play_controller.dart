import 'package:c79/bean/pattern_bean.dart';
import 'package:c79/tm_root/tm_root_controller.dart';
import 'package:c79/tm_utils/pattern_utils.dart';
import 'package:c79/tm_utils/user_info/user_info_a_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class APlayController extends TmRootController with GetTickerProviderStateMixin{
  var showPattern=false;
  List<List<PatternBean>> patternList=[];
  late AnimationController patternController;
  Animation<Offset>? patternAnimation;
  List<PatternBean> selectedList=[];
  PatternBean? currentSelectedPatternBean;
  GlobalKey selectedListGlobalKey=GlobalKey();

  @override
  void onInit() {
    super.onInit();
    patternController=AnimationController(vsync: this,duration: const Duration(milliseconds: 260),)
      ..addListener(() {
        update(["animator"]);
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          _animatorEnd();
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  clickPattern(PatternBean bean){
    if(bean.selIcon.isEmpty||bean.covered==true||null==bean.offset||bean.show==false||null!=patternAnimation){
      return;
    }
    var renderBox = selectedListGlobalKey.currentContext!.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var newOffset=Offset(offset.dx+(selectedList.length*52.w), offset.dy-52.w);
    patternAnimation=Tween<Offset>(
      begin: bean.offset,
      end: newOffset,
    ).animate(patternController);
    currentSelectedPatternBean=bean;
    bean.show=false;
    update(["animator","pattern"]);
    patternController..reset()..forward();
  }

  _animatorEnd(){
    var length = selectedList.where((element) => element.selIcon==currentSelectedPatternBean?.selIcon).length;
    if(length==2){
      var lastIndex = selectedList.lastIndexWhere((element) => element.selIcon==currentSelectedPatternBean?.selIcon);
      if(lastIndex==selectedList.length-1){
        selectedList.add(currentSelectedPatternBean!);
      }else{
        selectedList.insert(lastIndex+1, currentSelectedPatternBean!);
      }
    }else{
      selectedList.add(currentSelectedPatternBean!);
    }
    _removePattern(
      result: (){
        patternAnimation=null;
        update(["selectedList","animator"]);
        if(_checkAllRemove()){
          UserInfoAUtils.instance.updateUserLevel();

        }else{
          readOffset();
        }
      },
    );
  }

  _removePattern({required Function() result}){
    if (selectedList.length < 3) {
      result.call();
      return;
    }
    var hasThreeSameData=false;
    for (int i = 0; i < selectedList.length - 2; i++) {
      if (selectedList[i].selIcon == selectedList[i + 1].selIcon && selectedList[i].selIcon == selectedList[i + 2].selIcon) {
        hasThreeSameData=true;
        break;
      }
    }
    if(hasThreeSameData){
      UserInfoAUtils.instance.updateUserGold(500);
      int i = 0;
      while (i < selectedList.length - 2) {
        if (selectedList[i].selIcon == selectedList[i + 1].selIcon && selectedList[i].selIcon == selectedList[i + 2].selIcon) {
          selectedList.removeRange(i, i + 3);
          i = i > 0? i - 1 : 0;
        } else {
          i++;
        }
      }
      _removePattern(result: result);
    }else{
      result.call();
    }
  }

  bool _checkAllRemove(){
    for (var value in patternList) {
      var indexWhere = value.indexWhere((element) => element.selIcon.isNotEmpty&&element.show!=false);
      if(indexWhere>=0){
        return false;
      }
    }
    return true;
  }

  initData(){
    _updateShowPattern(false);
    var list = PatternUtils.instance.getPatternList();
    patternList.clear();
    var downList = list.sublist(0,9);
    while(downList.length<16){
      downList.add(PatternBean(selIcon: "", unsIcon: "",globalKey: GlobalKey()));
    }
    downList.shuffle();
    patternList.add(downList);
    var topList = list.sublist(9,list.length);
    while(topList.length<16){
      topList.add(PatternBean(selIcon: "", unsIcon: "",globalKey: GlobalKey()));
    }
    topList.shuffle();
    patternList.add(topList);
    update(["pattern"]);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      readOffset();
    });
  }

  readOffset(){
    for (var value in patternList) {
      for (var value1 in value) {
        var renderBox = value1.globalKey.currentContext!.findRenderObject() as RenderBox;
        var offset = renderBox.localToGlobal(Offset.zero);
        value1.offset=offset;
      }
    }
    for(var index=0;index<patternList.first.length;index++){
      var downBean = patternList.first[index];
      final downOffset = downBean.offset??Offset.zero;
      var bottomRightCovered = _checkBottomRightCovered(index,downOffset);
      var bottomLeftCovered = _checkBottomLeftCovered(index, downOffset);
      var topRightCovered = _checkTopRightCovered(index, downOffset);
      var topLeftCovered = _checkTopLeftCovered(index, downOffset);
      downBean.covered=bottomRightCovered||bottomLeftCovered||topRightCovered||topLeftCovered;
    }
    _updateShowPattern(true);
  }

  bool _checkBottomRightCovered(int index,Offset downOffset){
    var topBean = patternList.last[index];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  bool _checkBottomLeftCovered(int index,Offset downOffset){
    if(index<=0){
      return false;
    }
    var topBean = patternList.last[index-1];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  bool _checkTopRightCovered(int index,Offset downOffset){
    if(index<4){
      return false;
    }
    var topBean = patternList.last[index-4];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  bool _checkTopLeftCovered(int index,Offset downOffset){
    if(index<5){
      return false;
    }
    var topBean = patternList.last[index-5];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  _checkCovered(Offset downOffset,Offset topOffset){
    var widgetWidth=56.w;
    bool horizontalOverlap = downOffset.dx < (topOffset.dx + widgetWidth) && topOffset.dx < (downOffset.dx + widgetWidth);
    bool verticalOverlap = downOffset.dy < (topOffset.dy + widgetWidth) && topOffset.dy < (downOffset.dy + widgetWidth);
    return horizontalOverlap && verticalOverlap;
  }

  _updateShowPattern(show){
    showPattern=show;
    update(["pattern"]);
  }

  @override
  void onClose() {
    patternController.dispose();
    super.onClose();
  }
}