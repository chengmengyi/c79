import 'dart:async';
import 'package:get/get.dart';
import 'package:tm_root/tm_utils/event/event_data.dart';

abstract class TmRootController extends GetxController{
  StreamSubscription<EventData>? _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    List<int> numbers = [1, 2, 3, 2, 4, 2, 2];
    int elementToCount = 2;
    int count = numbers.where((number) => number == elementToCount).length;

    List<int> a = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    a.removeWhere((number) => number.isEven);
    if(tmRegisterEvent()){
      _streamSubscription=eventBus.on<EventData>().listen((event) {
        tmReceivedEvent(event);
      });
    }
    _getaaaa();
  }

  bool tmRegisterEvent()=>false;

  _getaaaa(){
    List<int> numbers = [1, 2, 3, 4, 5];
    int firstEven = numbers.firstWhere((number) => number % 2 == 0);
  }

  tmReceivedEvent(EventData eventData){

  }

  @override
  void onClose() {
    super.onClose();
    if(tmRegisterEvent()){
      _streamSubscription?.cancel();
      _streamSubscription=null;
    }
  }
}