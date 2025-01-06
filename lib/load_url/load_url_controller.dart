import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

class LoadUrlController extends TmRootController{
  late WebViewController controller;

  @override
  void onInit() {
    super.onInit();
    controller=WebViewController();
    controller.loadRequest(Uri.parse(Get.arguments["url"]));
  }
}