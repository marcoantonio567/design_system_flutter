import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

enum CardType {
  primary,
  secondary,
  tertiary,
  gradient,
  outlined,
}

enum CardSize {
  small,
  medium,
  large,
}

class CustomCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? description;
  final IconData? icon;
  final Widget? customIcon;
  final VoidCallback? onTap;
  final CardType type;
  final CardSize size;
  final bool showShadow;
  final bool showBadge;
  final String? badgeText;
  final Widget? trailing;
  final Widget? customContent;

  const CustomCard({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.customIcon,
    this.onTap,
    this.type = CardType.primary,
    this.size = CardSize.medium,
    this.showShadow = true,
    this.showBadge = false,
    this.badgeText,
    this.trailing,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: showShadow ? _getElevation() : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        side: type == CardType.outlined
            ? BorderSide(
                color: normalSecondaryBrandColor.withValues(alpha: 0.3),
                width: borderWidthSm,
              )
            : BorderSide.none,
      ),
      child: Container(
        decoration: _getDecoration(),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          child: Padding(
            padding: EdgeInsets.all(_getPadding()),
            child: customContent ?? _buildDefaultContent(),
          ),
        ),
      ),
    );
  }

  double _getElevation() {
    switch (size) {
      case CardSize.small:
        return 2;
      case CardSize.medium:
        return 4;
      case CardSize.large:
        return 6;
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case CardSize.small:
        return radiusSm;
      case CardSize.medium:
        return radiusMd;
      case CardSize.large:
        return radiusLg;
    }
  }

  double _getPadding() {
    switch (size) {
      case CardSize.small:
        return spaceSm;
      case CardSize.medium:
        return spaceMd;
      case CardSize.large:
        return spaceLg;
    }
  }

  BoxDecoration _getDecoration() {
    switch (type) {
      case CardType.primary:
        return BoxDecoration(
          color: lightTertiaryBaseColorLight,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
      case CardType.secondary:
        return BoxDecoration(
          color: normalSecondaryBrandColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
      case CardType.tertiary:
        return BoxDecoration(
          color: normalTertiaryBrandColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
      case CardType.gradient:
        return BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              normalSecondaryBrandColor.withValues(alpha: 0.1),
              lightSecondaryBrandColor.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
      case CardType.outlined:
        return BoxDecoration(
          color: lightTertiaryBaseColorLight,
          borderRadius: BorderRadius.circular(_getBorderRadius()),
        );
    }
  }

  Widget _buildDefaultContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showBadge && badgeText != null) ...[
          _buildBadge(),
          SizedBox(height: _getContentSpacing()),
        ],
        Row(
          children: [
            if (icon != null || customIcon != null) ...[
              _buildIcon(),
              SizedBox(width: _getContentSpacing()),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) _buildTitle(),
                  if (subtitle != null) ...[
                    SizedBox(height: spaceXs),
                    _buildSubtitle(),
                  ],
                  if (description != null) ...[
                    SizedBox(height: spaceXs),
                    _buildDescription(),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              SizedBox(width: _getContentSpacing()),
              trailing!,
            ],
          ],
        ),
      ],
    );
  }

  double _getContentSpacing() {
    switch (size) {
      case CardSize.small:
        return spaceXs;
      case CardSize.medium:
        return spaceSm;
      case CardSize.large:
        return spaceMd;
    }
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spaceSm,
        vertical: spaceXs,
      ),
      decoration: BoxDecoration(
        color: normalSecondaryBrandColor,
        borderRadius: BorderRadius.circular(radiusXs),
      ),
      child: Text(
        badgeText!,
        style: _getBadgeTextStyle(),
      ),
    );
  }

  Widget _buildIcon() {
    final iconWidget = customIcon ??
        Icon(
          icon,
          color: _getIconColor(),
          size: _getIconSize(),
        );

    return Container(
      padding: EdgeInsets.all(_getIconPadding()),
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(),
        borderRadius: BorderRadius.circular(_getIconBorderRadius()),
      ),
      child: iconWidget,
    );
  }

  Widget _buildTitle() {
    return Text(
      title!,
      style: _getTitleStyle(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      subtitle!,
      style: _getSubtitleStyle(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription() {
    return Text(
      description!,
      style: _getDescriptionStyle(),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Métodos para estilos de texto
  TextStyle _getTitleStyle() {
    switch (size) {
      case CardSize.small:
        return label1Semibold;
      case CardSize.medium:
        return heading5Regular;
      case CardSize.large:
        return heading4Regular;
    }
  }

  TextStyle _getSubtitleStyle() {
    return paragraph2Medium.copyWith(
      color: normalSecondaryBrandColor,
    );
  }

  TextStyle _getDescriptionStyle() {
    return paragraph2Medium.copyWith(
      color: normalSecondaryBaseColorLight,
    );
  }

  TextStyle _getBadgeTextStyle() {
    return labelLinkSemibold.copyWith(
      color: lightTertiaryBaseColorLight,
      decoration: TextDecoration.none,
    );
  }

  // Métodos para ícones
  Color _getIconColor() {
    switch (type) {
      case CardType.primary:
      case CardType.outlined:
        return normalSecondaryBrandColor;
      case CardType.secondary:
        return normalSecondaryBrandColor;
      case CardType.tertiary:
        return normalTertiaryBrandColor;
      case CardType.gradient:
        return normalSecondaryBrandColor;
    }
  }

  Color _getIconBackgroundColor() {
    switch (type) {
      case CardType.primary:
      case CardType.outlined:
        return normalSecondaryBrandColor.withValues(alpha: 0.1);
      case CardType.secondary:
        return normalSecondaryBrandColor.withValues(alpha: 0.15);
      case CardType.tertiary:
        return normalTertiaryBrandColor.withValues(alpha: 0.15);
      case CardType.gradient:
        return lightTertiaryBaseColorLight.withValues(alpha: 0.8);
    }
  }

  double _getIconSize() {
    switch (size) {
      case CardSize.small:
        return iconSizeMd;
      case CardSize.medium:
        return iconSizeLg;
      case CardSize.large:
        return iconSizeXl;
    }
  }

  double _getIconPadding() {
    switch (size) {
      case CardSize.small:
        return spaceXs;
      case CardSize.medium:
        return spaceSm;
      case CardSize.large:
        return spaceMd;
    }
  }

  double _getIconBorderRadius() {
    switch (size) {
      case CardSize.small:
        return radiusXs;
      case CardSize.medium:
        return radiusSm;
      case CardSize.large:
        return radiusMd;
    }
  }
}