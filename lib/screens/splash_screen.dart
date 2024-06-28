import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mikki_music/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;
  

  @override
  void initState() {
    super.initState();
// animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

// rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

// radius animation -->from circle to square
    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //
    _controller.addListener(() {
      setState(() {});
    });

    // make animation go back and forth
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>const  HomeScreen()),
          );
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 0, color: const Color.fromARGB(0, 122, 10, 10)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 54, 15, 171),
            Color.fromARGB(255, 71, 46, 121)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              //biggest object
              Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  width: 225,
                  height: 225,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius:
                          BorderRadius.circular(_radiusAnimation.value)),
                ),
              ),
              //2nd object
              Transform.rotate(
                angle: _rotationAnimation.value + 0.2,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[500],
                      borderRadius:
                          BorderRadius.circular(_radiusAnimation.value)),
                ),
              ),const   Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.music_note, // Use FontAwesomeIcons for the music icon
                  size: 150.0,
                  color: Colors.white,
                ),
              ),
            ],  
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
