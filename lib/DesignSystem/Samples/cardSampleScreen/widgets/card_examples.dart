import 'package:flutter/material.dart';
import '../../../Components/Card/custom_card.dart';
import '../../../Components/Card/card_types.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import '../../../shared/spacing.dart';

class CardTypeExamples extends StatelessWidget {
  final Function(BuildContext, String) onShowSnackBar;

  const CardTypeExamples({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'Card Primary',
          subtitle: 'Tipo padrão',
          description: 'Este é um card do tipo primary com estilo padrão.',
          icon: Icons.star,
          type: CardType.primary,
          onTap: () => onShowSnackBar(context, 'Card Primary clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Secondary',
          subtitle: 'Com badge',
          description: 'Card secondary com badge personalizado.',
          icon: Icons.favorite,
          type: CardType.secondary,
          badgeText: 'NOVO',
          trailing: const Icon(Icons.arrow_forward_ios, size: iconSizeSm),
          onTap: () => onShowSnackBar(context, 'Card Secondary clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Tertiary',
          subtitle: 'Estilo terciário',
          description: 'Card com cores terciárias do design system.',
          icon: Icons.palette,
          type: CardType.tertiary,
          onTap: () => onShowSnackBar(context, 'Card Tertiary clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Gradient',
          subtitle: 'Com gradiente',
          description: 'Card com fundo gradiente suave.',
          icon: Icons.gradient,
          type: CardType.gradient,
          onTap: () => onShowSnackBar(context, 'Card Gradient clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Outlined',
          subtitle: 'Apenas borda',
          description: 'Card com borda e fundo transparente.',
          icon: Icons.border_style,
          type: CardType.outlined,
          onTap: () => onShowSnackBar(context, 'Card Outlined clicado!'),
        ),
      ],
    );
  }
}

class CardSizeExamples extends StatelessWidget {
  final Function(BuildContext, String) onShowSnackBar;

  const CardSizeExamples({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'Card Small',
          subtitle: 'Tamanho pequeno',
          icon: Icons.compress,
          type: CardType.primary,
          size: CardSize.small,
          onTap: () => onShowSnackBar(context, 'Card Small clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Medium',
          subtitle: 'Tamanho médio',
          description: 'Este é o tamanho padrão dos cards.',
          icon: Icons.crop_din,
          type: CardType.secondary,
          size: CardSize.medium,
          onTap: () => onShowSnackBar(context, 'Card Medium clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          title: 'Card Large',
          subtitle: 'Tamanho grande',
          description: 'Card com tamanho grande para conteúdo mais extenso e detalhado.',
          icon: Icons.fullscreen,
          type: CardType.gradient,
          size: CardSize.large,
          badgeText: 'DESTAQUE',
          onTap: () => onShowSnackBar(context, 'Card Large clicado!'),
        ),
      ],
    );
  }
}

class CardSpecialExamples extends StatelessWidget {
  final Function(BuildContext, String) onShowSnackBar;

  const CardSpecialExamples({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          title: 'Card sem Sombra',
          subtitle: 'Flat design',
          description: 'Card sem elevação para design mais limpo.',
          icon: Icons.layers_clear,
          type: CardType.primary,
          hasShadow: false,
          onTap: () => onShowSnackBar(context, 'Card sem sombra clicado!'),
        ),
        const SizedBox(height: spaceMd),
        CustomCard(
          type: CardType.gradient,
          size: CardSize.large,
          customContent: CustomCardContent(),
          onTap: () => onShowSnackBar(context, 'Card customizado clicado!'),
        ),
      ],
    );
  }
}

class CustomCardContent extends StatelessWidget {
  const CustomCardContent({super.key});

  @override
  Widget build(BuildContext context) {
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
}