import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';

import 'widgets/costume_menu_clipper.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close(); // TODO: implement dispose
    super.dispose();
  }

  void onIconsPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);

      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenAsync) {
        if (isSideBarOpenAsync.data != null) {
          final isSideBarOpen = isSideBarOpenAsync.data as bool;
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpen ? 0 : 0,
            right: isSideBarOpen ? 0 : screenWidth - screenWidth / 6 * 3.9,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFF262AAA),
                  ),
                ),
                Align(
                  alignment: Alignment(0, (-screenHeight / 5) / 100),
                  child: GestureDetector(
                    onTap: () {
                      onIconsPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        height: 80,
                        width: screenWidth / 20,
                        color: Color(0xFF262AAA),
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(0xFF1BB5FD),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: screenWidth / 5 * 2.95,
                )
              ],
            ),
          );
        } else {
          return Text("Didn't work");
        }
      },
    );
  }
}

 
