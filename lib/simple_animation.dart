import 'package:flutter/material.dart';

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  _SimpleAnimationState createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation? sizeAnimation;
  Animation? colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.yellow).animate(_controller!);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(_controller!);
    _controller!.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Animation Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: sizeAnimation!.value,
              width: sizeAnimation!.value,
              color: colorAnimation!.value,
            ),
            const SizedBox(height: 100,),
            TextButton(onPressed: (){
              _controller!.repeat();
            }, child: const Text("Start animation")),
          ],
        ),
      ),
    );
  }
}
