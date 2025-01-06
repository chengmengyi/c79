import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class OpenBoxController extends TmRootController{


  clickContinue(Function() clickContinue){
    Get.back();
    clickContinue.call();
  }
}