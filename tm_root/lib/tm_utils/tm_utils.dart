import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




export 'package:get/get.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

Color toTmColor(String colorStr) => Color(int.parse(colorStr.replaceAll("#", ""), radix: 16)).withAlpha(255);

showToast(String text){
  if(text.isEmpty){
    return;
  }
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16
  );
}