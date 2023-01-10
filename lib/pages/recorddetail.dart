import 'dart:collection';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kilo_takibi_getx/controller.dart';
import 'package:numberpicker/numberpicker.dart';

import '../constants.dart';
import '../data/data.dart';

class recorddetailScreen extends StatefulWidget {
  recorddetailScreen({required this.detayveri});

  Veri detayveri;

  @override
  State<recorddetailScreen> createState() => _recorddetailScreenState();
}

class _recorddetailScreenState extends State<recorddetailScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  var ref = FirebaseDatabase.instance.ref().child("veri");

  DateTime _selectedDate = DateTime.now();
  final Controller _controller = Get.put(Controller());

  String indirmebaglantisi =
      "https://www.pngmart.com/files/2/Mario-Transparent-Background.png";

  UploadTask? uploadTask;

  PlatformFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.withOpacity(0.7),
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
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 70,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  "Kilo: ${widget.detayveri.kilo}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 70,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  "Tarih: ${widget.detayveri.tarih!.substring(0, 10)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network("${widget.detayveri.fotolink}",
                  fit: BoxFit.contain),
              width: 300,
              height: 500),
        ])));
  }
}
