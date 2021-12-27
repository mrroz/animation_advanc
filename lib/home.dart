
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

 late AnimationController animeCont ;
 late Animation anime ;

 @override
  void initState() {
   animeCont = AnimationController(vsync: this,duration: Duration(milliseconds: 150));
   anime = Tween(begin: 0.0,end: 100.0).animate(CurvedAnimation(parent: animeCont, curve: Curves.bounceIn));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animeCont,
                builder: (context, child) {
                  return CircleAvatar(
                    radius: anime.value,
                    backgroundColor: Colors.blue,
                  );
                },),
            ElevatedButton(onPressed: (){


              if(animeCont.isCompleted){
                animeCont.reverse();
              }
              else{
                animeCont.forward();
              }

            }, child: Text('ok')),
          ],
        ),
      ),
    );
  }
}








void yel(String msg) {
  print('\x1B[33m$msg\x1B[0m');
}

void bl(String msg) {
  print('\x1B[34m$msg\x1B[0m');
}

// var pos = context.isLandscape?'Landscape':'Portrait';
// var wi_for_elements  = context.isPortrait? Get.width:Get.height;
// var wi_total = context.isPortrait? Get.width:Get.height;