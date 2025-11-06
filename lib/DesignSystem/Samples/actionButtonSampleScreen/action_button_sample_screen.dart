import 'package:flutter/material.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';



class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActionButton Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (_) {
            final styles = [
              ActionButtonStyle.primary,
              ActionButtonStyle.secondary,
              ActionButtonStyle.tertiary,
            ];

            final List<ActionButtonViewModel> models = [
              for (final style in styles) ...[
                ActionButtonViewModel(
                  size: ActionButtonSize.medium,
                  style: style,
                  text: 'Medium',
                  leftIcon: Icons.navigate_before,
                  rightIcon: Icons.navigate_next,
                  onPressed: () {},
                ),
                ActionButtonViewModel(
                  size: ActionButtonSize.medium,
                  style: style,
                  text: 'Medium',
                  rightIcon: Icons.navigate_next,
                  onPressed: () {},
                ),
                ActionButtonViewModel(
                  size: ActionButtonSize.small,
                  style: style,
                  text: 'Small',
                  leftIcon: Icons.navigate_before,
                  rightIcon: Icons.navigate_next,
                  onPressed: () {},
                ),
              ]
            ];

            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: models
                  .map((vm) => ActionButton.instantiate(viewModel: vm))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}