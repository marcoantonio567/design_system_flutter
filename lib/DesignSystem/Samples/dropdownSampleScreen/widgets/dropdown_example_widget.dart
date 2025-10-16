import 'package:flutter/material.dart';
import '../../../Components/Dropdown/custom_dropdown.dart';
import '../../../Components/Dropdown/dropdown_view_model.dart';
import '../../../shared/styles.dart';
import '../../../shared/spacing.dart';

class DropdownExampleWidget extends StatelessWidget {
  final String title;
  final String description;
  final DropdownViewModel<String> viewModel;

  const DropdownExampleWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: subtitle1Regular,
        ),
        const SizedBox(height: spaceSm),
        Text(
          description,
          style: paragraph2Regular,
        ),
        const SizedBox(height: spaceMd),
        CustomDropdown.instantiate<String>(
          viewModel: viewModel,
        ),
        const SizedBox(height: spaceXl),
      ],
    );
  }
}