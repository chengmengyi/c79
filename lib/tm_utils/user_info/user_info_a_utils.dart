import 'package:c79/tm_utils/db/db_a/db_a.dart';
import 'package:c79/tm_utils/db/db_a/user_info_a_bean.dart';
import 'package:c79/tm_utils/event/event_code.dart';

class UserInfoAUtils{
  static final UserInfoAUtils _infoA=UserInfoAUtils();
  static UserInfoAUtils get instance=>_infoA;
  UserInfoABean? userInfoABean;

  readUserInfo()async{
    userInfoABean = await Dba.instance.readUserInfo();
  }

  updateUserGold(int addNum){
    var gold = userInfoABean?.gold??0;
    userInfoABean?.gold=gold+addNum;
    Dba.instance.updateUserInfo(userInfoABean,EventCode.updateGoldA);
  }

  updateUserLevel(){
    var i = userInfoABean?.level??0;
    userInfoABean?.level=i+1;
    Dba.instance.updateUserInfo(userInfoABean,EventCode.updateLevelA);
  }
}
