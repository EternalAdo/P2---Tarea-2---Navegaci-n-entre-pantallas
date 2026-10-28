
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HobbyCard extends StatelessWidget {
  final String texto;

  const HobbyCard({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        color: AppColors.secondary.withValues(alpha: 0.12),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
