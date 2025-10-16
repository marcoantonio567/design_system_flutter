import 'package:flutter/material.dart';
import 'DesignSystem/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import 'DesignSystem/Samples/bottomTabBarSampleScreen/bottom_tab_bar_sample_screen.dart';
import 'DesignSystem/Samples/cardSampleScreen/card_sample_screen.dart';
import 'DesignSystem/Samples/inputFieldSampleScreen/input_field_sample_screen.dart';
import 'DesignSystem/Samples/linkedLabelSampleScreen/linked_label_sample_screen.dart';
import 'DesignSystem/Samples/listSampleScreen/list_sample_screen.dart';
import 'DesignSystem/Samples/bannerSampleScreen/banner_sample_screen.dart';
import 'DesignSystem/Samples/tabComponentSampleScreen/tab_sample_screen.dart';
import 'DesignSystem/Components/NotificationInput/notification_sample_screen.dart';
import 'DesignSystem/shared/colors.dart';
import 'DesignSystem/shared/styles.dart';
import 'DesignSystem/shared/spacing.dart';
import 'DesignSystem/shared/navigation_helper.dart';
import 'DesignSystem/shared/scene_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: normalSecondaryBrandColor),
        useMaterial3: true,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headlineLarge: heading1Light,
          headlineMedium: heading2Light,
          headlineSmall: heading3Regular,
          titleLarge: heading4Regular,
          titleMedium: heading5Regular,
          bodyLarge: paragraph1Regular,
          bodyMedium: paragraph2Medium,
          labelLarge: label1Semibold,
          labelMedium: label2Semibold,
          labelSmall: label2Regular,
        ),
      ),
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
                  child: ListView(
                    children: [
                      _buildNavigationCard(
                        context,
                        'Action Button',
                        'Botões de ação personalizados',
                        Icons.touch_app,
                        ActionButtonPage(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Bottom Tab Bar',
                        'Barra de navegação inferior',
                        Icons.tab,
                        BottomTabBarPage(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Custom Cards',
                        'Cards personalizáveis e reutilizáveis',
                        Icons.credit_card,
                        CardSampleScreen(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Input Text Field',
                        'Campos de entrada de texto',
                        Icons.text_fields,
                        InputFieldPage(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Linked Label',
                        'Labels com links interativos',
                        Icons.link,
                        LinkedLabelPage(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Custom List',
                        'Listas personalizáveis e reutilizáveis',
                        Icons.list,
                        ListSampleScreen(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Custom Banner',
                        'Banners informativos e promocionais',
                        Icons.campaign,
                        BannerSampleScreen(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Tab Bar',
                        'Componente de abas',
                        Icons.tab_unselected,
                        TabPage(),
                      ),
                      const SizedBox(height: spaceMd),
                      _buildNavigationCard(
                        context,
                        'Notification Input',
                        'Configurações de notificações personalizáveis',
                        Icons.notifications_outlined,
                        NotificationSampleScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Widget destination,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusMd),
      ),
      child: InkWell(
        onTap: () => NavigationHelper.navigateTo(context, destination),
        borderRadius: BorderRadius.circular(radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(spaceMd),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(spaceSm),
                decoration: BoxDecoration(
                  color: normalSecondaryBrandColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(radiusSm),
                ),
                child: Icon(
                  icon,
                  color: normalSecondaryBrandColor,
                  size: iconSizeLg,
                ),
              ),
              const SizedBox(width: spaceMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: label1Semibold),
                    const SizedBox(height: spaceXs),
                    Text(
                      description,
                      style: paragraph2Medium.copyWith(
                        color: normalSecondaryBaseColorLight,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: normalSecondaryBaseColorLight,
                size: iconSizeSm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widgets de exemplo usando SceneWidget reutilizável
class Scene1 extends StatelessWidget {
  const Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 1',
      message:
          'Esta é uma demonstração do componente SceneWidget reutilizável.',
    );
  }
}

class Scene2 extends StatelessWidget {
  const Scene2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 2',
      message: 'Agora todas as scenes usam o mesmo componente base.',
    );
  }
}

class Scene3 extends StatelessWidget {
  const Scene3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 3',
      message: 'Isso elimina duplicação de código e facilita manutenção.',
    );
  }
}

class Scene4 extends StatelessWidget {
  const Scene4({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 4',
      message: 'Componentes reutilizáveis são a base de um bom Design System.',
    );
  }
}

class Scene5 extends StatelessWidget {
  const Scene5({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 5',
      message: 'Agora você pode personalizar facilmente cada scene.',
    );
  }
}
