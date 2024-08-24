// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukrata_sau_project/views/billpay_screen_ui.dart';
import 'package:mukrata_sau_project/views/info_screen_ui.dart';
import 'package:mukrata_sau_project/views/menu_screen_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  NotchBottomBarController _controller = new NotchBottomBarController(index: 1);

  int itemSelectedIndex = 1;

  List<Widget> viewShow = [
    BillPayUi(),
    MenuScreenUi(),
    InfoUi(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
          notchColor: Colors.deepOrange,
          color: Colors.deepOrange,
          onTap: (paramValue) {
            setState(() {
              itemSelectedIndex = paramValue;
            });
          },
          notchBottomBarController: _controller,
          kIconSize: 25.0,
          kBottomRadius: 25,
          bottomBarItems: [
            BottomBarItem(
              inActiveItem: Icon(
                FontAwesomeIcons.moneyBill1Wave,
                color: Colors.grey,
              ),
              activeItem: Icon(
                FontAwesomeIcons.moneyBillWave,
                color: Colors.white,
              ),
              itemLabel: 'คิดเงิน',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeItem: Icon(
                Icons.home,
                color: Colors.white,
              ),
              itemLabel: 'HOME',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.star,
                color: Colors.grey,
              ),
              activeItem: Icon(
                Icons.star,
                color: Colors.white,
              ),
              itemLabel: 'เกี่ยวกับ',
            ),
          ]),
      body: viewShow[itemSelectedIndex],
    );
  }
}
