import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme/app_colors.dart';
import 'widgets/app_drawer.dart';
import 'widgets/cabecera.dart';
import 'widgets/hobby_card.dart';
import 'widgets/repositorio_card.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const PortfolioScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Canarias Aventura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.background,
          error: AppColors.error,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}

// PANTALLA DE BIENVENIDA

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/teide.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.35),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned(
                      top: constraints.maxHeight * 0.12,
                      left: 24,
                      right: 24,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.landscape,
                            size: 80,
                            color: Colors.white,
                          ),
                          SizedBox(height: 16),
                          Text(
                            '¡Descubre la isla a tu ritmo!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Explora las islas y vive nuevas aventuras.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.72,
                      left: 24,
                      right: 24,
                      child: Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.go('/portfolio');
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Explorar'),
                          iconAlignment: IconAlignment.end,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// PORTFOLIO PERSONAL

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int opcionBody = 0;

  final List<String> hobbies = [
    'Salir a pasear con mi pareja y amigos',
    'Dormir',
    'Jugar TCG',
    'Aprender Japones',
    'Música variada',
    'Liberar consolas cuales empresas no merecen ni un euro',
    'Los videojuegos',
    'Escuchar Musica',
    'Ver anime',
    'Ver películas',
    'Pasar tiempo con mi pareja',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi portfolio'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const Cabecera(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: opcionBody == 0
                    ? _crearHobbies()
                    : const RepositorioCard(),
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.secondary.withValues(alpha: 0.15),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          opcionBody = 0;
                        });
                      },
                      child: const Text('Mis hobbies'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          opcionBody = 1;
                        });
                      },
                      child: const Text('Mi repositorio'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearHobbies() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Mis hobbies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    HobbyCard(texto: hobbies[0]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[1]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[2]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[3]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[6]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[7]),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    HobbyCard(texto: hobbies[8]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[4]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[5]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[9]),
                    const SizedBox(height: 10),
                    HobbyCard(texto: hobbies[10]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}