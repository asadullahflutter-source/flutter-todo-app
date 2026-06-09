import 'package:flutter/material.dart';

import 'package:flutter_application_1/SignUp/Controller/Signupcontroller.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'dart:math' as math;

class Signupscreen extends GetView<Signupcontroller> {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Stack(
        children: [
          // Animated background orbs
          const _BackgroundOrbs(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  // Logo / brand mark
                  _BrandMark(),

                  const SizedBox(height: 48),

                  // Headline
                  const Text(
                    'Create\nAccount.',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                      letterSpacing: -1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign up to continue your journey',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Glass card form
                  _GlassCard(
                    child: Column(
                      children: [
                        _FloatingLabelField(
                          controller: controller.namecontroller,
                          label: 'Name',
                          icon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 20),
                        _FloatingLabelField(
                          controller: controller.usernamecontroller,
                          label: 'Username',
                          icon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 20),
                        _FloatingLabelField(
                          controller: controller.emailcontroller,
                          label: 'Email',
                          icon: Icons.alternate_email_rounded,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        _FloatingLabelField(
                          controller: controller.passwordcontroller,
                          label: 'Password',
                          icon: Icons.lock_outline_rounded,
                          obscureText: true,
                        ),
                        const SizedBox(height: 32),

                        // Login button
                        _GradientButton(
                          onPressed: () => controller.signup(
                            controller.namecontroller.text.trim(),
                            controller.usernamecontroller.text.trim(),
                            controller.emailcontroller.text.trim(),
                            controller.passwordcontroller.text.trim(),
                          ),
                          label: 'Sign up',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Divider row
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white.withOpacity(0.1),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white.withOpacity(0.1),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Sign up link
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/signin'),
                      child: RichText(
                        text: TextSpan(
                          text: " Have an account?  ",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 14,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: Color(0xFF7C6FFF),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF7C6FFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Info hint
                  Center(
                    child: Text(
                      'Uses your saved signup credentials from local storage.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.white.withOpacity(0.2),
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Brand Mark ────────────────────────────────────────────────
class _BrandMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xFF7C6FFF), Color(0xFFFF6FCF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C6FFF).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Icon(
        Icons.bolt_rounded,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}

// ── Glass Card ────────────────────────────────────────────────
class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(
              color: Colors.white.withOpacity(0.12),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

// ── Floating Label Field ──────────────────────────────────────
class _FloatingLabelField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;

  const _FloatingLabelField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  State<_FloatingLabelField> createState() => _FloatingLabelFieldState();
}

class _FloatingLabelFieldState extends State<_FloatingLabelField> {
  bool _obscure = true;
  bool _focused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() => _focused = _focusNode.hasFocus);
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _focused
              ? const Color(0xFF7C6FFF).withOpacity(0.8)
              : Colors.white.withOpacity(0.1),
          width: _focused ? 1.5 : 1,
        ),
        color: Colors.white.withOpacity(_focused ? 0.07 : 0.04),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText ? _obscure : false,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          letterSpacing: 0.3,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          border: InputBorder.none,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: _focused
                ? const Color(0xFF7C6FFF)
                : Colors.white.withOpacity(0.4),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            widget.icon,
            color: _focused
                ? const Color(0xFF7C6FFF)
                : Colors.white.withOpacity(0.3),
            size: 20,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.white.withOpacity(0.3),
                    size: 20,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
              : null,
        ),
        cursorColor: const Color(0xFF7C6FFF),
      ),
    );
  }
}

// ── Gradient Button ───────────────────────────────────────────
class _GradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;

  const _GradientButton({required this.onPressed, required this.label});

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFF7C6FFF), Color(0xFF5B4FE8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7C6FFF).withOpacity(0.4),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child:  Center(
            child: Text(
            widget.label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Animated Background Orbs ──────────────────────────────────
class _BackgroundOrbs extends StatefulWidget {
  const _BackgroundOrbs();

  @override
  State<_BackgroundOrbs> createState() => _BackgroundOrbsState();
}

class _BackgroundOrbsState extends State<_BackgroundOrbs>
    with TickerProviderStateMixin {
  late AnimationController _ctrl1;
  late AnimationController _ctrl2;
  late Animation<double> _anim1;
  late Animation<double> _anim2;

  @override
  void initState() {
    super.initState();
    _ctrl1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _ctrl2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 11),
    )..repeat(reverse: true);

    _anim1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl1, curve: Curves.easeInOut),
    );
    _anim2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl2, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl1.dispose();
    _ctrl2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: Listenable.merge([_anim1, _anim2]),
      builder: (context, _) {
        return Stack(
          children: [
            // Orb 1 — violet
            Positioned(
              top: -80 + 60 * math.sin(_anim1.value * math.pi),
              right: -60 + 40 * _anim1.value,
              child: _Orb(
                size: size.width * 0.75,
                color: const Color(0xFF7C6FFF).withOpacity(0.18),
              ),
            ),
            // Orb 2 — pink
            Positioned(
              bottom: size.height * 0.15 + 50 * _anim2.value,
              left: -80,
              child: _Orb(
                size: size.width * 0.65,
                color: const Color(0xFFFF6FCF).withOpacity(0.12),
              ),
            ),
            // Orb 3 — teal accent
            Positioned(
              bottom: -40,
              right: size.width * 0.1,
              child: _Orb(
                size: size.width * 0.45,
                color: const Color(0xFF44E5C4).withOpacity(0.08),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Orb extends StatelessWidget {
  final double size;
  final Color color;
  const _Orb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: const SizedBox.expand(),
      ),
    );
  }
}