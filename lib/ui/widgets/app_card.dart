import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 6,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.02),
            ),
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 30,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
