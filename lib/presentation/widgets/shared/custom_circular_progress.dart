import 'package:flutter/material.dart';
import 'dart:math';

class CustomCircularProgress extends StatefulWidget {

  final Color? circleBackground;
  final Color? progressColor;
  final double percent;
  final double? strokeWidth;
  final String? text;
  final TextStyle? textStyle;

  const CustomCircularProgress({
    super.key, 
    required this.percent, 
    this.strokeWidth = 10,
    this.circleBackground, 
    this.progressColor, 
    this.text, 
    this.textStyle, 
  });

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> with SingleTickerProviderStateMixin {

  late AnimationController progressController;
  double oldPercent = 0;

  @override
  void initState() {
    progressController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    
    super.initState();
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    double diferenceToAnimate = widget.percent - oldPercent;
    double startPercent = oldPercent;

    oldPercent = widget.percent;
    progressController.forward(from: 0);
    
    return Stack(
      children: [
        AnimatedBuilder(
          animation: progressController, 
          builder: (context, child) {
            return Container(
              padding: EdgeInsets.all( widget.strokeWidth! * 0.5 ), //the half of the stroke paint
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _RadialProgress( 
                  percent: startPercent + (diferenceToAnimate * progressController.value),
                  backgroundColor: widget.circleBackground != null ? widget.circleBackground! : colorScheme.outlineVariant,
                  mainColor: widget.progressColor != null ? widget.progressColor! : colorScheme.primary,
                  strokeWidth: widget.strokeWidth!
                ),
              ),
            );
          },
        ),

        if( widget.text != null )
          Center(
            child: Text(widget.text!, style: widget.textStyle )
          ),
      ],
    );
  }
}

class _RadialProgress extends CustomPainter {

  final double percent;
  final Color backgroundColor;
  final Color mainColor;
  final double strokeWidth;

  _RadialProgress({
    required this.percent,
    required this.backgroundColor,
    required this.mainColor,
    required this.strokeWidth,
  });


  @override
  void paint(Canvas canvas, Size size) {

    final circlePaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;
    
    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, circlePaint);
    

    final arcPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = mainColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double arcAngle = (2 * pi) * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi * 0.5, 
      arcAngle, 
      false, 
      arcPaint
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}