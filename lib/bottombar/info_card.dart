import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key}) : super(key: key);

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
            left: isSideBarOpen
                ? screenWidth - screenWidth / 5 * 2.95
                : screenWidth / 10,
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
                            color: Colors.white,
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
                                    color: Colors.black,
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
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.blue,
                                ),
                                height: screenHeight / 5 * 1.3,
                                width: screenWidth / 5.5,
                              ),
                              SizedBox(
                                height: screenHeight / 30,
                              ),
                              Container(
                                height: screenHeight / 10,
                                child: Text(
                                  "BMS Electric",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight / 30,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                    "La société BMS ELECTRIC s’est engagée depuis  2001 dans la fabrication des accessoires et de l’appareillage électrique. Son personnel, hautement qualifié, se distingue par sa rapidité d’exécution et sa capacité à satisfaire les différentes exigences de ces clients et leur fournir une gamme de produits variée. Après seulement quatre années d’activité, la société devient le leader du marché algérien et ses produits sont distribués dans plusieurs pays étrangers. Avec le projet d’extension, BMS prévoit la création d’une centaine de nouveaux postes d’emploi ainsi que plusieurs autres chaines de fabrication entrant dans le cadre de la redynamisation du potentiel productif. Les efforts de l’équipe dirigeante de BMS ont amené cette dernière au stade de ‘’société industrielle’’ aujourd’hui fleuron de l’économie nationale.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 9),
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
