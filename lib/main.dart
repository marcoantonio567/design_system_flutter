import 'package:flutter/material.dart';
import 'DesignSystem/shared/theme.dart';
import 'DesignSystem/shared/colors.dart'; // Importação individual

// Ou usar o index para importar múltiplos widgets
import 'DesignSystem/shared/widgets/index.dart';
import 'DesignSystem/shared/styles.dart';
import 'DesignSystem/shared/spacing.dart';
import 'DesignSystem/shared/navigation_data.dart';
import 'DesignSystem/Components/NavigationCard/navigation_card.dart';
import 'DesignSystem/Samples/sceneSamples/scene_samples.dart';

// Exportando as classes Scene para manter compatibilidade
export 'DesignSystem/Samples/sceneSamples/scene_samples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Demo',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Design System Sample App',
          style: navbarSmallTitle.copyWith(color: lightTertiaryBaseColorLight),
        ),
        backgroundColor: normalSecondaryBrandColor,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              normalSecondaryBrandColor,
              lightSecondaryBrandColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: spaceLg),
                Text(
                  'Explore os Componentes',
                  style: heading4Regular.copyWith(
                    color: lightTertiaryBaseColorLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: spaceXs),
                Text(
                  'Navegue pelos exemplos do Design System',
                  style: paragraph1Regular.copyWith(
                    color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: space2xl),
                Expanded(
                  child: ListView.separated(
                    itemCount: NavigationData.items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: spaceMd),
                    itemBuilder: (context, index) {
                      final item = NavigationData.items[index];
                      return NavigationCard(
                        title: item.title,
                        description: item.description,
                        icon: item.icon,
                        destination: item.destination,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
