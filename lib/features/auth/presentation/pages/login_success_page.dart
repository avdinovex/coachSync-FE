import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coachsync/features/home/presentation/pages/home_page.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none, 
          children: [
            // 1. Dashed Path - Custom Painter
            const Positioned(
              top: 20,
              left: 0,
              right: 0,
              height: 120,
              child: CustomPaint(painter: _TopDashedPathPainter()),
            ),

            // 2. The Basket SVG 
            Positioned(
              top: 60,
              right: -60, // Hangs off the edge like your design
              child: SvgPicture.asset(
                'assets/svg_images/basket.svg',
                width: 250,
                height: 200,
                fit: BoxFit.contain,
                // Debugging: If the plugin works but path is wrong, 
                // this errorBuilder will show a red icon.
                errorBuilder: (context, error, stackTrace) => const Padding(
                  padding: EdgeInsets.only(right: 80),
                  child: Icon(Icons.warning, color: Colors.red, size: 60),
                ),
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),

            // 3. UI Content (Text & Button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 180),
                  Text(
                    'Its a basket!',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'You did it.',
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade600,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Successfully logged in',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Colors.black),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(email: email),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopDashedPathPainter extends CustomPainter {
  const _TopDashedPathPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(-20, 50);
    path.quadraticBezierTo(size.width * 0.45, 10, size.width * 0.82, 95);

    for (PathMetric measurePath in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < measurePath.length) {
        canvas.drawPath(measurePath.extractPath(distance, distance + 12), paint);
        distance += 24;
      }
    }
    
    // Arrow Head pointing toward the basket
    final arrow = Path();
    arrow.moveTo(size.width * 0.75, 85);
    arrow.lineTo(size.width * 0.82, 95);
    arrow.lineTo(size.width * 0.70, 102);
    canvas.drawPath(arrow, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}