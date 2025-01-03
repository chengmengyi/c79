class UserInfoABean {
  UserInfoABean({
      this.gold, 
      this.level, 
      this.revokeNum, 
      this.resetNum, 
      this.tipsNum,});

  UserInfoABean.fromJson(dynamic json) {
    id = json['id'];
    gold = json['gold'];
    level = json['level'];
    revokeNum = json['revokeNum'];
    resetNum = json['resetNum'];
    tipsNum = json['tipsNum'];
  }
  int? id;
  int? gold;
  int? level;
  int? revokeNum;
  int? resetNum;
  int? tipsNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gold'] = gold;
    map['level'] = level;
    map['revokeNum'] = revokeNum;
    map['resetNum'] = resetNum;
    map['tipsNum'] = tipsNum;
    return map;
  }

  @override
  String toString() {
    return 'UserInfoABean{id: $id, gold: $gold, level: $level, revokeNum: $revokeNum, resetNum: $resetNum, tipsNum: $tipsNum}';
  }
}