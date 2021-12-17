import 'package:flutter/material.dart';
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
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        Image.asset(exposants[0].logo, height: scale(5),),
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
                    padding: EdgeInsets.only(left : scale(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward),
                        Text("Entrer"),
                      ],
                    ),
                  )
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
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    height: scale(15),
                    width: scale(60),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green[300]!),
                      color: Colors.green[100]!,
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
                  ),
                )
              ],
            ),
          ],
        ),
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
