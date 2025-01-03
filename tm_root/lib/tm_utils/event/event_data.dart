import 'package:event_bus/event_bus.dart';

final EventBus eventBus=EventBus();

class EventData{
  int eventCode;
  EventData({
    required this.eventCode,
  });
}

sendEvent({
  required int eventCode,
}){
  var eventData = EventData(eventCode: eventCode);
  eventBus.fire(eventData);
}