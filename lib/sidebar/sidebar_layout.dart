import 'package:flutter/material.dart';
import 'package:hackathon/ui/home.dart';

class SideBarLayout extends StatefulWidget {

  const SideBarLayout({ Key? key }) : super(key: key);

  @override
  State<SideBarLayout> createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  late TextEditingController textController = TextEditingController();
  bool showList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          //InfoCard(expandAction: expandAction),
          // SideBar(),
          // InfoCard(),
        ],
      ),
    );
  }
}

