import 'package:custome_line_loader/paint/line_painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomPainter(),
    );
  }
}

class CustomPainter extends StatefulWidget {
  const CustomPainter({super.key});

  @override
  State<CustomPainter> createState() => _CustomPainterState();
}

class _CustomPainterState extends State<CustomPainter>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Line Painter"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, child) {
            return CustomPaint(
              painter: LinePainter(progress: _animation.value),
              child: child,
            );
          },
          child: const SizedBox(
            height: 75,
            width: 200,
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
