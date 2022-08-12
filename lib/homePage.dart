
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late  AnimationController _controller;
   late Animation _animation;
  late AnimationStatus _animationStatus = AnimationStatus.dismissed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1),
    );
    _animation = Tween(
      end: 1.0,begin: 0.0
    ).animate(_controller)..addListener(() { setState((){});})
    ..addStatusListener((status) {_animationStatus=status; });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),centerTitle: true,
      ),
      body:Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(2, 2, 0.002)
            ..rotateX(3.14 * (_animation.value)),
          child: Container(
            color: Colors.blueAccent,
            width: 200,
            height: 200,
            child: Icon(
              Icons.accessibility_new,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          _controller.forward();
        },
      ),
    );

  }
}
