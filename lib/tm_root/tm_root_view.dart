import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tm_root_controller.dart';

abstract class TmRootView<T extends TmRootController> extends StatelessWidget{
  late T tmController;
  bool _hasInit=false;

  @override
  Widget build(BuildContext context) {
    if(!_hasInit){
      _hasInit=true;
      tmController=Get.put(initTmController(),tag: tmTag());
      initTmView();
    }
    return initWidget();
  }

  String tmTag();

  T initTmController();

  initTmView(){}

  Widget initWidget();
}