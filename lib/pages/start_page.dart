import 'package:flutter/material.dart';
import 'package:hackathon/sidebar/sidebar_layout.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SideBarLayout()));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF040616), Color(0xFF030830)])),
            ),
            Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height ,
              alignment: Alignment.center,
              child: Image.asset('assets/techmolog.png',height: MediaQuery.of(context).size.height/1.5,width:MediaQuery.of(context).size.width/1.5 ,),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height ,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/qrcode.png',scale: 8,),

            )
          ],
        ),
      ),
    );
  }
}
