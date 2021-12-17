import 'package:flutter/material.dart';
import 'package:hackathon/bottombar/bottombar.dart';
import 'package:hackathon/bottombar/info_card.dart';
import 'package:hackathon/sidebar/sidebar.dart';
import 'package:hackathon/ui/home.dart';
class SideBarLayout extends StatelessWidget {
  const SideBarLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          // SideBar(),
          // InfoCard(),
        ],
      ),
    );
  }
}

