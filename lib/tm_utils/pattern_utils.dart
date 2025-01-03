import 'dart:math';
import 'package:c79/bean/pattern_bean.dart';
import 'package:flutter/material.dart';

class PatternUtils{
  static final PatternUtils _utils=PatternUtils();
  static PatternUtils get instance => _utils;

  final List<List<int>> _levelList=[
    [6,6,6],
    [6,9,3,3],
    [6,9,9,6],
    [9,6,6,9],
    [9,12,6,6,3],
    [9,9,6,9,9],
    [9,12,6,9,3,9],
    [9,12,6,3,3,3],
    [9,12,3,6,9,3,3],
    [9,9,6,9,6,12,3],
    [9,15,12,9,3,6,9,3]
  ];


  List<PatternBean> getPatternList(){

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
    return patternList;
  }
}