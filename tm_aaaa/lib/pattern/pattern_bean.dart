import 'package:flutter/material.dart';

class PatternBean{
  String selIcon;
  String unsIcon;
  GlobalKey globalKey;
  Offset? offset;
  bool? covered;
  bool? show;
  int? sort;
  PatternBean({
    required this.selIcon,
    required this.unsIcon,
    required this.globalKey,
    this.offset,
    this.covered,
    this.show,
    this.sort,
});

  @override
  String toString() {
    return 'PatternBean{selIcon: $selIcon, unsIcon: $unsIcon, globalKey: $globalKey, offset: $offset, covered: $covered}';
  }
}