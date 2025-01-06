import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tm_aaaa/dialog/level_up/level_up_dialog.dart';
import 'package:tm_aaaa/dialog/reset/reset_dialog.dart';
import 'package:tm_aaaa/dialog/revoke/revoke_dialog.dart';
import 'package:tm_aaaa/dialog/selected_full/selected_full_dialog.dart';
import 'package:tm_aaaa/dialog/set/set_dialog.dart';
import 'package:tm_aaaa/dialog/tips/tips_dialog.dart';
import 'package:tm_aaaa/pattern/pattern_bean.dart';
import 'package:tm_aaaa/pattern/pattern_utils.dart';
import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/event/event_code.dart';
import 'package:tm_root/tm_utils/event/event_data.dart';

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

  clickPattern(PatternBean bean)async{
    // if(kDebugMode){
    //   var length = _hasConsecutiveDuplicates();
    //   var lastIndex = selectedList.lastIndexWhere((element) => element.selIcon==bean.selIcon);
    //   print("kk=====${length}===${lastIndex}");
    //   return;
    // }

    if(bean.selIcon.isEmpty||bean.covered==true||null==bean.offset||bean.show==false||null!=patternAnimation){
      return;
    }
    if(selectedList.length>=6){
      _showSelectedFullDialog();
      return;
    }
    var maxPattern = patternList.first.firstWhere((element) => element.selIcon.isNotEmpty);
    for (var value in patternList) {
      for (int i = 1; i < value.length; i++) {
        var patternBean = value[i];
        if(patternBean.selIcon.isNotEmpty&&patternBean.sort>maxPattern.sort){
          maxPattern=patternBean;
        }

      }
    }
    bean.sort=maxPattern.sort+1;
    var newOffset=Offset.zero;

    // var length = selectedList.where((element) => element.selIcon==bean.selIcon).length;
    var lastIndex = selectedList.lastIndexWhere((element) => element.selIcon==bean.selIcon);
    if(_hasConsecutiveDuplicates(bean)&&lastIndex!=selectedList.length-1){
      var renderBox = selectedListGlobalKey.currentContext!.findRenderObject() as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      newOffset=Offset(offset.dx+((lastIndex+1)*52.w), offset.dy);
      selectedList.insert(lastIndex+1,PatternBean(selIcon: "", unsIcon: "", globalKey: GlobalKey()));
      update(["selectedList"]);
    }else{
      var renderBox = selectedListGlobalKey.currentContext!.findRenderObject() as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      newOffset=Offset(offset.dx+(selectedList.length*52.w), offset.dy);
    }

    patternAnimation=Tween<Offset>(
      begin: bean.offset,
      end: newOffset,
    ).animate(patternController);
    currentSelectedPatternBean=bean;
    bean.show=false;
    update(["animator","pattern"]);
    patternController..reset()..forward();
  }

  _animatorEnd()async{
    if(_hasConsecutiveDuplicates(currentSelectedPatternBean!)){
      var lastIndex = selectedList.lastIndexWhere((element) => element.selIcon==currentSelectedPatternBean?.selIcon);
      if(lastIndex==selectedList.length-1){
        selectedList.add(currentSelectedPatternBean!);
      }else{
        // selectedList.insert(lastIndex+1, currentSelectedPatternBean!);
        selectedList[lastIndex+1]=currentSelectedPatternBean!;
      }
    }else{
      selectedList.add(currentSelectedPatternBean!);
    }
    update(["selectedList"]);
    await Future.delayed(const Duration(milliseconds: 100));

    _removePattern(
      result: ()async{
        patternAnimation=null;
        update(["selectedList","animator"]);
        if(selectedList.length>=6){
          _showSelectedFullDialog();
          return;
        }
        if(_checkAllRemove()){
          UserInfoAUtils.instance.updateUserLevel();
          Get.dialog(
            LevelUpDialog(
              dismiss: (){
                initData();
              },
            ),
            barrierDismissible: false,
          );
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

  _showSelectedFullDialog(){
    Get.dialog(
      SelectedFullDialog(
        tryAgain: (){
          initData();
        },
      ),
      barrierDismissible: false,
    );
  }

  initData(){
    _updateShowPattern(false);
    var list = PatternUtils.instance.getPatternList();
    patternList.clear();
    patternList.addAll(list);
    selectedList.clear();
    update(["pattern","selectedList"]);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      readOffset();
    });
  }

  readOffset(){
    var rowNum = PatternUtils.instance.getPatternInfoByLevel().rowNum;
    for (var value in patternList) {
      for (var value1 in value) {
        var renderBox = value1.globalKey.currentContext!.findRenderObject() as RenderBox;
        var offset = renderBox.localToGlobal(Offset.zero);
        value1.offset=offset;
      }
    }
    for(var largeIndex=0;largeIndex<patternList.length-1;largeIndex++){
      var downList = patternList[largeIndex];
      var topList = patternList[largeIndex+1];
      for(var index=0;index<downList.length;index++){
        var downBean = downList[index];
        final downOffset = downBean.offset??Offset.zero;
        var bottomRightCovered = _checkBottomRightCovered(index,downOffset,topList);
        var bottomLeftCovered = _checkBottomLeftCovered(index, downOffset,topList);
        var topRightCovered = _checkTopRightCovered(index, downOffset,rowNum,topList);
        var topLeftCovered = _checkTopLeftCovered(index, downOffset,rowNum,topList);
        downBean.covered=bottomRightCovered||bottomLeftCovered||topRightCovered||topLeftCovered;
      }
    }

    if(patternList.length>=3){
      var downList = patternList[0];
      var topList = patternList[2];
      for(var index=0;index<downList.length;index++){
        var downBean = downList[index];
        final downOffset = downBean.offset??Offset.zero;
        var bottomRightCovered = _checkBottomRightCovered(index,downOffset,topList);
        var bottomLeftCovered = _checkBottomLeftCovered(index, downOffset,topList);
        var topRightCovered = _checkTopRightCovered(index, downOffset,rowNum,topList);
        var topLeftCovered = _checkTopLeftCovered(index, downOffset,rowNum,topList);
        downBean.covered=bottomRightCovered||bottomLeftCovered||topRightCovered||topLeftCovered;
      }
    }


    // for(var index=0;index<patternList.first.length;index++){
    //   var downBean = patternList.first[index];
    //   final downOffset = downBean.offset??Offset.zero;
    //   var bottomRightCovered = _checkBottomRightCovered(index,downOffset);
    //   var bottomLeftCovered = _checkBottomLeftCovered(index, downOffset);
    //   var topRightCovered = _checkTopRightCovered(index, downOffset,rowNum);
    //   var topLeftCovered = _checkTopLeftCovered(index, downOffset,rowNum);
    //   downBean.covered=bottomRightCovered||bottomLeftCovered||topRightCovered||topLeftCovered;
    // }
    _updateShowPattern(true);
  }

  bool _hasConsecutiveDuplicates(PatternBean bean) {
    for (int i = 0; i < selectedList.length - 1; i++) {
      if (selectedList[i].selIcon == selectedList[i + 1].selIcon) {
        return selectedList[i].selIcon==bean.selIcon;
      }
    }
    return false;
  }

  bool _checkBottomRightCovered(int index,Offset downOffset,List<PatternBean> topList){
    var topBean = topList[index];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  bool _checkBottomLeftCovered(int index,Offset downOffset,List<PatternBean> topList){
    if(index<=0){
      return false;
    }
    var topBean = topList[index-1];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  bool _checkTopRightCovered(int index,Offset downOffset,int rowNum,List<PatternBean> topList){
    if(index<rowNum){
      return false;
    }
    var topBean = topList[index-rowNum];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  bool _checkTopLeftCovered(int index,Offset downOffset,int rowNum,List<PatternBean> topList){
    if(index<(rowNum+1)){
      return false;
    }
    var topBean = topList[index-(rowNum+1)];
    final topOffset = topBean.offset??Offset.zero;
    var covered = _checkCovered(downOffset,topOffset);
    if(covered&&(topBean.selIcon.isEmpty||topBean.show==false)){
      covered=false;
    }
    return covered;
  }

  _checkCovered(Offset downOffset,Offset topOffset){
    var widgetWidth=52.w;
    bool horizontalOverlap = downOffset.dx < (topOffset.dx + widgetWidth) && topOffset.dx < (downOffset.dx + widgetWidth);
    bool verticalOverlap = downOffset.dy < (topOffset.dy + widgetWidth) && topOffset.dy < (downOffset.dy + widgetWidth);
    return horizontalOverlap && verticalOverlap;
  }

  _updateShowPattern(show){
    showPattern=show;
    update(["pattern"]);
  }

  clickFunc(String icon){
    switch(icon){
      case "icon_revoke":
        _revokePattern();
        break;
      case "icon_reset":
        _resetPattern();
        break;
      case "icon_tips":
        _tipsPattern();
        break;
    }
  }

  _revokePattern(){
    if(selectedList.isEmpty||null!=patternAnimation){
      return;
    }
    if((UserInfoAUtils.instance.userInfoABean?.revokeNum??0)<=0){
      Get.dialog(
        RevokeDialog(
          dismiss: (){
            // _revokePattern();
          },
        ),
        barrierDismissible: false,
      );
      return;
    }
    for (var value in patternList) {
      var indexWhere = value.indexWhere((element) => element.sort==selectedList.last.sort);
      if(indexWhere>=0){
        value[indexWhere].show=null;
        selectedList.removeLast();
        update(["pattern","selectedList"]);
        UserInfoAUtils.instance.updateUserRevoke(-1);
        readOffset();
        break;
      }
    }
  }

  _resetPattern(){
    if(null!=patternAnimation){
      return;
    }
    if((UserInfoAUtils.instance.userInfoABean?.resetNum??0)<=0){
      Get.dialog(
        ResetDialog(
          dismiss: (){
            // _resetPattern();
          },
        ),
        barrierDismissible: false,
      );
      return;
    }
    UserInfoAUtils.instance.updateUserReset(-1);
    for (var value in patternList) {
      value.shuffle();
    }
    _updateShowPattern(false);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      readOffset();
    });
  }

  _tipsPattern(){
    if(selectedList.isEmpty||null!=patternAnimation){
      return;
    }
    if((UserInfoAUtils.instance.userInfoABean?.tipsNum??0)<=0){
      Get.dialog(
        TipsDialog(
          dismiss: (){
            // _tipsPattern();
          },
        ),
        barrierDismissible: false,
      );
      return;
    }
    var lastSelIcon = selectedList.last.selIcon;
    var list = selectedList.where((element) => element.selIcon==currentSelectedPatternBean?.selIcon).toList();
    if(list.length==2){
      lastSelIcon=list.last.selIcon;
    }
    for (var value in patternList) {
      var indexWhere = value.indexWhere((element) => element.covered!=true&&element.show!=false&&element.selIcon==lastSelIcon);
      if(indexWhere>=0){
        UserInfoAUtils.instance.updateUserTips(-1);
        clickPattern(value[indexWhere]);
        break;
      }
    }
  }

  double getLevelProgress(){
    var d = (UserInfoAUtils.instance.userInfoABean?.level??0)/10;
    if(d>=1){
      return 1.0;
    }else if(d<=0){
      return 0;
    }else{
      return d;
    }
  }

  showSetDialog(){
    Get.dialog(
      SetDialog(
        quit: (){
          Get.back();
        },
      ),
      barrierDismissible: false
    );
  }

  @override
  bool tmRegisterEvent() => true;

  @override
  tmReceivedEvent(EventData eventData) {
    switch(eventData.eventCode){
      case EventCode.updateRevokeA:
      case EventCode.updateResetA:
      case EventCode.updateTipsA:
        update(["func"]);
        break;
      case EventCode.updateLevelA:
        update(["progress","level"]);
        break;
    }
  }

  @override
  void onClose() {
    patternController.dispose();
    super.onClose();
  }
}