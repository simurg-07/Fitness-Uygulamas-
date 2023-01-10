import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller.dart';
import '../data/getx_storage.dart';
import 'bottomnavigationbar.dart';

class updateScreen extends StatelessWidget {
  double? boykiloendeksi;
  double? yagorani;
  double? suorani;
  double? gunlukkalori;

  final TextEditingController _boy = TextEditingController();
  final TextEditingController _kilo = TextEditingController();
  final TextEditingController _boyun = TextEditingController();
  final TextEditingController _bel = TextEditingController();
  final TextEditingController _kalca = TextEditingController();
  final TextEditingController _yas = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.indigo.withOpacity(0.9),
            Colors.indigo.withOpacity(0.7),
            Colors.indigo.withOpacity(0.5),
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Lottie.network(
                    "https://assets10.lottiefiles.com/packages/lf20_2xjlo1wq.json",
                    height: 150,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              colors: [
                                                Colors.indigo.withOpacity(0.3),
                                                Colors.indigo.withOpacity(0.2),
                                                Colors.indigo.withOpacity(0.1),
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 10,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: const Center(
                                        child: Text(
                                          "Erkek",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _boy,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Boy",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Boy Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _kilo,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Kilo",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Kilo Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _boyun,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Boyun Çevresi",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Boyun Çevresi Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _bel,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Bel Çevresi",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Bel Çevresi Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _yas,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Yaş",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Yaş Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _boykiloendeksi();
                                      _erkekyagorani();
                                      _suorani();
                                      _gunlukkalori();
                                      await box.write(
                                          "boykiloendeksi", boykiloendeksi!);
                                      box.write("yagorani", yagorani!);
                                      box.write("suorani", suorani!);
                                      box.write("gunlukkalori", gunlukkalori!);

                                      await Get.to(bottomnavigaionbarScreen());
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.indigo.withOpacity(0.7),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Güncelle",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              colors: [
                                                Colors.indigo.withOpacity(0.3),
                                                Colors.indigo.withOpacity(0.2),
                                                Colors.indigo.withOpacity(0.1),
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 10,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "Kadın",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _boy,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Boy",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Boy Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _kilo,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Kilo",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Kilo Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _boyun,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Boyun Çevresi",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Boyun Çevresi Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _bel,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Bel Çevresi",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Bel Çevresi Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _kalca,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Kalça",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Kalça Çevresi Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.indigo
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: TextFormField(
                                        controller: _yas,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                            ),
                                            hintText: "Yaş",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Lütfen Yaş Giriniz';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _boykiloendeksi();
                                      _kadinyagorani();
                                      _suorani();
                                      _gunlukkalori();
                                      await box.write(
                                          "boykiloendeksi", boykiloendeksi!);
                                      box.write("yagorani", yagorani!);
                                      box.write("suorani", suorani!);
                                      box.write("gunlukkalori", gunlukkalori!);

                                      await Get.to(bottomnavigaionbarScreen());
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.indigo.withOpacity(0.7),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Güncelle",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _boykiloendeksi() {
    boykiloendeksi = int.parse(_kilo.text) /
        (double.parse(_boy.text) * double.parse(_boy.text));

    boykiloendeksi = boykiloendeksi! * 10000;

    _controller.boykilo.value = boykiloendeksi!.toDouble();
  }

  void _kadinyagorani() {
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

  void _erkekyagorani() {
    double logBase(num x, num base) => log(x) / log(base);
    double log10(num x) => logBase(x, 10);

    yagorani = (495 /
            (1.0324 -
                (0.19077 *
                    log10(
                        double.parse(_bel.text) - double.parse(_boyun.text))) +
                (0.15456 * log10(double.parse(_boy.text))))) -
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
