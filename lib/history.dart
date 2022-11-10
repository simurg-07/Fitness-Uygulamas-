import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kilo_takibi_getx/widgets/record_list_tile.dart';
import 'clipPath.dart';
import 'controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_sharp))
          ],
        ),
          body: Stack(
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
                  child: _controller.records.isEmpty
                      ? Center(
                    child: Container(
                      child: Text("Lütfen Veri Ekleyin", style: TextStyle(color: Color(0xFFFFFF00)),),
                    ),
                  )
                      : ListView(
                      physics: BouncingScrollPhysics(),
// ios cihazlardaki gibi yukardan aşağı çekince şekil =) oluyor
                      children: _controller.records
                          .map((record) => recordListTile(record: record))
                          .toList()),
              )
            ],
          )
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
            indent: 120,
            endIndent: 120,
            thickness: 3,
            color: Color(0xFFFFFF00))
      ],
    );
  }
}
