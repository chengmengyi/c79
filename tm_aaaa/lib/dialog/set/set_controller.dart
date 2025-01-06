import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/local_data.dart';
import 'package:tm_root/tm_utils/routers_name/tm_routers.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class SetController extends TmRootController{

  clickPrivacy(){
    Get.toNamed(TmPageName.loadUrl,arguments: {"url":privacyPolicy});
  }

  clickTerm(){
    Get.toNamed(TmPageName.loadUrl,arguments: {"url":termsOfUser});
  }
}