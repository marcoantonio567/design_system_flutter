import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import '../../shared/navigation_helper.dart';

class NavigationCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Widget destination;

  const NavigationCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
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