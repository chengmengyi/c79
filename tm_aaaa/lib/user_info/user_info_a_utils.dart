
import 'package:tm_aaaa/db_a/db_a.dart';
import 'package:tm_aaaa/db_a/user_info_a_bean.dart';
import 'package:tm_root/tm_utils/event/event_code.dart';

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
    if(i>=10){
      return;
    }
    userInfoABean?.level=i+1;
    Dba.instance.updateUserInfo(userInfoABean,EventCode.updateLevelA);
  }

  updateUserRevoke(int addNum){
    var i = userInfoABean?.revokeNum??0;
    userInfoABean?.revokeNum=i+addNum;
    Dba.instance.updateUserInfo(userInfoABean,EventCode.updateRevokeA);
  }

  updateUserReset(int addNum){
    var i = userInfoABean?.resetNum??0;
    userInfoABean?.resetNum=i+addNum;
    Dba.instance.updateUserInfo(userInfoABean,EventCode.updateResetA);
  }

  updateUserTips(int addNum){
    var i = userInfoABean?.tipsNum??0;
    userInfoABean?.tipsNum=i+addNum;
    Dba.instance.updateUserInfo(userInfoABean,EventCode.updateTipsA);
  }
}
