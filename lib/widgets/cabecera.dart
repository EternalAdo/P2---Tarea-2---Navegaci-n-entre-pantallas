import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Cabecera extends StatelessWidget {
  const Cabecera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: AppColors.background,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage('assets/images/Me2.png'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Soy Adonai estudiante de 2ºDAM y si no dejo el ciclo es un milagro.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}