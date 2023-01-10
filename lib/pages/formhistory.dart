import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kilo_takibi_getx/pages/recorddetail.dart';
import '../clipPath.dart';
import '../controller.dart';
import '../data/data.dart';

class formhistoryScreen extends StatefulWidget {
  const formhistoryScreen({Key? key}) : super(key: key);

  @override
  State<formhistoryScreen> createState() => _formhistoryScreenState();
}

class _formhistoryScreenState extends State<formhistoryScreen> {
  Veri? veri;

  final Controller _controller = Get.put(Controller());
  final FirebaseAuth auth = FirebaseAuth.instance;

  var ref = FirebaseDatabase.instance.ref().child("veri");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.withOpacity(0.7),
        body: Stack(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 600,
                color: Colors.white,
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.transparent,
                child: StreamBuilder<DatabaseEvent>(
                  stream: ref.child("${auth.currentUser!.uid}").onValue,
                  builder: (context, event) {
                    if (event.hasData) {
                      var veriListesi = <Veri>[];

                      var gelenDegerler = event.data!.snapshot.value as dynamic;

                      if (gelenDegerler != null) {
                        gelenDegerler.forEach((key, value) {
                          var gelenVeri = Veri.fromJson(key, value);
                          veriListesi.add(gelenVeri);
                        });
                      }
                      return ListView.builder(
                        itemCount: veriListesi.length,
                        itemBuilder: (context, indeks) {
                          var veri = veriListesi[indeks];

                          return GestureDetector(
                            onTap: () {
                              Get.to(recorddetailScreen(detayveri : veri ));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8, bottom: 8),
                                child: ListTile(
                                  leading: Text(veri.tarih!.substring(0,10),style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),),
                                  title: Center(
                                      child: Text(
                                    "${veri.kilo!.toString()}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Image.network(
                                            height: 40,
                                            width: 40,
                                            "${veri.fotolink!.toString()}",
                                            fit: BoxFit.cover,

                                          ),
                                        ),
                                      SizedBox(width: 10,),

                                      IconButton(
                                        onPressed: () {
                                          _verisil(veri.id!);
                                        },
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center();
                    }
                  },
                ))
          ],
        ));
  }

  Future<void> _verisil(String id) async {
    ref.child(id).remove();
  }
}


