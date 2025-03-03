import 'package:c79/flash/flash_page.dart';
import 'package:c79/load_url/load_url_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tm_aaaa/routers_list/routers_list.dart';
import 'package:tm_aaaa/user_info/user_info_a_utils.dart';
import 'package:tm_root/tm_utils/routers_name/tm_routers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
      )
  );
  await GetStorage.init();
  //a
  UserInfoAUtils.instance.readUserInfo();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var list = tmAPageList;
    list.addAll([
      GetPage(
          name: TmPageName.flash,
          page: ()=> FlashPage(),
          transition: Transition.fadeIn
      ),
      GetPage(
          name: TmPageName.loadUrl,
          page: ()=> LoadUrlPage(),
          transition: Transition.fadeIn
      ),
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: 'TileMatch',
        enableLog: true,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: TmPageName.flash,
        debugShowCheckedModeBanner: false,
        getPages: list,
        defaultTransition: Transition.rightToLeft,
        builder: (context,widget){
          return  MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
