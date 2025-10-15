import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/spacing.dart';
import 'card_types.dart';
import 'card_styles.dart';
import 'card_widgets.dart';

class CustomCard extends StatelessWidget {
  final CardType type;
  final CardSize size;
  final String? title;
  final String? subtitle;
  final String? description;
  final IconData? icon;
  final Widget? customIcon;
  final String? badgeText;
  final Widget? trailing;
  final Widget? customContent;
  final bool hasShadow;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    this.type = CardType.primary,
    this.size = CardSize.medium,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.customIcon,
    this.badgeText,
    this.trailing,
    this.customContent,
    this.hasShadow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = _buildIcon();
    final badgeWidget = _buildBadge();
    final contentWidget = _buildContent();
    
    return Card(
      elevation: hasShadow ? CardStyles.getElevation(size) : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CardStyles.getBorderRadius(size)),
        side: type == CardType.outlined
            ? BorderSide(
                color: normalSecondaryBrandColor.withValues(alpha: 0.3),
                width: borderWidthSm,
              )
            : BorderSide.none,
      ),
      child: Container(
        decoration: CardStyles.getDecoration(type, size),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(CardStyles.getBorderRadius(size)),
          child: Padding(
            padding: EdgeInsets.all(CardStyles.getPadding(size)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (badgeWidget != null) ...[
                  badgeWidget,
                  SizedBox(height: CardStyles.getContentSpacing(size)),
                ],
                Row(
                  children: [
                    if (iconWidget != null) ...[
                      iconWidget,
                      SizedBox(width: CardStyles.getContentSpacing(size)),
                    ],
                    Expanded(child: contentWidget),
                    if (trailing != null) ...[
                      SizedBox(width: CardStyles.getContentSpacing(size)),
                      trailing!,
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildIcon() {
    if (icon == null && customIcon == null) return null;
    
    return CardIcon(
      icon: icon,
      customIcon: customIcon,
      type: type,
      size: size,
    );
  }

  Widget? _buildBadge() {
    if (badgeText == null) return null;
    return CardBadge(text: badgeText!);
  }

  Widget _buildContent() {
    if (customContent != null) return customContent!;
    
    return CardContent(
      title: title,
      subtitle: subtitle,
      description: description,
      size: size,
    );
  }
}