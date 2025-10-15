import 'package:flutter/material.dart';
import '../../Components/List/custom_list.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import '../../shared/scene_widget.dart';

class ListSampleScreen extends StatelessWidget {
  const ListSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista Personalizada',
          style: navbarSmallTitle.copyWith(color: lightTertiaryBaseColorLight),
        ),
        backgroundColor: normalSecondaryBrandColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: lightTertiaryBaseColorLight),
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: spaceLg),
                  Text(
                    'Componente de Lista',
                    style: heading4Regular.copyWith(
                      color: lightTertiaryBaseColorLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: spaceXs),
                  Text(
                    'Listas personalizáveis e reutilizáveis',
                    style: paragraph1Regular.copyWith(
                      color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: space2xl),
                  
                  // Lista com Card
                  Text(
                    'Lista com Card',
                    style: label1Semibold.copyWith(
                      color: lightTertiaryBaseColorLight,
                    ),
                  ),
                  const SizedBox(height: spaceMd),
                  CustomList(
                    items: [
                      CustomListItem(
                        title: 'Configurações',
                        subtitle: 'Personalize sua experiência',
                        leadingIcon: Icons.settings,
                        onTap: () => _showSnackBar(context, 'Configurações'),
                      ),
                      CustomListItem(
                        title: 'Perfil',
                        subtitle: 'Gerencie suas informações',
                        leadingIcon: Icons.person,
                        iconColor: normalTertiaryBrandColor,
                        onTap: () => _showSnackBar(context, 'Perfil'),
                      ),
                      CustomListItem(
                        title: 'Notificações',
                        subtitle: 'Configure alertas e lembretes',
                        leadingIcon: Icons.notifications,
                        iconColor: normalSuccessSystemColor,
                        onTap: () => _showSnackBar(context, 'Notificações'),
                      ),
                      CustomListItem(
                        title: 'Ajuda',
                        subtitle: 'Suporte e documentação',
                        leadingIcon: Icons.help,
                        iconColor: lightTertiaryBrandColor,
                        onTap: () => _showSnackBar(context, 'Ajuda'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: space2xl),
                  
                  // Lista Simples
                  Text(
                    'Lista Simples',
                    style: label1Semibold.copyWith(
                      color: lightTertiaryBaseColorLight,
                    ),
                  ),
                  const SizedBox(height: spaceMd),
                  Container(
                    decoration: BoxDecoration(
                      color: lightTertiaryBaseColorLight,
                      borderRadius: BorderRadius.circular(radiusMd),
                    ),
                    child: SimpleCustomList(
                      padding: const EdgeInsets.all(spaceMd),
                      items: [
                        CustomListItem(
                          title: 'Favoritos',
                          leadingIcon: Icons.favorite,
                          iconColor: normalErrorSystemColor,
                          onTap: () => _showSnackBar(context, 'Favoritos'),
                        ),
                        CustomListItem(
                          title: 'Downloads',
                          leadingIcon: Icons.download,
                          onTap: () => _showSnackBar(context, 'Downloads'),
                        ),
                        CustomListItem(
                          title: 'Histórico',
                          leadingIcon: Icons.history,
                          iconColor: normalSecondaryBaseColorLight,
                          onTap: () => _showSnackBar(context, 'Histórico'),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: space2xl),
                  
                  // Lista sem ícones trailing
                  Text(
                    'Lista sem Setas',
                    style: label1Semibold.copyWith(
                      color: lightTertiaryBaseColorLight,
                    ),
                  ),
                  const SizedBox(height: spaceMd),
                  CustomList(
                    items: [
                      CustomListItem(
                        title: 'Versão do App',
                        subtitle: '1.0.0',
                        leadingIcon: Icons.info,
                        trailingIcon: null,
                      ),
                      CustomListItem(
                        title: 'Desenvolvido por',
                        subtitle: 'Equipe de Design System',
                        leadingIcon: Icons.code,
                        trailingIcon: null,
                        iconColor: normalTertiaryBrandColor,
                      ),
                      CustomListItem(
                        title: 'Licença',
                        subtitle: 'MIT License',
                        leadingIcon: Icons.description,
                        trailingIcon: null,
                        iconColor: normalSuccessSystemColor,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: space2xl),
                  
                  // Lista apenas com títulos
                  Text(
                    'Lista Minimalista',
                    style: label1Semibold.copyWith(
                      color: lightTertiaryBaseColorLight,
                    ),
                  ),
                  const SizedBox(height: spaceMd),
                  Container(
                    decoration: BoxDecoration(
                      color: lightTertiaryBaseColorLight,
                      borderRadius: BorderRadius.circular(radiusMd),
                    ),
                    child: SimpleCustomList(
                      padding: const EdgeInsets.all(spaceMd),
                      items: [
                        CustomListItem(
                          title: 'Termos de Uso',
                          onTap: () => _showSnackBar(context, 'Termos de Uso'),
                        ),
                        CustomListItem(
                          title: 'Política de Privacidade',
                          onTap: () => _showSnackBar(context, 'Política de Privacidade'),
                        ),
                        CustomListItem(
                          title: 'Sobre',
                          onTap: () => _showSnackBar(context, 'Sobre'),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: space2xl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message selecionado'),
        backgroundColor: normalSecondaryBrandColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSm),
        ),
      ),
    );
  }
}