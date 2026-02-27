
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_page.dart';
import 'package:coachsync/core/services/auth_service.dart';
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
  bool _obscurePassword = true;
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
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
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
      if (mounted) {
        setState(() {
           _error = e.toString().contains('Exception:') 
              ? e.toString().split('Exception:')[1].trim()
              : 'Login failed. Please check your credentials.';
        });
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use layout builder to make spacing responsive to screen height
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final h = constraints.maxHeight;
            
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Arc Decoration
                    SizedBox(height: h * 0.05), // Top spacing
                    const SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: CustomPaint(painter: _DashedArcPainter()),
                    ),
                    
                    SizedBox(height: h * 0.05),

                    // Title
                    Text(
                      'Login',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.0,
                      ),
                    ),

                    SizedBox(height: h * 0.08),

                    // Email Field
                    _buildLabel('Email'),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: Colors.white,
                      decoration: _inputDecoration(
                        hint: 'keithbrooks@gmail.com',
                      ),
                      validator: (value) => value!.isEmpty ? 'Enter email' : null,
                    ),

                    SizedBox(height: h * 0.04),

                    // Password Field
                    _buildLabel('Password'),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2, // Spacing for dots
                      ),
                      cursorColor: Colors.white,
                      decoration: _inputDecoration(
                        hint: '•••••••••••••',
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                            size: 20,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Enter password' : null,
                    ),

                    // Error Message
                    if (_error != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          _error!,
                          style: const TextStyle(color: Colors.redAccent, fontSize: 13),
                        ),
                      ),

                    SizedBox(height: h * 0.05),

                    // Login Button (Right Aligned)
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: _loading ? null : _login,
                        child: _loading 
                          ? const SizedBox(
                              width: 24, 
                              height: 24, 
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Login',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.play_arrow, color: Colors.white, size: 24)
                              ],
                            ),
                      ),
                    ),

                    SizedBox(height: h * 0.12),

                    // Footer Section (Social + Sign Up)
                    Text(
                      'Or login via',
                      style: GoogleFonts.inter(
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _SocialButton(
                          icon: Icons.facebook,
                          onTap: () {},
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          assetIcon: 'G', 
                          isText: true,
                          onTap: _handleGoogleSignIn,
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          icon: Icons.apple,
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: h * 0.08),

                    // Sign Up Link
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: GoogleFonts.inter(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SignUpPage()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
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
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.grey[400],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(color: Colors.grey[700], fontSize: 18),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.5),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData? icon;
  final String? assetIcon;
  final bool isText;
  final VoidCallback onTap;

  const _SocialButton({
    this.icon,
    this.assetIcon,
    this.isText = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: isText
            ? Text(
                assetIcon!,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Icon(icon, color: Colors.black, size: 28),
        ),
      ),
    );
  }
}

class _DashedArcPainter extends CustomPainter {
  const _DashedArcPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Create a gentle arc
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2, 
      0, 
      size.width, 
      size.height
    );


    
    // Approximate path metrics
    for (var i = 0; i < 10; i++) {
        // This is a simplified visual representation
        // For production dashed paths, use PathMetric
    }
    
    // Drawing a simple arc with dashes
     const int dashCount = 8;
     const double startAngle = 3.4; // Approximated for visual
     const double sweepAngle = 2.6;
     
     final rect = Rect.fromCircle(
       center: Offset(size.width / 2, size.height * 4), 
       radius: size.width * 1.5
     );

     for(int i = 0; i < dashCount; i++) {
        double start = startAngle + (sweepAngle / dashCount) * i;
        double seg = (sweepAngle / dashCount) * 0.6;
        canvas.drawArc(rect, -start, -seg, false, paint);
     }

     // Draw arrows roughly at edges
     _drawArrow(canvas, Offset(20, size.height - 5), true);
     _drawArrow(canvas, Offset(size.width - 20, size.height - 5), false);
  }
  
  void _drawArrow(Canvas canvas, Offset pos, bool left) {
      final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
      
      final dx = left ? 6.0 : -6.0;
      canvas.drawLine(pos, Offset(pos.dx + dx, pos.dy - 4), paint);
      canvas.drawLine(pos, Offset(pos.dx + dx, pos.dy + 4), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
