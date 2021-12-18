import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon/sidebar/widgets/costume_menu_clipper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late StreamController<bool> isBottomBarOpenedStreamController;
  late Stream<bool> isBottomBarOpenedStream;
  late StreamSink<bool> isBottomBarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isBottomBarOpenedStreamController = PublishSubject<bool>();
    isBottomBarOpenedStream = isBottomBarOpenedStreamController.stream;
    isBottomBarOpenedSink = isBottomBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isBottomBarOpenedStreamController.close();
    isBottomBarOpenedSink.close(); // TODO: implement dispose
    super.dispose();
  }

  void onIconsPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isBottomBarOpenedSink.add(false);

      _animationController.reverse();
    } else {
      isBottomBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isBottomBarOpenedStream,
      builder: (context, isBottomBarOpenAsync) {
        if (isBottomBarOpenAsync.data != null) {
          final isBottomBarOpen = isBottomBarOpenAsync.data as bool;
          return AnimatedPositioned(
            duration: _animationDuration,
            top: isBottomBarOpen ? screenHeight/3.9 : screenHeight/6*5.8,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onIconsPressed();
                  },
                  child: Center(
                    child: Container(
                      height: 10,
                      margin: EdgeInsets.only(left: screenWidth / 2.8),
                      width: screenWidth / 5 * 3.1,
                      color: Color(0xFF09C699),
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        heightFactor: 0.5,
                        child: Container(
                          margin: EdgeInsets.only(top:3),
                          color: Colors.white,
                          width: screenWidth,
                        ),
                      )
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment(0, (-screenHeight / 5) / 100),
                //   child: GestureDetector(
                //     onTap: () {
                //       onIconsPressed();
                //     },
                //     child: Container(
                //       height: 10,
                //       margin: EdgeInsets.only(left: screenWidth / 2.8),
                //       width: screenWidth / 5 * 3.1,
                //       color: Color(0xFF262AAA),
                //       alignment: Alignment.topCenter,
                //       child: AnimatedIcon(
                //         progress: _animationController.view,
                //         icon: AnimatedIcons.menu_close,
                //         color: Color(0xFF1BB5FD),
                //         size: 25,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Container(
                    color: Color(0xFF262AAA),
                    margin: EdgeInsets.only(left: screenWidth / 2.8),
                    width: screenWidth / 5 * 3.1,
                  ),
                ),
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
