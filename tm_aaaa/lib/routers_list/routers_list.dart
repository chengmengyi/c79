import 'package:tm_aaaa/page/a_home/a_home_page.dart';
import 'package:tm_aaaa/page/a_play/a_play.dart';
import 'package:tm_root/tm_utils/routers_name/tm_routers.dart';
import 'package:tm_root/tm_utils/tm_utils.dart';

var tmAPageList=[
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