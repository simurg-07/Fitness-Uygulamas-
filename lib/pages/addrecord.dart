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

class addrecordScreen extends StatefulWidget {
  const addrecordScreen({super.key});

  @override
  State<addrecordScreen> createState() => _addrecordScreenState();
}

class _addrecordScreenState extends State<addrecordScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  var ref = FirebaseDatabase.instance.ref().child("veri");

  DateTime _selectedDate = DateTime.now();
  final Controller _controller = Get.put(Controller());

  //File? _secilenDosya;

  final _formKey = GlobalKey<FormState>();

  File? _yuklenecekDosya;

  String indirmebaglantisi =
      "https://www.pngmart.com/files/2/Mario-Transparent-Background.png";

  kameradaYukle() async {
    var alinanDosya =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _yuklenecekDosya = File(alinanDosya!.path);
    });

    Reference refyol = FirebaseStorage.instance
        .ref()
        .child("fotoğraflar")
        .child(auth.currentUser!.uid)
        .child(_controller.dateTime.toString());

    UploadTask yuklemegorevi = refyol.putFile(_yuklenecekDosya!);

    String url = await (await yuklemegorevi).ref.getDownloadURL();
    indirmebaglantisi = url;
  }

  UploadTask? uploadTask;

  Future uploadFile() async {
    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);

    final refyol = FirebaseStorage.instance.ref().child(path);

    uploadTask = refyol.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();

    _controller.inidrmebaglantisi.value = urlDownload;
    print("Download Link: ${urlDownload}");
  }

  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

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
            key: _formKey,
            child: Column(children: [
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
                              selectedTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                              DateFormat(
                                'dd-MM-yyyy',
                              ).format(_selectedDate),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  selectFile();
                },
                child: SizedBox(
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
                            FontAwesomeIcons.camera,
                            size: 45,
                          ),
                        ),
                        Text(
                          "Fotoğraf Ekle",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Icon(
                          FontAwesomeIcons.chevronUp,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (pickedFile != null)
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.file(File(pickedFile!.path!),
                        width: 300, height: 500, fit: BoxFit.contain)),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  await uploadFile();

                  _veriekle();

                  await _controller.addRecord();
                  Get.back();
                },
                child: Container(
                  height: 90,
                  width: Get.width - 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black.withOpacity(0.5)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Verileri Kaydet",
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
            ])));
  }

  Future<void> _veriekle() async {
    var veri = HashMap<String, dynamic>();
    veri["id"] = "";
    veri["kilo"] = _controller.weight.toString();
    veri["tarih"] = _controller.dateTime.toString();
    veri["fotolink"] = _controller.inidrmebaglantisi.toString();

    ref.child("${auth.currentUser!.uid}").push().set(veri);
  }

  void _secimFotoGoster(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Galeriden Fotoğraf Seç"),
                    onTap: () {
                      _secimYukle(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    title: const Text("Kameradan Fotoğraf Çek"),
                    onTap: () {
                      _secimYukle(ImageSource.camera);
                    },
                  )
                ],
              ),
            ));
  }

  void _secimYukle(ImageSource source) async {
    final picker = ImagePicker();
    final secilen = await picker.pickImage(source: source);

    setState(() {
      if (secilen != null) {
        // _secilenDosya = File(secilen.path);
        _fotografKes(File(secilen.path));
      }
    });
    Navigator.pop(context);
  }

  void _fotografKes(File photo) async {
    final cropper = ImageCropper();
    CroppedFile? kesilenFoto = await cropper.cropImage(
      sourcePath: photo.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      maxWidth: 800,
    );

    if (kesilenFoto != null) {
      setState(() {
        //_secilenDosya = kesilenFoto as File?;
      });
    }
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
        Divider(indent: 120, endIndent: 120, thickness: 3, color: Colors.black)
      ],
    );
  }
}
