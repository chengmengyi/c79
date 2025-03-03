import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:flutter/material.dart';
import 'package:tm_root/tm_utils/routers_name/tm_routers.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class FlashController extends TmRootController with GetSingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
    _initAnimationController();
  }

  _initAnimationController(){
    controller=AnimationController(duration: const Duration(seconds: 3),vsync: this);
    controller.addListener(() {
      update(["pro"]);
    });
    controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        Get.offNamed(TmPageName.AHome);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    controller.forward();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}