import 'package:c79/load_url/load_url_controller.dart';
import 'package:flutter/material.dart';
import 'package:tm_root/tm_root/tm_normal_widget.dart';
import 'package:tm_root/tm_root/tm_root_page.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class LoadUrlPage extends TmRootPage<LoadUrlController>{
  @override
  LoadUrlController initTmController() => LoadUrlController();

  @override
  String tmBg() => "flash_bg";

  @override
  Widget initWidget() => Column(
    children: [
      SizedBox(height: 10.h,),
      Row(
        children: [
          SizedBox(width: 16.w,),
          InkWell(
            onTap: (){
              Get.back();
            },
            child: tmImage(imageName: "close",width: 34.w,height: 34.w),
          ),
        ],
      ),
      SizedBox(height: 10.h,),
      Expanded(child: WebViewWidget(controller: tmController.controller))
    ],
  );
}