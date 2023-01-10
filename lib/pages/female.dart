import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/controller.dart';
import 'package:lottie/lottie.dart';
import '../constants.dart';
import '../data/getx_storage.dart';
import 'bottomnavigationbar.dart';

class kadinPage extends StatefulWidget {
  const kadinPage({super.key});

  @override
  State<kadinPage> createState() => _kadinPageState();
}

class _kadinPageState extends State<kadinPage> {
  final Controller _controller = Get.put(Controller());

  final TextEditingController _boy = TextEditingController();
  final TextEditingController _kilo = TextEditingController();
  final TextEditingController _boyun = TextEditingController();
  final TextEditingController _bel = TextEditingController();
  final TextEditingController _kalca = TextEditingController();
  final TextEditingController _yas = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double? boykiloendeksi;
  double? yagorani;
  double? suorani;
  double? gunlukkalori;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3F72AF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: CustomColors.kPrimaryColor,
                size: 30,
              ),
              onPressed: () {
                Get.back();
              }),
          title: SvgPicture.asset(
            'assets/icons/dumbell.svg',
            height: (Get.width / 100) * 10,
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Lottie.network(
                "https://assets8.lottiefiles.com/temp/lf20_fPETSw.json",
                height: 200),
            Divider(
                indent: 50, endIndent: 50, thickness: 3, color: Colors.black),
            SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width - 20,
              height: 950,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black.withOpacity(0.5),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Boyunuzu Girin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _boy,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.height,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                hintText: "Boyunuzu Cm Cinsinden Giriniz.",
                                filled: true,
                                fillColor: Colors.deepPurple.shade50),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Boy Giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Kilonuzu Girin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _kilo,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.width_full,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                hintText: "Kilonuzu Giriniz",
                                filled: true,
                                fillColor: Colors.deepPurple.shade50),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kilo Giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "Boyun Çevrenizi Girin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _boyun,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.nest_cam_wired_stand_outlined,
                                  color: Colors.white,
                                ),
                                hintText: "Boyun Çevrenizi Giriniz",
                                filled: true,
                                fillColor: Colors.deepPurple.shade50),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Boyun Çevrenizi Giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "Karın Çevrenizi Girin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _bel,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.accessibility_sharp,
                                  color: Colors.white,
                                ),
                                hintText: "Karın Çevrenizi Giriniz",
                                filled: true,
                                fillColor: Colors.deepPurple.shade50),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Karın Çevrenizi Giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        " Kalça Çevrenizi Girin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _kalca,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.accessibility_sharp,
                                  color: Colors.white,
                                ),
                                hintText: "Kalçanızı Çevrenizi Giriniz ",
                                filled: true,
                                fillColor: Colors.deepPurple.shade50),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Kalçanızı Çevrenizi Giriniz ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        " Yaşınızı Girin:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: _yas,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.black),
                                ),
                                icon: Icon(
                                  Icons.bedtime_outlined,
                                  color: Colors.white,
                                ),
                                hintText: "Yaşınızı Giriniz",
                                filled: true,
                                fillColor: Colors.deepPurple.shade50),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Yaşınızı Giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  _boykiloendeksi();
                  _yagorani();
                  _suorani();
                  _gunlukkalori();
                  await box.write("boykiloendeksi", boykiloendeksi!);
                  print(box.read("boykiloendeksi"));
                  box.write("yagorani", yagorani!);
                  box.write("suorani", suorani!);
                  box.write("gunlukkalori", gunlukkalori!);

                  await Get.to(bottomnavigaionbarScreen());
                }
              },
              child: Container(
                height: 90,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black.withOpacity(0.5)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Save Record",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(),
                    IconTheme(
                        data: new IconThemeData(color: Colors.white),
                        child: Icon(Icons.arrow_forward_ios_outlined)),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ])),
        ));
  }

  void _boykiloendeksi() {
    boykiloendeksi = int.parse(_kilo.text) /
        (double.parse(_boy.text) * double.parse(_boy.text));

    boykiloendeksi = boykiloendeksi! * 10000;

    _controller.boykilo.value = boykiloendeksi!.toDouble();
  }

  void _yagorani() {
    double logBase(num x, num base) => log(x) / log(base);
    double log10(num x) => logBase(x, 10);

    yagorani = (495 /
            (1.29579 -
                (0.35004 *
                    log10(double.parse(_bel.text) +
                        double.parse(_kalca.text) -
                        double.parse(_boyun.text))) +
                (0.22100 * log10(double.parse(_boy.text))))) -
        450;

    _controller.yagoranii.value = yagorani!.toDouble();
  }

  void _suorani() {
    suorani = int.parse(_kilo.text) * 0.33;

    suorani = suorani! / 10;

    _controller.suoranii.value = suorani!.toDouble();
  }

  void _gunlukkalori() {
    gunlukkalori = 66.5 +
        (13.75 * int.parse(_kilo.text)) +
        (5 * double.parse(_boy.text)) -
        (6.77 * int.parse(_yas.text));

    _controller.gunlukkalorii.value = gunlukkalori!.toDouble();
  }
}
