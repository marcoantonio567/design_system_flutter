import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import 'notification_sample_constants.dart';

/// Widget do header da tela de configurações de notificação
class NotificationSampleHeader extends StatelessWidget {
  const NotificationSampleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spaceMd),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            normalPrimaryBrandColor.withValues(alpha: 0.1),
            normalSecondaryBrandColor.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(radiusLg),
      ),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: spaceMd),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(spaceSm),
      decoration: BoxDecoration(
        color: normalPrimaryBrandColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radiusMd),
      ),
      child: const Icon(
        Icons.notifications_active_outlined,
        color: normalPrimaryBrandColor,
        size: iconSizeLg,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          NotificationSampleConstants.headerTitle,
          style: heading5Regular.copyWith(
            color: normalPrimaryBaseColorLight,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: spaceXs),
        Text(
          NotificationSampleConstants.headerSubtitle,
          style: paragraph2Medium.copyWith(
            color: normalSecondaryBaseColorLight,
          ),
        ),
      ],
    );
  }
}