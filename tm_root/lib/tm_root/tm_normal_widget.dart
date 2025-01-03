import 'package:flutter/material.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

Widget tmImage({
  required String imageName,
  double? width,
  double? height,
  BoxFit? boxFit,
})=>Image.asset("tm_image/$imageName.webp",width: width,height: height,fit: boxFit??BoxFit.fill,);

Widget tmText({
  required String data,
  required double fontSize,
  required String colorStr,
  TextAlign? textAlign,
  List<Shadow>? shadows,
})=>Text(
  data,
  textAlign: textAlign,
  style: TextStyle(
    color: toTmColor(colorStr),
    fontSize: fontSize,
    fontFamily: "tm",
    shadows: shadows,
  ),
);

Widget strokeText({
  required String data,
  required double fontSize,
  required String colorStr,
  required String strokeColorStr,
})=>Text(
  data,
  style: TextStyle(
    fontSize: fontSize,
    color: toTmColor(colorStr),
    fontFamily: "tm",
    shadows: [
      Shadow(
        color: toTmColor(strokeColorStr),
        offset: const Offset(1.0, 1.0),
      ),
      Shadow(
        color: toTmColor(strokeColorStr),
        offset: const Offset(-1.0, -1.0),
      ),
      Shadow(
        color: toTmColor(strokeColorStr),
        offset: const Offset(1.0, -1.0),
      ),
      Shadow(
        color: toTmColor(strokeColorStr),
        offset: const Offset(-1.0, 1.0),
      ),
    ],
  ),
);