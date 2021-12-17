import 'package:flutter/material.dart';
import 'package:hackathon/bottombar/info_card.dart';
import 'package:hackathon/data/data-helper.dart';
import 'package:hackathon/data/models/exposant.dart';

class FlagPage extends StatefulWidget {
  @override
  FlagPageState createState() => FlagPageState();
}

class FlagPageState extends State<FlagPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late InfoCard card;

  final List<Exposant> exposants = DataHelper.getStands();
  late ValueNotifier<Exposant> valueNotifier=ValueNotifier(exposants[0]);

  @override
  Widget build(BuildContext context) {
    valueNotifier.value = Exposant(0, "", "", "", "assets/bms.png");
    card = new InfoCard(
      expandAction: valueNotifier,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Stack(children: [
      Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      valueNotifier.value = exposants[0];
                      card = new InfoCard(
                        expandAction: valueNotifier,
                      );
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[1];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[2];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[3];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[4];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[5];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[6];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[7];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[8];
                    },
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
                            Icon(Icons.arrow_forward),
                            Text("Entrer"),
                          ],
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      valueNotifier.value = exposants[9];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[10];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[11];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[12];
                    },
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
                    onTap: () {
                      valueNotifier.value = exposants[13];
                    },
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
        ),
      ),
      card,
    ]);
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
