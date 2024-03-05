import 'package:flutter/material.dart';

class BackgroundWaves extends StatelessWidget {
  const BackgroundWaves({super.key});

  @override
  Widget build(BuildContext context) {
    
    final colorScheme = Theme.of(context).colorScheme;

    return  SizedBox(
      height: double.infinity,
      width:  double.infinity,

      child: CustomPaint(
        painter: _BackgroundWavesPainter(waveColor: colorScheme.onPrimaryContainer
        ),
      ),
    );
  }
}


class _BackgroundWavesPainter extends CustomPainter {

  final Color? waveColor;

  const _BackgroundWavesPainter({
    this.waveColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = waveColor!;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10.0;

    drawTopElement(canvas, size, paint);
    drawBottomElement(canvas, size, paint);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawTopElement( Canvas canvas, Size size, Paint paint ){
    
    final path = Path();

    path.lineTo( 0, size.height * 0.33 );
    // path.lineTo( size.width, size.height * 0.25 );
    // path.quadraticBezierTo(x1, y1, x2, y2)
    path.quadraticBezierTo(size.width * 0.12, size.height * 0.33, size.width * 0.15, size.height * 0.26);
    path.quadraticBezierTo(size.width * 0.18, size.height * 0.2, size.width * 0.54, size.height * 0.26);
    path.quadraticBezierTo(size.width * 1, size.height * 0.33, size.width * 0.82, size.height * 0.17);
    path.quadraticBezierTo(size.width * 0.74, size.height * 0.11, size.width * 0.8, size.height * 0.07);
    path.quadraticBezierTo(size.width * 0.89, size.height * 0.02, size.width * 0.89, 0);
    
    canvas.drawPath(path, paint);

  }

  void drawBottomElement( Canvas canvas, Size size, Paint paint ){

    final path = Path();
    path.moveTo( size.width, size.height );

    path.lineTo( size.width, size.height * 0.7 );
    path.quadraticBezierTo(size.width * 0.74, size.height * 0.74, size.width * 0.9, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.96, size.height * 0.99, size.width * 0.8, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.42, size.height * 0.82, size.width * 0.4, size.height);

    canvas.drawPath(path, paint);
  }

}