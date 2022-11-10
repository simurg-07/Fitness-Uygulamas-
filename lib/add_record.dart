import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_getx/controller.dart';
import 'package:kilo_takibi_getx/models/record.dart';
import 'package:numberpicker/numberpicker.dart';

import 'home.dart';

class addRecordView extends StatefulWidget {
  const addRecordView({super.key});

  @override
  State<addRecordView> createState() => _addRecordViewState();
}

class _addRecordViewState extends State<addRecordView> {
  int _selectedValue = 70;
  int? _selecteddvalue;
  DateTime _selectedDate = DateTime.now();
  final Controller _controller = Get.put(Controller(
      // selectedDate: DateTime.now(), weight: 70
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () { Get.back();},
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFFFFFF00),
            ),
          ),
          backgroundColor: Colors.black12,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_sharp))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              _text(baslik: "Form"),
              _text(baslik: "Takibi"),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 70,
                child: Card(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          FontAwesomeIcons.weightScale,
                          size: 45,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          // ikonu nereye yerleştiriceğini belirtir
                          children: [
                            NumberPicker(
                              itemCount: 3,
                              itemWidth: 80,
                              step: 1,
                              axis: Axis.horizontal,
                              // bu özellik yan yatırır
                              minValue: 35,
                              maxValue: 150,
                              value: _controller.weight.value,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _controller.weight.value = value;
                                  },
                                );
                              },
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black)),
                            ),
                            Icon(
                              FontAwesomeIcons.chevronUp,
                              size: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () async {
                  _controller.dateTime.value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030)) ??
                      _selectedDate; // eğer ?? bundan önce null gelmiyorsa ?? un önceki fonksiyonu yap. Eğer ?? dan önce bull geliyor ise ?? dan sonraki fonksiyonu yap.

                  setState(() {
                    _selectedDate = _controller.dateTime.value;
                  });
                },
                child: SizedBox(
                  height: 70,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            FontAwesomeIcons.calendar,
                            size: 45,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            DateFormat("EEE, MM, d").format(_selectedDate),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  _controller.addRecord();
                },
                child: Container(
                  height: 90,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white12),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Save Record",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      IconTheme(
                          data: new IconThemeData(color: Colors.white),
                          child: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _text extends StatelessWidget {
  String baslik;

  _text({Key? key, required this.baslik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          baslik,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
            indent: 120, endIndent: 120, thickness: 3, color: Color(0xFFFFFF00))
      ],
    );
  }
}
