import 'package:flutter/material.dart';

class MovingGradientText extends StatefulWidget {
  const MovingGradientText({super.key});

  @override
  _MovingGradientTextState createState() => _MovingGradientTextState();
}

class _MovingGradientTextState extends State<MovingGradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animationStart;
  late Animation<Alignment> _animationEnd;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animationStart = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);

    _animationEnd = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ShaderMask(
            shaderCallback:
                (bounds) => LinearGradient(
                  colors: [Colors.red, Colors.black],
                  begin: _animationStart.value,
                  end: _animationEnd.value,
                ).createShader(bounds),
            child: Text(
              "Featured car models",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
