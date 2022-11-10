import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/clipPath.dart';

import 'motivasyon_sozleri.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

extension RandomListed<T> on List<T> {
  T get randomListData => this[ Random().nextInt(length)];
}


class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFF00),
          title: Text("Anasayfa"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_sharp))
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: double.infinity,
                  height: 600,
                  color: Color(0xFFFFFF00),
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
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(motivasyon.randomListData, style: TextStyle(fontSize: 18, color: Colors.white), ),
                          ),
                        ),
                      ),

                    ],
                  ))
            ],
          ),
        ));
  }
}



