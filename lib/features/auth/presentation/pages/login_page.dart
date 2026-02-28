import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_page.dart';
import 'package:coachsync/core/services/auth_service.dart';
import 'login_success_page.dart';
import 'package:coachsync/core/services/google_auth_service.dart';
import 'package:coachsync/features/home/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String? _error;
  final _googleAuthService = GoogleAuthService();

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final account = await _googleAuthService.signInWithGoogle();
      if (account != null) {
        final auth = await account.authentication;
        final idToken = auth.idToken;
        if (idToken != null) {
          await AuthService.loginWithGoogle(idToken);
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(email: account.email),
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        // Clean up error messages for better UX
        String errorMsg = e.toString().replaceFirst('AuthException: ', '');
        if (errorMsg.contains('TimeoutException') ||
            errorMsg.contains('No stream event')) {
          errorMsg = 'Connection timeout. Please check your network.';
        } else if (errorMsg.contains('SocketException') ||
            errorMsg.contains('connection abort')) {
          errorMsg = 'Cannot connect to server. Is the backend running?';
        }
        _error = errorMsg;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await AuthService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(email: _emailController.text.trim()),
        ),
      );
    } catch (e) {
      setState(() {
        // Clean up error messages for better UX
        String errorMsg = e.toString().replaceFirst('AuthException: ', '');
        if (errorMsg.contains('TimeoutException') ||
            errorMsg.contains('No stream event')) {
          errorMsg = 'Connection timeout. Please check your network.';
        } else if (errorMsg.contains('SocketException') ||
            errorMsg.contains('connection abort')) {
          errorMsg = 'Cannot connect to server. Is the backend running?';
        }
        _error = errorMsg;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _underlinedDecoration({required String label, String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 13),
      labelStyle: GoogleFonts.inter(color: Colors.grey.shade300, fontSize: 14),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      filled: false,
      enabledBorder: BorderSide(
        color: Colors.grey.shade300,
        width: 1.2,
      ).toUnderlineInputBorder(),
      focusedBorder: const BorderSide(
        color: Colors.white,
        width: 1.4,
      ).toUnderlineInputBorder(),
      contentPadding: const EdgeInsets.only(top: 2, bottom: 6),
    );
  }

  Widget _socialCircle({required Widget child, VoidCallback? onPressed}) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(onPressed: onPressed, icon: child, splashRadius: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    final interTheme = Theme.of(context).copyWith(
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
    );
    final screenHeight = MediaQuery.sizeOf(context).height;
    final topPadding = math.min(44.0, math.max(24.0, screenHeight * 0.05));
    final titleGap = math.min(72.0, math.max(48.0, screenHeight * 0.09));
    final afterLoginGap = math.min(58.0, math.max(34.0, screenHeight * 0.075));
    final afterSocialGap = math.min(72.0, math.max(42.0, screenHeight * 0.1));

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Theme(
          data: interTheme,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: topPadding, bottom: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: CustomPaint(painter: _TopDashedArcPainter()),
                  ),
                  const SizedBox(height: 22),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 320),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.w700,
                                height: 0.95,
                              ),
                            ),
                            SizedBox(height: titleGap),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              cursorColor: Colors.white,
                              decoration: _underlinedDecoration(
                                label: 'Email',
                                hint: 'keithbrooks@gmail.com',
                              ),
                            ),
                            const SizedBox(height: 18),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              cursorColor: Colors.white,
                              decoration: _underlinedDecoration(
                                label: 'Password',
                                hint: '•••••••••••',
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (_error != null) ...[
                              Text(
                                _error!,
                                style: GoogleFonts.inter(
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            Align(
                              alignment: Alignment.centerRight,
                              child: _loading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : TextButton.icon(
                                      onPressed: _login,
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.grey.shade300,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0,
                                        ),
                                      ),
                                      iconAlignment: IconAlignment.end,
                                      label: Text(
                                        'Login',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.play_arrow_rounded,
                                        size: 17,
                                      ),
                                    ),
                            ),
                            SizedBox(height: afterLoginGap),
                            Text(
                              'Or login via',
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade400,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                _socialCircle(
                                  child: const Icon(
                                    Icons.facebook,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 8),
                                _socialCircle(
                                  child: Text(
                                    'G',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                    ),
                                  ),
                                  onPressed: _loading
                                      ? null
                                      : _handleGoogleSignIn,
                                ),
                                const SizedBox(width: 8),
                                _socialCircle(
                                  child: const Icon(
                                    Icons.apple,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: afterSocialGap),
                            Text(
                              'Dont have an account?',
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 2),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpPage(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on BorderSide {
  UnderlineInputBorder toUnderlineInputBorder() {
    return UnderlineInputBorder(borderSide: this);
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
      center: Offset(size.width / 2, size.height + 28),
      width: size.width + 30,
      height: 88,
    );

    const start = math.pi;
    const sweep = math.pi;
    const dashCount = 8;
    const gapSweep = 0.14;
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
          fontSize: 16,
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
        leftPoint.dy - iconPainter.height / 2 - 1,
      ),
    );
    iconPainter.paint(
      canvas,
      Offset(
        rightPoint.dx - iconPainter.width / 2,
        rightPoint.dy - iconPainter.height / 2 - 1,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
