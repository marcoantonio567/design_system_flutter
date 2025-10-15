import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import 'banner_theme.dart';
import 'banner_config.dart';

export 'banner_theme.dart';
export 'banner_config.dart';

class CustomBanner extends StatelessWidget {
  final String title;
  final String? subtitle;
  final BannerType type;
  final IconData? icon;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final bool showCloseButton;
  final VoidCallback? onDismiss;
  final Widget? customContent;

  const CustomBanner({
    super.key,
    required this.title,
    this.subtitle,
    required this.type,
    this.icon,
    this.actionText,
    this.onActionPressed,
    this.showCloseButton = false,
    this.onDismiss,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = BannerTheme.getTheme(type);
    
    return Container(
      margin: const EdgeInsets.only(bottom: spaceMd),
      decoration: _buildDecoration(theme),
      child: Padding(
        padding: BannerConfig.defaultPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIcon(theme),
            const SizedBox(width: spaceSm),
            Expanded(child: _buildContent(theme)),
            if (actionText != null && onActionPressed != null) ...[
              const SizedBox(width: spaceSm),
              _buildActionButton(theme),
            ],
            if (showCloseButton) ...[
              const SizedBox(width: spaceXs),
              _buildCloseButton(theme),
            ],
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(BannerTheme theme) {
    return BoxDecoration(
      color: theme.backgroundColor,
      border: Border.all(
        color: theme.borderColor,
        width: BannerConfig.defaultBorderWidth,
      ),
      borderRadius: BorderRadius.circular(BannerConfig.defaultBorderRadius),
    );
  }

  Widget _buildIcon(BannerTheme theme) {
    return Icon(
      icon ?? theme.defaultIcon,
      color: theme.iconColor,
      size: BannerConfig.iconSize,
    );
  }

  Widget _buildContent(BannerTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: label1Semibold.copyWith(color: theme.textColor),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: spaceXs),
          Text(
            subtitle!,
            style: paragraph2Medium.copyWith(color: theme.textColor),
          ),
        ],
        if (customContent != null) ...[
          const SizedBox(height: spaceXs),
          customContent!,
        ],
      ],
    );
  }

  Widget _buildActionButton(BannerTheme theme) {
    return SizedBox(
      height: BannerConfig.actionButtonHeight,
      child: TextButton(
        onPressed: onActionPressed,
        style: TextButton.styleFrom(
          foregroundColor: theme.iconColor,
          padding: const EdgeInsets.symmetric(horizontal: spaceSm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusXs),
            side: BorderSide(color: theme.iconColor),
          ),
        ),
        child: Text(
          actionText!,
          style: button3Semibold.copyWith(color: theme.iconColor),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BannerTheme theme) {
    return SizedBox(
      width: BannerConfig.closeButtonSize,
      height: BannerConfig.closeButtonSize,
      child: IconButton(
        onPressed: onDismiss,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          Icons.close,
          size: BannerConfig.closeButtonSize,
          color: theme.iconColor,
        ),
      ),
    );
  }
}

class PromotionalBanner extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final bool showCloseButton;
  final VoidCallback? onDismiss;
  final List<Color>? gradientColors;

  const PromotionalBanner({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onActionPressed,
    this.showCloseButton = false,
    this.onDismiss,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ?? _defaultGradientColors;
    
    return Container(
      margin: const EdgeInsets.only(bottom: spaceMd),
      decoration: _buildGradientDecoration(colors),
      child: Padding(
        padding: BannerConfig.defaultPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromotionalIcon(),
            const SizedBox(width: spaceSm),
            Expanded(child: _buildPromotionalContent()),
            if (actionText != null && onActionPressed != null) ...[
              const SizedBox(width: spaceSm),
              _buildPromotionalActionButton(),
            ],
            if (showCloseButton) ...[
              const SizedBox(width: spaceXs),
              _buildPromotionalCloseButton(),
            ],
          ],
        ),
      ),
    );
  }

  List<Color> get _defaultGradientColors => [
    normalSecondaryBrandColor,
    lightSecondaryBrandColor,
  ];

  BoxDecoration _buildGradientDecoration(List<Color> colors) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      ),
      borderRadius: BorderRadius.circular(BannerConfig.defaultBorderRadius),
      boxShadow: [
        BoxShadow(
          color: colors.first.withValues(alpha: 0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildPromotionalIcon() {
    return Icon(
      Icons.campaign_outlined,
      color: lightTertiaryBaseColorLight,
      size: BannerConfig.iconSize,
    );
  }

  Widget _buildPromotionalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: label1Semibold.copyWith(color: lightTertiaryBaseColorLight),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: spaceXs),
          Text(
            subtitle!,
            style: paragraph2Medium.copyWith(
              color: lightTertiaryBaseColorLight.withValues(alpha: 0.9),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPromotionalActionButton() {
    return SizedBox(
      height: BannerConfig.actionButtonHeight,
      child: ElevatedButton(
        onPressed: onActionPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: lightTertiaryBaseColorLight,
          foregroundColor: normalSecondaryBrandColor,
          padding: const EdgeInsets.symmetric(horizontal: spaceSm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusXs),
          ),
        ),
        child: Text(
          actionText!,
          style: button3Semibold.copyWith(color: normalSecondaryBrandColor),
        ),
      ),
    );
  }

  Widget _buildPromotionalCloseButton() {
    return SizedBox(
      width: BannerConfig.closeButtonSize,
      height: BannerConfig.closeButtonSize,
      child: IconButton(
        onPressed: onDismiss,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          Icons.close,
          size: BannerConfig.closeButtonSize,
          color: lightTertiaryBaseColorLight,
        ),
      ),
    );
  }
}