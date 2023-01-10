import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class bodymassindexScreen extends StatefulWidget {
  const bodymassindexScreen({Key? key}) : super(key: key);

  @override
  State<bodymassindexScreen> createState() => _bodymassindexScreenState();
}

class _bodymassindexScreenState extends State<bodymassindexScreen> {
  final TextEditingController _boyControl = TextEditingController();
  final TextEditingController _kiloControl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double? sonuc;
  double? yenisonuc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.withOpacity(0.7),
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
                    height: 40,
                  ),
                  _text(baslik: "Vücut"),
                  _text(baslik: "Kitle"),
                  _text(baslik: "İndeksi"),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: Get.width - 10,
                    height: Get.height / 2.5,
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
                                      "Lütfen Boyunuzu Cm Cinsinden Giriniz.",
                                  filled: true,
                                  fillColor: Colors.deepPurple.shade50),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen Boy Giriniz';
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
                                  labelText: "Lütfen Kilonuzu Giriniz",
                                  filled: true,
                                  fillColor: Colors.deepPurple.shade50),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen Kilo Giriniz';
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
                              // controller: _kiloControl,
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
                                  hintText: "Yaş",
                                  labelText: "Lütfen Yaşınızı Giriniz",
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
                      sonucGoster();
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
                            "Sonucu Göster",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          IconTheme(
                              data: IconThemeData(color: Colors.white),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                              )),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sonucGoster() {
    String? yazi;

    sonuc = (int.parse(_kiloControl.text) /
        (double.parse(_boyControl.text) * double.parse(_boyControl.text)) *
        10000);

    yenisonuc = sonuc;

    if (yenisonuc! < 18.5) {
      yazi = "Zayıf";
    } else if (yenisonuc! > 18.5 && yenisonuc! < 24.5) {
      yazi = "Normal";
    } else if (yenisonuc! > 25 && yenisonuc! < 29.9) {
      yazi = "Kilolu";
    } else if (yenisonuc! > 30) {
      yazi = "Obez";
    } else {
      return null;
    }

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
                        colors: [Colors.white, Colors.black],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Vücut Kitle Endeksi:" +
                                " " +
                                yenisonuc!.toDouble().toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Durum:" + " " + yazi!,
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
