import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_getx/add_record.dart';
import 'package:kilo_takibi_getx/graph.dart';
import 'package:kilo_takibi_getx/history.dart';
import 'package:kilo_takibi_getx/vucutKitleEndeksi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Widget _currentScreen = GraphScreen();

  final _screens = [
    GraphScreen(),
    HistoryScreen(),
    FitScreen(),
    FitScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _screens[_currentTab],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFFF00),
        hoverColor: Colors.redAccent,
        onPressed: () {
          Get.to(() => addRecordView());
        },
        child: Icon(Icons.add,  color: Colors.black,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 12,
        // Get paketi ile cihazın ekran boyu ile orantılı height verebilirsin.(MediaQuery ile de verirsin ama get saysesinde daha kolay)
        backgroundColor: Colors.black,
        activeColor:Color(0xFFFFFF00),
        inactiveColor: Colors.grey,
        gapLocation: GapLocation.center,
        iconSize: 30,
        icons: [Icons.show_chart, Icons.history,Icons.access_time_filled_rounded,Icons.ac_unit_rounded],
        activeIndex: _currentTab,
        onTap: (index) => setState(() => _currentTab = index),


      ),
    );
  }
}
