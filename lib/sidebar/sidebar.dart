import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hackathon/data/database.dart';
import 'package:hackathon/data/models/exposant.dart';
import 'package:hackathon/data/models/stand.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
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
  late FloatingSearchBarController textSearchController = FloatingSearchBarController();
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


  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    late String searchMotif = "";

    return FloatingSearchBar(
      hint: 'Search...',
      controller: textSearchController,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) async {
        ///////////////////////////////////////////////////////////////////////
        /*
        final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final exposantDao = database.exposantDao;
        final exp = Exposant(
            10,
            "ETUSA",
            "L'Établissement public de transport urbain et suburbain d'Alger (connue sous l'acronyme ETUSA) est une entreprise publique, qui assure le service de transports en commun de surface dans la ville d'Alger et son agglomération.",
            "http://www.aotu-alger.dz/",
            "assets/etusa.png");
        await exposantDao.insertExposant(exp);
        */
        ///////////////////////////////////////////////////////////////////////
        // Call your model, bloc, controller here.
        searchMotif = '%'+textSearchController.query.toString()+'%';
        final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final exposantDao = database.exposantDao;
        final result = await exposantDao.findExposantByTitle(searchMotif);
        List<Exposant> allStands = result as List<Exposant>;

        print('\n+++++++++++++++++++++++++\n');
        //print(allStands[0].title);
        print('\n+++++++++++++++++++++++++\n');
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
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
                    child: buildFloatingSearchBar(),
                  ),
                ),
                Align(
                  alignment: Alignment(0, (-screenHeight / 5) / 100),
                  child: GestureDetector(
                    onTap: () {
                      onIconsPressed();
                      print(screenWidth);
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        height: screenWidth/10,
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
                  height: screenWidth / 20,
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
