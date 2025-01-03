import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tm_aaaa/pattern/pattern_bean.dart';
import 'package:tm_aaaa/pattern/pattern_info_bean.dart';
import 'package:tm_aaaa/user_info/user_info_a_utils.dart';

class PatternUtils{
  static final PatternUtils _utils=PatternUtils();
  static PatternUtils get instance => _utils;

  final List<PatternInfoBean> _patternInfoList=[
    PatternInfoBean(rowNum: 4, floor: 2, typeNumList: [6,6,6],),
    PatternInfoBean(rowNum: 4, floor: 2, typeNumList: [6,9,3,3],),
    PatternInfoBean(rowNum: 4, floor: 2, typeNumList: [6,9,9,6],),

    PatternInfoBean(rowNum: 6, floor: 2, typeNumList: [9,6,6,9],),
    PatternInfoBean(rowNum: 6, floor: 2, typeNumList: [9,12,6,6,3],),
    PatternInfoBean(rowNum: 6, floor: 2, typeNumList: [9,9,6,9,9],),
    PatternInfoBean(rowNum: 6, floor: 2, typeNumList: [9,12,6,9,3,9],),

    PatternInfoBean(rowNum: 6, floor: 3, typeNumList: [9,12,6,3,3,3],),
    PatternInfoBean(rowNum: 6, floor: 3, typeNumList: [9,12,3,6,9,3,3],),
    PatternInfoBean(rowNum: 6, floor: 3, typeNumList: [9,9,6,9,6,12,3],),
    PatternInfoBean(rowNum: 6, floor: 3, typeNumList: [9,15,12,9,3,6,9,3],),
  ];


  List<List<PatternBean>> getPatternList(){
    var patternInfoBean = getPatternInfoByLevel();
    var patternTypeNumList = patternInfoBean.typeNumList;
    var random = Random();
    List<int> patternTypeList=[];
    while(patternTypeList.length<patternTypeNumList.length){
      var i = random.nextInt(10)+1;
      if(!patternTypeList.contains(i)){
        patternTypeList.add(i);
      }
    }
    List<PatternBean> patternList=[];
    for (var index=0;index<patternTypeNumList.length;index++) {
      List<PatternBean> list=[];
      while(list.length<patternTypeNumList[index]){
        list.add(PatternBean(selIcon: "icon_sel${patternTypeList[index]}", unsIcon: "icon_uns${patternTypeList[index]}",globalKey: GlobalKey()));
      }
      patternList.addAll(list);
    }
    patternList.shuffle();

    int partLength = (patternList.length / patternInfoBean.floor).floor();
    int remainder = patternList.length % patternInfoBean.floor;
    List<List<PatternBean>> result = [];
    int startIndex = 0;
    for (int i = 0; i < patternInfoBean.floor; i++) {
      int currentLength = partLength + (remainder > 0? 1 : 0);
      remainder--;
      result.add(patternList.sublist(startIndex, startIndex + currentLength));
      startIndex += currentLength;
    }

    var maxNum = patternInfoBean.rowNum*patternInfoBean.rowNum;
    for (var value in result) {
      while(value.length<maxNum){
        value.add(PatternBean(selIcon: "", unsIcon: "",globalKey: GlobalKey()));
      }
    }

    for (var value in result) {
      value.shuffle();
    }

    return result;
  }

  // int getPatterMaxNum(){
  //   var infoBean = _getPatternInfoByLevel();
  //   return infoBean.rowNum*infoBean.rowNum;
  // }

  PatternInfoBean getPatternInfoByLevel(){
    var level = UserInfoAUtils.instance.userInfoABean?.level??0;
    return level>=_patternInfoList.length?_patternInfoList.last:_patternInfoList[level];
    // return _patternInfoList.last;
  }
}