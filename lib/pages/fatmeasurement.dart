import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../constants.dart';

class fatmeasurementScreen extends StatefulWidget {
  const fatmeasurementScreen({Key? key}) : super(key: key);

  @override
  State<fatmeasurementScreen> createState() => _fatmeasurementScreenState();
}

class _fatmeasurementScreenState extends State<fatmeasurementScreen> {
  final TextEditingController _boyControl = TextEditingController();
  final TextEditingController _kiloControl = TextEditingController();
  final TextEditingController _boyunControl = TextEditingController();
  final TextEditingController _belControl = TextEditingController();
  final TextEditingController _kalcaControl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double? sonuc;
  double? yenisonuc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: CustomColors.kPrimaryColor,
              size: 30,
            ),
            onPressed: () {}),
        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: (Get.width / 100) * 10,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: CustomColors.kPrimaryColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          key: _formKey,
          children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0.6, 0.8),
                    colors: <Color>[
                      Color(0xFF3F72AF),
                      Color(0xFFAAC4FF),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    _text(baslik: "Ya??"),
                    _text(baslik: "Oran??"),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: Get.width - 10,
                      height: Get.height / 1.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(0.5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: _boyControl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    icon: Icon(
                                      Icons.height,
                                      color: Colors.white,
                                    ),
                                    hintText: "Boy",
                                    labelText:
                                        "L??tfen Boyunuzu Cm Cinsinden Giriniz. / 1.73",
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade50),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'L??tfen Boy Giriniz';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: _kiloControl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    icon: Icon(
                                      Icons.width_full,
                                      color: Colors.white,
                                    ),
                                    hintText: "Kilo",
                                    labelText: "L??tfen Kilonuzu Giriniz",
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade50),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'L??tfen Kilo Giriniz';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: _boyunControl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    icon: Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                    ),
                                    hintText: "Boyun ??evresi",
                                    labelText: "L??tfen Boyun ??evrenizi Giriniz",
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade50),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: _belControl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    icon: Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                    ),
                                    hintText: "Kar??n ??evresi",
                                    labelText: "L??tfen Kar??n ??evrenizi Giriniz",
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade50),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              child: TextFormField(
                                controller: _kalcaControl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    icon: Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                    ),
                                    hintText: "Kal??a ??evresi",
                                    labelText: "L??tfen Kal??a ??evrenizi Giriniz",
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        yagSonucGoster();
                      },
                      child: Container(
                        height: 90,
                        width: 350,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black.withOpacity(0.8)),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Save Record",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            IconTheme(
                                data: IconThemeData(color: Colors.white),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void yagSonucGoster() {
    double logBase(num x, num base) => log(x) / log(base);
    double log10(num x) => logBase(x, 10);

    sonuc = (495 /
            (1.0324 -
                (0.19077 *
                    log10(double.parse(_belControl.text) -
                        double.parse(_boyunControl.text))) +
                (0.15456 * log10(double.parse(_boyControl.text))))) -
        450;

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0.9, 1.4),
                        colors: [
                          Colors.white,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "V??cut Ya?? Oran??:" +
                                " " +
                                sonuc!.toDouble().toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
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
        Divider(indent: 120, endIndent: 120, thickness: 3, color: Colors.white)
      ],
    );
  }
}

/*ListTile(
title: Text(
"V??cut Kitle Endeksi:" +
" " +
yenisonuc!.toDouble().toStringAsFixed(2),
style: TextStyle(
fontSize: 20, fontWeight: FontWeight.bold)),
),
ListTile(
title: Text("Durum" + " " + yazi!,
style: TextStyle(
fontSize: 20, fontWeight: FontWeight.bold)),
)*/
