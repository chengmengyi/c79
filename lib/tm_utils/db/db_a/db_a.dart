import 'package:c79/tm_utils/db/db_a/user_info_a_bean.dart';
import 'package:c79/tm_utils/db/init_db.dart';
import 'package:c79/tm_utils/event/event_data.dart';

class Dba extends InitDb{

  static final Dba _dba=Dba();
  static Dba get instance=>_dba;

  Future<UserInfoABean> readUserInfo()async{
    var db = await onCreate();
    var list = await db.query(TableName.userInfoA);
    if(list.isEmpty){
      var userInfoABean = UserInfoABean(gold: 0,level: 0,revokeNum: 0,resetNum: 0,tipsNum: 0);
      var id = await db.insert(TableName.userInfoA, userInfoABean.toJson());
      userInfoABean.id=id;
      return userInfoABean;
    }
    return UserInfoABean.fromJson(list.first);
  }

  updateUserInfo(UserInfoABean? bean,int eventCode)async{
    var db = await onCreate();
    await db.update(TableName.userInfoA, bean?.toJson()??{},where: '"id" = ?',whereArgs: [bean?.id]);
    sendEvent(eventCode: eventCode);
  }
}