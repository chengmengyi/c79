import 'package:c79/tm_utils/tm_utils.dart';
import 'package:flutter/material.dart';

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
  List<Shadow>? shadows,
})=>Text(
  data,
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