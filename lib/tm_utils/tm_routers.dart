import 'package:c79/tm_ui/a/page/a_home/a_home_page.dart';
import 'package:c79/tm_ui/a/page/a_play/a_play.dart';
import 'package:c79/tm_ui/flash/flash_page.dart';
import 'package:get/get.dart';

var tmPageList=[
  GetPage(
      name: TmPageName.flash,
      page: ()=> FlashPage(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TmPageName.AHome,
      page: ()=> AHomePage(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TmPageName.APlay,
      page: ()=> APlay(),
      transition: Transition.fadeIn
  ),
];

class TmPageName{
  static const flash="/flash";

  ///a
  static const AHome="/AHome";
  static const APlay="/APlay";
}