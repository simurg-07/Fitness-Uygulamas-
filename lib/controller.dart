import 'package:get/get.dart';
import 'package:kilo_takibi_getx/models/record.dart';
import 'add_record.dart';
import 'models/record.dart';
final Controller _controller = Get.find();

class Controller extends GetxController {

final weight = 70.obs;
final dateTime = DateTime.now().obs;
//DateTime selectedDate;


//Controller ({this.weight = 60,required this.selectedDate});


  var records = <Record>[
    /*Record(dateTime: DateTime.now(), weight: 60, note: "AAA"),
    Record(dateTime: DateTime.now(), weight: 70, note: "BAA"),
    Record(dateTime: DateTime.now(), weight: 80, note: "CAA"),
    Record(dateTime: DateTime.now(), weight: 90, note: "DAA"),*/
  ].obs;

  void addRecord() {
    records.add( Record(dateTime: dateTime.value, weight: weight.value, note: "XXXX"));
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
