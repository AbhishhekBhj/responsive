import 'package:flutter/material.dart';

class CommonHelpers {
  static String initialsFromName(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0].isNotEmpty ? parts[0][0] : '';
    final first = parts[0].isNotEmpty ? parts[0][0] : '';
    final last = parts[parts.length - 1].isNotEmpty ? parts[parts.length - 1][0] : '';
    return (first + last).toUpperCase();
  }


  static double lineHeight({
  required double fontSize,
  required double figmaLineHeight,
}) {
  return figmaLineHeight / fontSize;
}


  static void navigateWithAnimation({
    required BuildContext context,
    required Widget page,
    Duration duration = const Duration(milliseconds: 100),
    RouteTransitionsBuilder? transitionsBuilder,
  }) {
    try {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) {
            final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
            final scale = Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            );
            return FadeTransition(
              opacity: fade,
              child: ScaleTransition(scale: scale, child: child),
            );
          },
          transitionDuration: duration,
        ),
      );
    } catch (e) {
      // Log the error for debugging
      print('Navigation error: $e');


      try {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Navigation failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      } catch (snackBarError) {
    
        print('Failed to show error message: $snackBarError');
      }
    }
  }


}