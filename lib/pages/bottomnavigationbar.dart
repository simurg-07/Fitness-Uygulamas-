import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/data/services/auth.dart';
import 'package:kilo_takibi_getx/pages/addrecord.dart';
import 'package:kilo_takibi_getx/pages/homepage.dart';
import 'package:kilo_takibi_getx/pages/formhistory.dart';
import 'package:kilo_takibi_getx/pages/bodymassindex.dart';
import '../constants.dart';
import '../loginScreens/login/login.dart';
import 'update.dart';

class bottomnavigaionbarScreen extends StatefulWidget {
  const bottomnavigaionbarScreen({Key? key}) : super(key: key);

  @override
  State<bottomnavigaionbarScreen> createState() =>
      _bottomnavigaionbarScreenState();
}

class _bottomnavigaionbarScreenState extends State<bottomnavigaionbarScreen> {
  int _currentTab = 0;
  AuthServices _authServices = AuthServices();

  final _screens = [
    HomepageScreen(),
    formhistoryScreen(),
    bodymassindexScreen(),
    updateScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: (Get.width / 100) * 10,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                size: 30,
                color: CustomColors.kPrimaryColor,
              ),
              onPressed: () async {
                _authServices.signOut();

                await Get.to(LoginScreen());
              })
        ],
      ),
      body: _screens[_currentTab],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.withOpacity(0.7),
        hoverColor: Colors.redAccent,
        onPressed: () {
          Get.to(() => addrecordScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 14,
        // Get paketi ile cihazın ekran boyu ile orantılı height verebilirsin.(MediaQuery ile de verirsin ama get saysesinde daha kolay)
        backgroundColor: Colors.white,
        activeColor: Colors.indigo.withOpacity(0.7),
        inactiveColor: Colors.grey,
        gapLocation: GapLocation.center,
        iconSize: 30,
        icons: [
          Icons.show_chart,
          Icons.history,
          Icons.access_time_filled_rounded,
          Icons.browser_updated,
        ],
        activeIndex: _currentTab,
        onTap: (index) => setState(() => _currentTab = index),
      ),
    );
  }
}
