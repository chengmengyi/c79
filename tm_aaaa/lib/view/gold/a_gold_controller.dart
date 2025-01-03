
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/event/event_code.dart';
import 'package:tm_root/tm_utils/event/event_data.dart';

class AGoldController extends TmRootController{
  @override
  bool tmRegisterEvent() => true;

  @override
  tmReceivedEvent(EventData eventData) {
    if(eventData.eventCode==EventCode.updateGoldA){
      update(["gold"]);
    }
  }
}