import 'package:get/get.dart';
import 'package:kilo_takibi_getx/models/record.dart';

class Controller extends GetxController {
  final weight = 70.obs;
  final dateTime = DateTime.now().obs;
  final  inidrmebaglantisi = "https://img.lovepik.com/element/40087/1421.png_300.png".obs;

  final boykilo = 0.00.obs;
  final yagoranii = 0.00.obs;
  final suoranii = 0.00.obs;
  final gunlukkalorii = 0.00.obs;




  var records = <Record>[].obs;

   addRecord() {
    records.add(
        Record(dateTime: dateTime.value, weight: weight.value, note: "XXXX"));
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
