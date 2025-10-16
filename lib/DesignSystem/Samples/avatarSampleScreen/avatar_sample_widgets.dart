import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class SampleCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SampleCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: heading5Regular),
            const SizedBox(height: spaceMd),
            child,
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? description;

  const SectionHeader({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: heading3Regular.copyWith(color: lightTertiaryBaseColorLight),
        ),
        if (description != null) ...[
          const SizedBox(height: spaceXs),
          Text(
            description!,
            style: paragraph1Regular.copyWith(
              color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
            ),
          ),
        ],
      ],
    );
  }
}

class ControlSection extends StatelessWidget {
  final String label;
  final Widget child;

  const ControlSection({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: label1Semibold),
        const SizedBox(height: spaceXs),
        child,
      ],
    );
  }
}

class ChipSelector<T> extends StatelessWidget {
  final List<T> options;
  final T selectedValue;
  final String Function(T) labelBuilder;
  final Widget Function(T)? widgetBuilder;
  final ValueChanged<T> onChanged;

  const ChipSelector({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.labelBuilder,
    required this.onChanged,
    this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spaceXs,
      children: options.map((option) {
        return ChoiceChip(
          label: widgetBuilder != null 
              ? widgetBuilder!(option)
              : Text(labelBuilder(option)),
          selected: selectedValue == option,
          onSelected: (selected) {
            if (selected) {
              onChanged(option);
            }
          },
        );
      }).toList(),
    );
  }
}

class ExampleRow extends StatelessWidget {
  final String title;
  final List<Widget> avatars;

  const ExampleRow({
    super.key,
    required this.title,
    required this.avatars,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: label1Semibold),
        const SizedBox(height: spaceXs),
        Row(
          children: avatars
              .map((avatar) => Padding(
                    padding: const EdgeInsets.only(right: spaceSm),
                    child: avatar,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class ToggleControl extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleControl({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: label1Semibold),
        const SizedBox(width: spaceSm),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}