import 'package:flutter/material.dart';




export 'package:get/get.dart';

Color toTmColor(String colorStr) => Color(int.parse(colorStr.replaceAll("#", ""), radix: 16)).withAlpha(255);