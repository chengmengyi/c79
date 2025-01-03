import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';

abstract class TmRootPage<T extends TmRootController> extends StatelessWidget{
  late T tmController;
  bool _hasInit=false;

  @override
  Widget build(BuildContext context) {
    if(!_hasInit){
      _hasInit=true;
      tmController=Get.put(initTmController());
      initTmView();
    }
    return Scaffold(
      body: Stack(
        children: [
          tmImage(imageName: tmBg(),width: double.infinity,height: double.infinity),
          SafeArea(
            child: initWidget(),
          )
        ],
      ),
    );
  }

  T initTmController();

  initTmView(){}

  String tmBg();

  Widget initWidget();
}