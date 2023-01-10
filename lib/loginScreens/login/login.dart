import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kilo_takibi_getx/pages/female.dart';

import '../../data/getx_storage.dart';
import '../../data/services/auth.dart';
import '../../pages/gender.dart';
import '../../pages/homepage.dart';
import '../../pages/bottomnavigationbar.dart';
import '../components/background.dart';
import '../register/register.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passwordcontrol = TextEditingController();

  AuthServices _authServices = AuthServices();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: Text(
                      "HOŞGELDİNİZ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _emailcontrol,
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-Mail",
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Mail Giriniz';
                      } else if (!value.contains("@")) {
                        return "Girilen Değer Mail Formatında olmalıdır";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _passwordcontrol,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi Girin:",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Şifre Giriniz';
                      } else if (value.trim().length < 6) {
                        return "Şifre 6 Karakterden Az Olamaz";
                      }
                      return null;
                    },
                  ),
                ),
                /*Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                  ),
                ),*/
                SizedBox(height: Get.height * 0.05),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _authServices
                                .signIn(_emailcontrol.text, _passwordcontrol.text)
                                .then((value) {
                              if (box.read("boykiloendeksi") == null) {
                                return Get.to(() => genderScreen());
                              }
                              if (box.read("boykiloendeksi") != null) {
                                return Get.to(() => bottomnavigaionbarScreen());
                              }
                            }).catchError((dynamic error) {
                              if (error.code.contains('user-not-found')) {
                                Get.snackbar("HATA!", "Böyle Bir Mail Adresi Yok");
                              } else if (error.code.contains('wrong-password')) {
                                Get.snackbar("HATA!", "Şifre Yanlış");
                              }

                              print(error.code);
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: Get.width * 0.5,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                gradient: new LinearGradient(colors: [
                                  Color.fromARGB(255, 255, 136, 34),
                                  Color.fromARGB(255, 255, 177, 41)
                                ])),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "GİRİŞ YAP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {
                          Get.to(RegisterScreen())
                        },
                        child: Text(
                          "Hesabınız Yok mu ?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
