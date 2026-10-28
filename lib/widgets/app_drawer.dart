import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.landscape,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Canarias Aventura',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppColors.primary,
            ),
            title: const Text(
              'Inicio',
              style: TextStyle(color: AppColors.text),
            ),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: AppColors.primary,
            ),
            title: const Text(
              'Mi portfolio',
              style: TextStyle(color: AppColors.text),
            ),
            onTap: () {
              context.go('/portfolio');
            },
          ),
        ],
      ),
    );
  }
}