import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/clipPath.dart';
import 'package:lottie/lottie.dart';
import '../data/getx_storage.dart';
import '../constants.dart';
import '../words/motivasyon_sozleri.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

extension RandomListed<T> on List<T> {
  T get randomListData => this[Random().nextInt(length)];
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: ListView(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: double.infinity,
                  height: 600,
                  color: CustomColors.kBackgroundColor,
                ),
              ),
              Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Get.width - 20,
                        height: Get.height / 3.8,
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.5),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Motivasyon",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  motivasyon.randomListData,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      graph_container(
                          baslik: "Günlük Kalori",
                          image:
                              "https://assets7.lottiefiles.com/packages/lf20_TmewUx.json",
                          ek: "",
                          data: box.read("gunlukkalori").toStringAsFixed(0),
                          ek2: "Cal"),
                      SizedBox(height: Get.height / 90),
                      graph_container(
                        baslik: "Günlük Su",
                        image:
                            "https://assets6.lottiefiles.com/packages/lf20_fjwc7dtd.json",
                        ek: "",
                        data: box.read("suorani").toStringAsFixed(2),
                        ek2: "Lt",
                      ),
                      SizedBox(height: Get.height / 90),
                      graph_container(
                        baslik: "Vücut Kitle Endeksi ",
                        image:
                            "https://assets2.lottiefiles.com/packages/lf20_x7c2fvxg.json",
                        ek: "",
                        data: box.read("boykiloendeksi").toStringAsFixed(2),
                        ek2: "",
                      ),
                      SizedBox(height: Get.height / 90),
                      graph_container(
                        baslik: "yağ Oranı",
                        image:
                            "https://assets1.lottiefiles.com/packages/lf20_qdwp9wj8.json",
                        ek: "%",
                        data: box.read("yagorani").toStringAsFixed(2),
                        ek2: "",
                      ),
                      SizedBox(height: Get.height / 90),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class graph_container extends StatelessWidget {
  String baslik;
  String image;
  String data;
  String? ek;
  String? ek2;

  graph_container(
      {Key? key,
      required this.baslik,
      required this.image,
      required this.data,
      required this.ek,
      required this.ek2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: Get.width - 20,
            height: Get.height / 3.0,
            decoration: BoxDecoration(
                color: Color(0xFF3F0071).withOpacity(0.6),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20))),
        Container(
          width: Get.width - 20,
          height: Get.height / 3.0,
          decoration: BoxDecoration(
              color: Color(0xFFAAC4FF).withOpacity(1),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(200.0),
                topLeft: Radius.circular(50.0),
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(50.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                baslik,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                  indent: 80, endIndent: 80, thickness: 3, color: Colors.white),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Color(0xFF522546),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all()),
                      ),
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all()),
                        child: Lottie.network(image),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        " ${ek} ${data} ${ek2}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
