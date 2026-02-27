import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final interTheme = Theme.of(context).copyWith(
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Theme(
          data: interTheme,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(height: 14),
                const SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomPaint(painter: _TopDashedArcPainter()),
                ),
                const SizedBox(height: 22),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg_images/basket.svg',
                          height: 330,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 88,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.2),
                                blurRadius: 16,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'CoachSync',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    iconAlignment: IconAlignment.end,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey.shade400,
                      padding: EdgeInsets.zero,
                    ),
                    label: Text(
                      'Get Started',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopDashedArcPainter extends CustomPainter {
  const _TopDashedArcPainter();

  Offset _pointOnEllipse(Rect rect, double angle) {
    return Offset(
      rect.center.dx + rect.width / 2 * math.cos(angle),
      rect.center.dy + rect.height / 2 * math.sin(angle),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final arcRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height + 30),
      width: size.width + 44,
      height: 100,
    );

    const start = math.pi;
    const sweep = math.pi;
    const dashCount = 8;
    const gapSweep = 0.16;
    final dashSweep = (sweep - (gapSweep * (dashCount - 1))) / dashCount;

    for (var index = 0; index < dashCount; index++) {
      final segmentStart = start + index * (dashSweep + gapSweep);
      canvas.drawArc(arcRect, segmentStart, dashSweep, false, paint);
    }

    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: '➜',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    )..layout();

    final leftArrowAngle = start + (dashSweep + gapSweep) + (dashSweep / 2);
    final rightArrowAngle =
        start + sweep - (dashSweep + gapSweep) - (dashSweep / 2);

    final leftPoint = _pointOnEllipse(arcRect, leftArrowAngle);
    final rightPoint = _pointOnEllipse(arcRect, rightArrowAngle);

    iconPainter.paint(
      canvas,
      Offset(
        leftPoint.dx - iconPainter.width / 2,
        leftPoint.dy - iconPainter.height / 2,
      ),
    );
    iconPainter.paint(
      canvas,
      Offset(
        rightPoint.dx - iconPainter.width / 2,
        rightPoint.dy - iconPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
