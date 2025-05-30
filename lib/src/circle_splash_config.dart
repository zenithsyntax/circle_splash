import 'package:flutter/material.dart';
import 'circle_splash_animation_type.dart';

/// Configuration class for customizing the CircleSplash widget
class CircleSplashConfig {
  /// The type of animation to perform
  final CircleSplashAnimationType animationType;
  
  /// Duration of the circle expansion animation
  final Duration animationDuration;
  
  /// Duration of the fade-in animation for the content
  final Duration fadeDuration;
  
  /// Color of the expanding circle
  final Color circleColor;
  
  /// Background color of the splash screen
  final Color backgroundColor;
  
  /// Maximum radius the circle will expand to
  final double maxRadius;
  
  /// The curve used for the circle expansion animation
  final Curve animationCurve;
  
  /// The curve used for the fade-in animation
  final Curve fadeCurve;
  
  /// At what point in the animation the fade-in should start (0.0 to 1.0)
  final double fadeStartInterval;
  
  /// At what point in the animation the fade-in should end (0.0 to 1.0)
  final double fadeEndInterval;

  const CircleSplashConfig({
    this.animationType = CircleSplashAnimationType.center,
    this.animationDuration = const Duration(seconds: 3),
    this.fadeDuration = const Duration(milliseconds: 500),
    this.circleColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.maxRadius = 1200,
    this.animationCurve = Curves.easeInOut,
    this.fadeCurve = Curves.easeIn,
    this.fadeStartInterval = 0.5,
    this.fadeEndInterval = 1.0,
  }) : assert(fadeStartInterval >= 0.0 && fadeStartInterval <= 1.0),
       assert(fadeEndInterval >= 0.0 && fadeEndInterval <= 1.0),
       assert(fadeStartInterval <= fadeEndInterval);
}