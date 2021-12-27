// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Air extends StatefulWidget {
  const Air({Key? key}) : super(key: key);

  @override
  _AirState createState() => _AirState();
}

class _AirState extends State<Air> with SingleTickerProviderStateMixin {
  bool play = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      upperBound: 0.5,
    );
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.initState();

    ///todo:end: 1.0
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            play = !play;
            _controller.forward();

            if(_controller.isCompleted){
              _controller.reverse();
            }
          });
        },
        child: play ? Text('back') : Text('go'),
      ),
    );
  }

  _body() {
    return Stack(
      children: [
        _line(),

        _airPlan(),

        _dot(700, 200, 3, Colors.red),

       // _cardInfo(175),
        _dot(900, 300, 2, Colors.green),

       // _cardInfo(280),
        _dot(1000, 400, 1, Colors.green),

      //  _cardInfo(378),
        _dot(1100, 500, 3, Colors.red),

      ],
    );
  }

  _line() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        color: Colors.white,
        width: 3,
        height: play ? 555 : 1,
      ),
    );
  }

  _dot(int i, double m, int index, Color color) {
    return Container(
      //color: Colors.red,
      margin: EdgeInsets.only(top: m),
      child: AnimatedAlign(
        alignment: play ? Alignment.topCenter : Alignment.bottomCenter,
        duration: Duration(milliseconds: i),
        child: AnimatedContainer(
          padding: EdgeInsets.all(5),
          width: play ? 35 : 0,
          height: play ? 35 : 0,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          duration: Duration(milliseconds: 500),
          child: Center(
              child: CircleAvatar(
            backgroundColor: color,
            child: Text(
              '$index',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          )),
        ),
      ),
    );
  }

  _airPlan() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: AnimatedAlign(
          alignment: play ? Alignment.topCenter : Alignment.bottomCenter,
          duration: Duration(milliseconds: 600),
          child: play
              ? RotationTransition(
                  turns: _animation,
                  child: const Icon(
                    Icons.airplanemode_active,
                    size: 100,
                    color: Colors.white,
                  ),
                )
              : Icon(
                  Icons.airplanemode_active,
                  color: Colors.white,
                  size: 100,
                )),
    );
  }

  _cardInfo(double top) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: top, right: 30),
        width: 160,
        height: 80,
        //color: Colors.white,
        child: Row(
          children: [
            Container(
              color: Colors.white,
              width: 15,
              height: 4,
            ),
            Container(
              width: 140,
              height: 70,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
