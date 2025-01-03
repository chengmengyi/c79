
import 'package:tm_root/tm_root/tm_root_controller.dart';
import 'package:tm_root/tm_utils/event/event_code.dart';
import 'package:tm_root/tm_utils/event/event_data.dart';

class AStarController extends TmRootController{
  @override
  bool tmRegisterEvent() => true;

  @override
  tmReceivedEvent(EventData eventData) {
    if(eventData.eventCode==EventCode.updateLevelA){
      update(["level"]);
    }
  }
}