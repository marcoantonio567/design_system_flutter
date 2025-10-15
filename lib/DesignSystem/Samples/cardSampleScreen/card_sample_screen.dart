import 'package:flutter/material.dart';
import '../../Components/Card/custom_card.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class CardSamplePage extends StatelessWidget {
  const CardSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Cards',
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
          child: Padding(
            padding: const EdgeInsets.all(spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: spaceLg),
                Text(
                  'Componente de Cards',
                  style: heading4Regular.copyWith(
                    color: lightTertiaryBaseColorLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: spaceXs),
                Text(
                  'Diferentes tipos e tamanhos de cards personalizáveis',
                  style: paragraph1Regular.copyWith(
                    color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: space2xl),
                Expanded(
                  child: ListView(
                    children: [
                      // Seção: Tipos de Cards
                      _buildSectionTitle('Tipos de Cards'),
                      const SizedBox(height: spaceMd),
                      
                      // Card Primary
                      CustomCard(
                        title: 'Card Primary',
                        subtitle: 'Tipo padrão',
                        description: 'Este é um card do tipo primary com estilo padrão.',
                        icon: Icons.star,
                        type: CardType.primary,
                        onTap: () => _showSnackBar(context, 'Card Primary clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card Secondary
                      CustomCard(
                        title: 'Card Secondary',
                        subtitle: 'Com badge',
                        description: 'Card secondary com badge personalizado.',
                        icon: Icons.favorite,
                        type: CardType.secondary,
                        showBadge: true,
                        badgeText: 'NOVO',
                        trailing: const Icon(Icons.arrow_forward_ios, size: iconSizeSm),
                        onTap: () => _showSnackBar(context, 'Card Secondary clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card Tertiary
                      CustomCard(
                        title: 'Card Tertiary',
                        subtitle: 'Estilo terciário',
                        description: 'Card com cores terciárias do design system.',
                        icon: Icons.palette,
                        type: CardType.tertiary,
                        onTap: () => _showSnackBar(context, 'Card Tertiary clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card Gradient
                      CustomCard(
                        title: 'Card Gradient',
                        subtitle: 'Com gradiente',
                        description: 'Card com fundo gradiente suave.',
                        icon: Icons.gradient,
                        type: CardType.gradient,
                        onTap: () => _showSnackBar(context, 'Card Gradient clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card Outlined
                      CustomCard(
                        title: 'Card Outlined',
                        subtitle: 'Apenas borda',
                        description: 'Card com borda e fundo transparente.',
                        icon: Icons.border_style,
                        type: CardType.outlined,
                        onTap: () => _showSnackBar(context, 'Card Outlined clicado!'),
                      ),
                      
                      const SizedBox(height: space2xl),
                      
                      // Seção: Tamanhos de Cards
                      _buildSectionTitle('Tamanhos de Cards'),
                      const SizedBox(height: spaceMd),
                      
                      // Card Small
                      CustomCard(
                        title: 'Card Small',
                        subtitle: 'Tamanho pequeno',
                        icon: Icons.compress,
                        type: CardType.primary,
                        size: CardSize.small,
                        onTap: () => _showSnackBar(context, 'Card Small clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card Medium
                      CustomCard(
                        title: 'Card Medium',
                        subtitle: 'Tamanho médio',
                        description: 'Este é o tamanho padrão dos cards.',
                        icon: Icons.crop_din,
                        type: CardType.secondary,
                        size: CardSize.medium,
                        onTap: () => _showSnackBar(context, 'Card Medium clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card Large
                      CustomCard(
                        title: 'Card Large',
                        subtitle: 'Tamanho grande',
                        description: 'Card com tamanho grande para conteúdo mais extenso e detalhado.',
                        icon: Icons.fullscreen,
                        type: CardType.gradient,
                        size: CardSize.large,
                        showBadge: true,
                        badgeText: 'DESTAQUE',
                        onTap: () => _showSnackBar(context, 'Card Large clicado!'),
                      ),
                      
                      const SizedBox(height: space2xl),
                      
                      // Seção: Cards Especiais
                      _buildSectionTitle('Cards Especiais'),
                      const SizedBox(height: spaceMd),
                      
                      // Card sem sombra
                      CustomCard(
                        title: 'Card sem Sombra',
                        subtitle: 'Flat design',
                        description: 'Card sem elevação para design mais limpo.',
                        icon: Icons.layers_clear,
                        type: CardType.primary,
                        showShadow: false,
                        onTap: () => _showSnackBar(context, 'Card sem sombra clicado!'),
                      ),
                      const SizedBox(height: spaceMd),
                      
                      // Card com conteúdo customizado
                      CustomCard(
                        type: CardType.gradient,
                        size: CardSize.large,
                        customContent: _buildCustomContent(),
                        onTap: () => _showSnackBar(context, 'Card customizado clicado!'),
                      ),
                      
                      const SizedBox(height: spaceLg),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: heading5Regular.copyWith(
        color: lightTertiaryBaseColorLight,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildCustomContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(spaceSm),
              decoration: BoxDecoration(
                color: lightTertiaryBaseColorLight,
                borderRadius: BorderRadius.circular(radiusSm),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: normalSecondaryBrandColor,
                size: iconSizeLg,
              ),
            ),
            const SizedBox(width: spaceMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Customizado',
                    style: heading5Regular.copyWith(
                      color: normalPrimaryBaseColorLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: spaceXs),
                  Text(
                    'Conteúdo totalmente personalizado',
                    style: paragraph2Medium.copyWith(
                      color: normalSecondaryBaseColorLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: spaceMd),
        Container(
          padding: const EdgeInsets.all(spaceSm),
          decoration: BoxDecoration(
            color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(radiusSm),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('123', 'Visualizações'),
              _buildStatItem('45', 'Curtidas'),
              _buildStatItem('12', 'Comentários'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: heading5Regular.copyWith(
            color: normalSecondaryBrandColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: labelLinkSemibold.copyWith(
            color: normalSecondaryBaseColorLight,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: normalSecondaryBrandColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSm),
        ),
      ),
    );
  }
}