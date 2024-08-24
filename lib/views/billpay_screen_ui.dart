// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers, void_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukrata_sau_project/views/payment_screen_ui.dart';

class BillPayUi extends StatefulWidget {
  const BillPayUi({super.key});

  @override
  State<BillPayUi> createState() => _BillPayUiState();
}

class _BillPayUiState extends State<BillPayUi> {
  _waringMessage(context, msg) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Align(
                child: Text(
                  'คำเตือน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            content: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ยืนยัน',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )
            ],
          );
        });
  }

  List<DropdownMenuItem<String>> get _Membership {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "0",
        child: Text(
          "ไม่เป็นสมาชิก",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "5",
        child: Text(
          "สมาชิก Silver Member ลด 5%",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "10",
        child: Text(
          "สมาชิก Gold Member ลด 10%",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "20",
        child: Text(
          "สมาชิก Plattinum Member ลด 20%",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
    return menuItems;
  }

  //function เรียกข้อมูล membership
  String getMemberShipdetail(String value) {
    switch (value) {
      case '0':
        return 'ไม่เป็นสมาชิก';
      case '5':
        return 'สมาชิก Silver Member ลด 5%';
      case '10':
        return 'สมาชิก Gold Member ลด 10%';
      case '20':
        return 'สมาชิก Plattinum Member ลด 20%';
      default:
        return '';
    }
  }

  //function คิดเงินรวมค่าบุฟเฟต์น้ำ
  int TotalBuff(int adultCount, int kidCount) {
    int Total = ((adultCount * 25) +
        (adultCount * 299) +
        (kidCount * 25) +
        (kidCount * 69));
    return Total;
  }

  //function คิดเงินไม่รวมค่าบุฟเฟต์น้ำ
  int TotalNoBuff(int adultCount, int kidCount) {
    int Total = ((adultCount * 299) + (kidCount * 69));
    return Total;
  }

  bool adult = false, kid = false;
  String? waterBuffet = "1";
  String? selectedMember = "0";

  TextEditingController _adult = TextEditingController(text: '');
  TextEditingController _kid = TextEditingController(text: '');

  TextEditingController _cola = TextEditingController(text: '');
  TextEditingController _water = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  children: [
                    Text(
                      'จำนวนคน',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    )
                  ],
                ),
                //Text control adult
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.deepOrange,
                        value: adult,
                        onChanged: (paramValue) {
                          setState(() {
                            adult = paramValue!;
                            if (paramValue == false) {
                              _adult.text = "";
                            }
                            ;
                          });
                        }),
                    Text(
                      'ผู้ใหญ่ 299 บาท / คน จำนวน',
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _adult,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '0 ',
                              suffixText: "คน",
                              suffixStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                              hintStyle: TextStyle(color: Colors.grey),
                              enabled: adult,
                            ),
                          ),
                        )),
                  ],
                ),
                //Text control kid
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.deepOrange,
                        value: kid,
                        onChanged: (paramValue) {
                          setState(() {
                            kid = paramValue!;
                            if (paramValue == false) {
                              _kid.text = "";
                            }
                          });
                        }),
                    Text(
                      'เด็ก 69 บาท / คน จำนวน',
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _kid,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                suffixText: "คน",
                                suffixStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                hintText: '0',
                                hintStyle: TextStyle(color: Colors.grey)),
                            enabled: kid,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      'บุฟเฟต์น้ำดื่ม',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        activeColor: Colors.deepOrange,
                        value: "1",
                        groupValue: waterBuffet,
                        onChanged: (paramValue) {
                          setState(() {
                            waterBuffet = paramValue!;
                            if (paramValue == "1") {
                              _cola.text = '';
                              _water.text = '';
                            }
                          });
                        }),
                    Text('รับ 25 บาท/หัว')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        activeColor: Colors.deepOrange,
                        value: "2",
                        groupValue: waterBuffet,
                        onChanged: (paramValue) {
                          setState(() {
                            waterBuffet = paramValue!;
                          });
                        }),
                    Text('ไม่รับ')
                  ],
                ),
                //Text control Cola
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        'โค้ก 20 บาท/ขวด จำนวน',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _cola,
                            decoration: InputDecoration(
                              hintText: '0',
                              suffixText: "ขวด",
                              suffixStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            enabled: waterBuffet == "2",
                          )),
                    )
                  ],
                ),
                //Text control water
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        'น้ำเปล่า 15 บาท/ขวด จำนวน',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _water,
                            decoration: InputDecoration(
                              hintText: '0',
                              suffixText: "ขวด",
                              suffixStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            enabled: waterBuffet == "2",
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'ประเภทสมาชิก',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    )
                  ],
                ),
                DropdownButtonHideUnderline(
                    child: DropdownButton(
                  isExpanded: true,
                  items: _Membership,
                  value: selectedMember,
                  onChanged: (String? value) {
                    setState(() {
                      selectedMember = value;
                    });
                  },
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                  iconEnabledColor: Colors.deepOrange[700],
                  dropdownColor: Colors.white,
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () {
                          if (adult == false && kid == false) {
                            _waringMessage(context, 'เลือกจำนวนคน');
                            return;
                          }
                          if (adult == true) {
                            if (_adult.text.isEmpty) {
                              _waringMessage(context, 'ระบุจำนวนผู้ใหญ่');
                              return;
                            }
                          }
                          if (kid == true) {
                            if (_kid.text.isEmpty) {
                              _waringMessage(context, 'ระบุจำนวนเด็ก');
                              return;
                            }
                          }

                          //// Cal TOTALWITHBUFFET
                          if (waterBuffet == '1') {
                            int _adultCount = (_adult.text.isEmpty)
                                ? 0
                                : int.parse(_adult.text);
                            int _kidCount =
                                (_kid.text.isEmpty) ? 0 : int.parse(_kid.text);
                            int _memberShip = int.parse(selectedMember!);
                            int Total = TotalBuff(_adultCount, _kidCount);
                            double TotalwithDis =
                                (Total - (Total / 100 * _memberShip));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PayMentUi(
                                    adultCount: _adultCount,
                                    kidCount: _kidCount,
                                    waterBuff: 'รับ 25 บาท/ท่าน',
                                    colaCount: 0,
                                    waterCount: 0,
                                    MemberDetail:
                                        getMemberShipdetail(selectedMember!),
                                    TotalwithDis: TotalwithDis,
                                  ),
                                ));
                          }

                          /// Cal TOTALWITHOUTBUFFET
                          if (waterBuffet == '2') {
                            int _adultCount = (_adult.text.isEmpty)
                                ? 0
                                : int.parse(_adult.text);
                            int _kidCount =
                                (_kid.text.isEmpty) ? 0 : int.parse(_kid.text);
                            int _colaCount = (_cola.text.isEmpty)
                                ? 0
                                : int.parse(_cola.text);
                            int _waterCount = (_water.text.isEmpty)
                                ? 0
                                : int.parse(_water.text);
                            int _memberShip = int.parse(selectedMember!);
                            int TotalNowater =
                                TotalNoBuff(_adultCount, _kidCount);
                            int Total = (TotalNowater +
                                (_colaCount * 20) +
                                (_waterCount * 15));
                            double TotalwithDis =
                                (Total - (Total / 100 * _memberShip));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PayMentUi(
                                    adultCount: _adultCount,
                                    kidCount: _kidCount,
                                    waterBuff: 'ไม่รับ',
                                    colaCount: _colaCount,
                                    waterCount: _waterCount,
                                    MemberDetail:
                                        getMemberShipdetail(selectedMember!),
                                    TotalwithDis: TotalwithDis,
                                  ),
                                ));
                          }
                        },
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณเงืน',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 44, 42, 42),
                        ),
                        onPressed: () {
                          setState(() {
                            _adult.text = "";
                            _kid.text = "";
                            adult = false;
                            kid = false;
                            _cola.text = "";
                            _water.text = "";
                            waterBuffet = "1";
                            selectedMember = "0";
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
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
