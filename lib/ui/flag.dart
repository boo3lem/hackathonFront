import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/data/data-helper.dart';
import 'package:hackathon/data/models/exposant.dart';
import 'package:hackathon/data/models/pavion.dart';

class FlagPage extends StatefulWidget {
  final Pavion pavion;

  FlagPage(this.pavion);

  @override
  FlagPageState createState() => FlagPageState();
}

class FlagPageState extends State<FlagPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Exposant> exposants = DataHelper.getStands();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return (widget.pavion.title == 'P1') ? _buildPv1() : _buildPv2();
  }

  _buildPv1() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[0].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[0].title,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[1].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[1].title,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[2].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[2].title,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[3].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[3].title,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: scale(105),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[4].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[4].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[5].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[5].title,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: scale(15),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[6].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[6].title,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[7].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[7].title,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: scale(15),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[8].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[8].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: scale(120),
                  child: Padding(
                    padding: EdgeInsets.only(left: scale(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/enter.png'),
                        Text("Entrer"),
                      ],
                    ),
                  )),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[9].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[9].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[10].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[10].title,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[11].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[11].title,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[12].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[12].title,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green[300]!),
                    color: Colors.green[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[13].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[13].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildPv2() {
    return Container(
      padding: EdgeInsets.all(hp(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Ink(
                    height: scale(15),
                    width: scale(45),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue[300]!),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.blue[100]!,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          exposants[0].logo,
                          height: scale(5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          exposants[0].title,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    height: scale(15),
                    width: scale(45),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue[300]!),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.blue[100]!,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          exposants[1].logo,
                          height: scale(5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          exposants[1].title,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    height: scale(15),
                    width: scale(45),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue[300]!),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.blue[100]!,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          exposants[2].logo,
                          height: scale(5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          exposants[2].title,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Ink(
                    height: scale(15),
                    width: scale(15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue[300]!),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.blue[100]!,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          exposants[3].logo,
                          height: scale(5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          exposants[3].title,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Container(
                  width: scale(105),
                ),
                SizedBox(
                  width: 3,
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    height: scale(15),
                    width: scale(15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue[300]!),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.blue[100]!,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          exposants[4].logo,
                          height: scale(5),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          exposants[4].title,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[5].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[5].title,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: scale(15),
              ),
              SizedBox(
                width: 1.5,
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(30),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[6].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[6].title,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[7].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[7].title,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 1.5,
              ),
              Container(
                width: scale(15),
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[8].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[8].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: scale(120),
                  child: Padding(
                    padding: EdgeInsets.only(left: scale(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/enter.png', height: hp(5)),
                        Text("Entrer"),
                      ],
                    ),
                  )),
              SizedBox(
                width: 6,
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[9].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[9].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(30),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[10].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[10].title,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[11].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[11].title,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[12].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[12].title,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: () {},
                child: Ink(
                  height: scale(15),
                  width: scale(45),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue[300]!),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue[100]!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exposants[13].logo,
                        height: scale(5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        exposants[13].title,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  scale(int scale) {
    return MediaQuery.of(context).size.height /
        MediaQuery.of(context).size.width *
        scale *
        10;
  }

  hp(int percent) {
    return percent * MediaQuery.of(context).size.height / 100;
  }

  wp(int percent) {
    return percent * MediaQuery.of(context).size.width / 100;
  }
}
