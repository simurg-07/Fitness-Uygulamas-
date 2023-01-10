import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/pages/male.dart';
import 'package:kilo_takibi_getx/pages/female.dart';


class genderScreen extends StatefulWidget {
  const genderScreen({super.key});

  @override
  State<genderScreen> createState() => _genderScreenState();
}

class _genderScreenState extends State<genderScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3F72AF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          title: SvgPicture.asset(
            'assets/icons/dumbell.svg',
            height: (Get.width / 100) * 10,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _text(baslik: "Cinsiyet"),
              SizedBox(height: 15,),
              Container(
                width: Get.width - 20,
                height: Get.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    color: Colors.black.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(6, 12), // Shadow position
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    Row(children: [
                     Spacer(),
                      GestureDetector(
                        onTap: () {Get.to(kadinPage());},
                        child: Image.asset('assets/icons/female.png',
                          height: Get.height / 5,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {Get.to(maleScreen());},
                        child: Image.asset('assets/icons/male.png',
                          height: Get.height / 6,
                        ),
                      ),
                      Spacer()

                    ],)

                  ],),
              ),
            ],
          ),
        ));
  }}

class _container extends StatefulWidget {
  String textt;
  Function onPress;

   _container({Key? key, required this.textt, required this.onPress}) : super(key: key);

  @override
  State<_container> createState() => _containerState();
}

class _containerState extends State<_container> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {widget.onPress();},
      child: Container(
        height: Get.height / 8,
        width: Get.width / 1.5,
        decoration: BoxDecoration(
            color:Color(0xFFAAC4FF).withOpacity(1),
            border: Border.all(),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(widget.textt, style: TextStyle(fontSize: 40),)),
      ),
    );
  }
}

//stateful kullanmazsan tanımladığun fonksiyon çalışmaz.

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
            indent: 50, endIndent: 50, thickness: 3, color: Colors.black)
      ],
    );
  }
}


