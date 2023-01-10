import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../data/services/auth.dart';
import '../components/background.dart';
import '../login/login.dart';


class RegisterScreen extends StatelessWidget {

  final TextEditingController _usernamecontrol = TextEditingController();
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passwordcontrol = TextEditingController();
  final TextEditingController _passwordconfirmcontrol = TextEditingController();

  AuthServices _authServices = AuthServices();

  final _formKey = GlobalKey<FormState>();

   String? email;

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
                      "KAYIT OL",
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
                    controller: _usernamecontrol,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Kullanıcı Adı Giriniz",
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Kullanıcı Adı Giriniz';
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
                    controller: _emailcontrol,
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email Adresinizi Girin:",
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Mail Giriniz';
                      } else if (!value.contains("@")) {
                        return "Girilen Değer Mail Formatında olmalıdır";
                      } else {
                        email = value;
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
                SizedBox(height: Get.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _passwordconfirmcontrol,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Şifreyi Tekrar Giriniz:",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen Şifre Giriniz';
                      } else if (value.trim().length < 6) {
                        return "Şifre 6 Karakterden Az Olamaz";
                      } else if (_passwordcontrol.text !=
                          _passwordconfirmcontrol.text) {
                        return 'Şifreler Uyuşmuyor';
                      }
                      return null;
                    },
                  ),
                ),
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
                                .createPerson(_usernamecontrol.text,
                                _emailcontrol.text, _passwordcontrol.text)
                                .then((value) {
                              return Get.to(LoginScreen());
                            }).catchError((dynamic error){
                              if(error.code.contains('email-already-in-use')){
                                Get.snackbar("HATA!", "Mail Adresi Kullanılıyor");
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
                              "KAYIT OL",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(LoginScreen());

                        },
                        child: Text(
                          "Hesabın Var mı ? ",
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