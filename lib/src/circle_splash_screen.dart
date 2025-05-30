import 'package:flutter/material.dart';
import 'circle_splash_animation_type.dart';
import 'circle_splash_config.dart';

/// A customizable circular splash screen widget with various animation options
class CircleSplashScreen extends StatefulWidget {
  /// The widget to display in the center of the splash screen
  /// Can be an Image, Text, Icon, or any other Widget
  final Widget child;
  
  /// Configuration for the splash screen appearance and behavior
  final CircleSplashConfig config;
  
  /// Callback function called when the animation completes
  final VoidCallback? onAnimationComplete;

  const CircleSplashScreen({
    super.key,
    required this.child,
    this.config = const CircleSplashConfig(),
    this.onAnimationComplete,
  });

  @override
  State<CircleSplashScreen> createState() => _CircleSplashScreenState();
}

class _CircleSplashScreenState extends State<CircleSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.config.animationDuration,
    );

    _circleAnimation = Tween<double>(
      begin: 0,
      end: widget.config.maxRadius,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.config.animationCurve,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          widget.config.fadeStartInterval,
          widget.config.fadeEndInterval,
          curve: widget.config.fadeCurve,
        ),
      ),
    );

    // Start the animation
    _controller.forward();

    // Add a listener to detect when the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.config.backgroundColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                _buildCircle(context),
                Positioned.fill(
                  child: Center(
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCircle(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final radius = _circleAnimation.value;

    switch (widget.config.animationType) {
      case CircleSplashAnimationType.center:
        return Positioned(
          left: screenWidth / 2 - radius,
          top: screenHeight / 2 - radius,
          right: screenWidth / 2 - radius,
          bottom: screenHeight / 2 - radius,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: widget.config.circleColor,
          ),
        );

      case CircleSplashAnimationType.topLeft:
        return Positioned(
          left: -radius,
          top: -radius,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: widget.config.circleColor,
          ),
        );

      case CircleSplashAnimationType.topRight:
        return Positioned(
          right: -radius,
          top: -radius,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: widget.config.circleColor,
          ),
        );

      case CircleSplashAnimationType.bottomLeft:
        return Positioned(
          left: -radius,
          bottom: -radius,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: widget.config.circleColor,
          ),
        );

      case CircleSplashAnimationType.bottomRight:
        return Positioned(
          right: -radius,
          bottom: -radius,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: widget.config.circleColor,
          ),
        );
    }
  }
}