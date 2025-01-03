import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/ad/show_ad_utils.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class TipsController extends TmRootController{

  clickContinue(Function() dismiss){
    if((UserInfoAUtils.instance.userInfoABean?.gold??0)<200){
      showToast("Your gold coins are less than 200");
      return;
    }
    UserInfoAUtils.instance.updateUserGold(-200);
    UserInfoAUtils.instance.updateUserTips(1);
    Get.back();
    dismiss.call();
  }

  clickWatchAd(){
    ShowAdUtils.instance.showAd(
        onClose: (){
          UserInfoAUtils.instance.updateUserTips(1);
          Get.back();
        }
    );
  }
}