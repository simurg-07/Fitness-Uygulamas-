import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kilo_takibi_getx/controller.dart';

import 'clipPath.dart';

class FitScreen extends StatefulWidget {
  const FitScreen({Key? key}) : super(key: key);

  @override
  State<FitScreen> createState() => _FitScreenState();
}

class _FitScreenState extends State<FitScreen> {
  final TextEditingController _boyControl = TextEditingController();
  final TextEditingController _kiloControl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double? sonuc;
  double? yenisonuc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Vücut Kitle İndeksi",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          key: _formKey,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 500,
                color: Color(0xFFFFFF00),
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.network(
                        "https://static.nike.com/a/images/w_1920,c_limit/7e16db35-2253-42b1-aed0-5f1d6bc7651d/the-best-nike-crossfit-clothing.jpg",
                        fit: BoxFit.cover,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        child: TextFormField(
                          controller: _boyControl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.height,
                                color: Colors.black,
                              ),
                              hintText: "Boy",
                              labelText:
                                  "Lütfen Boyunuzu Cm Cinsinden Giriniz. / 1.73",
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
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.width_full,
                                color: Colors.black,
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
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.access_time,
                                color: Colors.black,
                              ),
                              hintText: "Yaş",
                              labelText: "Lütfen Yaşınızı Giriniz",
                              filled: true,
                              fillColor: Colors.deepPurple.shade50),
                        ),
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
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white10),
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
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void sonucGoster() {
    String? yazi;
    sonuc = int.parse(_kiloControl.text) /
        (double.parse(_boyControl.text) * double.parse(_boyControl.text));

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
                        colors: [
                          Color(0xFFFFFF00),
                          Colors.black,
                        ],
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
                        Text("Durum" + " " + yazi!,
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
        Divider(
            indent: 120, endIndent: 120, thickness: 3, color: Color(0xFFFFFF00))
      ],
    );
  }
}

/*ListTile(
title: Text(
"Vücut Kitle Endeksi:" +
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
