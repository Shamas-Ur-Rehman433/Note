import 'package:flutter/material.dart';
import 'dart:async';
import 'package:note/Note.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    Timer(Duration(seconds: 3), () {
      // Navigate to Note screen after 3 seconds
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Note()));
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[700],
      body: Center(
        child: ScaleTransition(
          scale: _animation, // Apply the scaling animation
          child: const Icon(
            Icons.event_note,
            size: 200,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
