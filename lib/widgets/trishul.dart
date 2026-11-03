import 'package:flutter/material.dart';

import '../theme.dart';

/// सुनहरा त्रिशूल (कोड से बना, किसी फ़ोटो की ज़रूरत नहीं)।
class TrishulPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.goldLight, AppColors.gold, AppColors.goldDark],
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final line = Paint()
      ..shader = shader
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    final fill = Paint()
      ..shader = shader
      ..style = PaintingStyle.fill;

    // बीच का दंड
    canvas.drawLine(Offset(w / 2, h * 0.28), Offset(w / 2, h * 0.98), line);

    // बीच का फल (भाले जैसा)
    final centre = Path()
      ..moveTo(w / 2, 0)
      ..lineTo(w / 2 + 10, h * 0.16)
      ..lineTo(w / 2, h * 0.30)
      ..lineTo(w / 2 - 10, h * 0.16)
      ..close();
    canvas.drawPath(centre, fill);

    // दोनों तरफ़ के मुड़े हुए फल
    final sides = Path()
      ..moveTo(w * 0.18, h * 0.10)
      ..lineTo(w * 0.18, h * 0.22)
      ..quadraticBezierTo(w * 0.18, h * 0.38, w / 2, h * 0.38)
      ..quadraticBezierTo(w * 0.82, h * 0.38, w * 0.82, h * 0.22)
      ..lineTo(w * 0.82, h * 0.10);
    canvas.drawPath(sides, line);

    // किनारों की नोक
    for (final x in [w * 0.18, w * 0.82]) {
      final tip = Path()
        ..moveTo(x, h * 0.02)
        ..lineTo(x + 7, h * 0.11)
        ..lineTo(x - 7, h * 0.11)
        ..close();
      canvas.drawPath(tip, fill);
    }

    // छोटी पट्टी
    canvas.drawLine(
      Offset(w * 0.40, h * 0.44),
      Offset(w * 0.60, h * 0.44),
      line,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Trishul extends StatelessWidget {
  final double height;
  const Trishul({super.key, this.height = 160});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height * 0.6,
      height: height,
      child: CustomPaint(painter: TrishulPainter()),
    );
  }
}
