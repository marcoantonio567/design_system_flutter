import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: heading5Regular.copyWith(
        color: lightTertiaryBaseColorLight,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}