import 'package:get/get.dart';
import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/routers_name/tm_routers.dart';

class AHomeController extends TmRootController{

  toPlay(){
    Get.toNamed(TmPageName.APlay);
  }

  test(){
    UserInfoAUtils.instance.updateUserGold(100);
  }
}