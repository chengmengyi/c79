import 'package:flutter/foundation.dart';
import 'package:tm_aaaa/dialog/star_box/star_box_dialog.dart';
import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/routers_name/tm_routers.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class AHomeController extends TmRootController{

  toPlay(){
    Get.toNamed(TmPageName.APlay);
  }

  showStarDialog(){
    Get.dialog(
      StarBoxDialog(
        clickContinue: (){
          toPlay();
        },
      ),
      barrierDismissible: false
    );
  }

  test(){
    if(!kDebugMode){
      return;
    }
    UserInfoAUtils.instance.updateUserGold(100);
  }
}