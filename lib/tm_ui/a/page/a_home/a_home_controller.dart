import 'package:c79/tm_root/tm_root_controller.dart';
import 'package:c79/tm_utils/tm_routers.dart';
import 'package:c79/tm_utils/user_info/user_info_a_utils.dart';
import 'package:get/get.dart';

class AHomeController extends TmRootController{

  toPlay(){
    Get.toNamed(TmPageName.APlay);
  }

  test(){
    UserInfoAUtils.instance.updateUserGold(100);
  }
}