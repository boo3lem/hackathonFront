import 'package:flutter/material.dart';
import 'package:hackathon/bottombar/bottombar.dart';
import 'package:hackathon/pages/home_page.dart';
import 'package:hackathon/sidebar/sidebar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class SideBarLayout extends StatelessWidget {
  const SideBarLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          SideBar(),
          BottomBar(),
        ],
      ),
    );
  }
}

