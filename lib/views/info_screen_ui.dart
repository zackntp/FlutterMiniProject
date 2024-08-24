// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InfoUi extends StatefulWidget {
  const InfoUi({super.key});

  @override
  State<InfoUi> createState() => _InfoUiState();
}

class _InfoUiState extends State<InfoUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/saulogo.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'Tech SAU BUFFET',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'แอปพลิเคลั่นร้านหมูกระทะ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                ),
                Text(
                  'เพื่อคนไทย',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                ),
                Text(
                  'โดยเด็กไทย',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                ),
                Text(
                  'สนใจแอปพลิเคชั่นติดต่อ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                ),
                Text(
                  'เด็กไอที SAU',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Image.asset(
                  'assets/images/sauqr.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
