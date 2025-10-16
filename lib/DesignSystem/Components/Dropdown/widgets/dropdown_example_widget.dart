import 'package:flutter/material.dart';
import '../custom_dropdown.dart';
import '../dropdown_view_model.dart';
import '../../../Styles/styles.dart';

class DropdownExampleWidget extends StatelessWidget {
  final String title;
  final String description;
  final DropdownViewModel viewModel;

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
        const SizedBox(height: 8),
        Text(
          description,
          style: paragraph2Regular,
        ),
        const SizedBox(height: 16),
        CustomDropdown<String>(
          viewModel: viewModel,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}