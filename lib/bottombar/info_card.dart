import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:hackathon/data/models/exposant.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({
    Key? key,
    required this.expandAction,
  }) : super(key: key);
  final ValueNotifier<Exposant> expandAction;
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);
  final button = false;
  @override
  void initState() {
    widget.expandAction.addListener(listener);

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

  bool isOpened = false;
  void listener() {
    setState(() {
      exposant = widget.expandAction.value;
    });
    if (!isOpened) {
      
      onIconsPressed();
    }

  }

  void onIconsPressed() {
    isOpened = !isOpened;
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

  late Exposant exposant;
  @override
  Widget build(BuildContext context) {
    exposant = widget.expandAction.value;
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
            left: isSideBarOpen
                ? screenWidth / 10
                : screenWidth - screenWidth / 5 * 2.95,
            right: isSideBarOpen ? 0 : 0,
            child: Row(
              children: [
                Container(
                  height: screenWidth / 20,
                  width: screenWidth / 5 * 2.95,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment(0, (-screenHeight / 5) / 100),
                    child: GestureDetector(
                      onTap: () {
                        onIconsPressed();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1773CF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: screenWidth / 25,
                                  width: screenWidth / 20,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Image.asset(exposant.logo,
                                  height: screenWidth / screenHeight * 20),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(50)),
                              //     image: Image.asset(widget.image),
                              //   ),
                              //   height: screenHeight / 5 * 1.3,
                              //   width: screenWidth / 5.5,
                              // ),
                              SizedBox(
                                height: screenHeight / 30,
                              ),
                              Container(
                                height: screenHeight / 10,
                                child: Text(
                                  exposant.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight / 30,
                              ),
                              Container(
                                height: screenWidth/3*0.9,
                                width: screenHeight/2,
                                padding: EdgeInsets.all(5),
                                color: Colors.black.withOpacity(0.0),
                                child: Text(
                                  exposant.description,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 13,
                                  color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ),
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
