import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/ad/show_ad_utils.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class SelectedFullController extends TmRootController{

  clickTryAgain(Function() dismiss){
    Get.back();
    dismiss.call();
  }

  clickWatchAd(){
    ShowAdUtils.instance.showAd(
      onClose: (){
        UserInfoAUtils.instance.updateUserRevoke(3);
        Get.back();
      }
    );
  }
}