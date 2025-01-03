import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';

abstract class TmRootDialog<T extends TmRootController> extends StatelessWidget{
  late T tmController;
  bool _hasInit=false;

  @override
  Widget build(BuildContext context) {
    if(!_hasInit){
      _hasInit=true;
      tmController=Get.put(initTmController());
      initTmView();
    }
    return WillPopScope(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: initWidget(),
        ),
      ),
      onWillPop: ()async{
        return false;
      },
    );
  }

  T initTmController();

  initTmView(){}

  Widget initWidget();
}