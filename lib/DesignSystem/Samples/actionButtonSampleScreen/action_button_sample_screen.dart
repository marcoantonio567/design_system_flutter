import 'package:flutter/material.dart';
import '../../Components/Buttons/ActionButton/action_button.dart';
import '../../Components/Buttons/ActionButton/action_button_view_model.dart';



class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled Input Field Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.primary,
                        text: 'Medium',
                        leftIcon: Icons.navigate_before,
                        rightIcon: Icons.navigate_next,
                        onPressed: () {}
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.primary,
                        text: 'Medium',
                        onPressed: () {}
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.primary,
                        text: 'Small',
                        leftIcon: Icons.navigate_before,
                        rightIcon: Icons.navigate_next,
                        onPressed: () {}
                      )
                    ),
                  ],
                ),
                Column(
                  children: [
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.secondary,
                        text: 'Medium',
                        leftIcon: Icons.navigate_before,
                        rightIcon: Icons.navigate_next_outlined,
                        onPressed: () {}
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.secondary,
                        text: 'Medium',
                        rightIcon: Icons.navigate_next_outlined,
                        onPressed: () {}
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.secondary,
                        text: 'Small',
                        leftIcon: Icons.navigate_before,
                        rightIcon: Icons.navigate_next_outlined,
                        onPressed: () {}
                      )
                    ),
                  ],
                ),
                Column(
                  children: [
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.tertiary,
                        text: 'Medium',
                        leftIcon: Icons.navigate_before,
                        rightIcon: Icons.navigate_next_outlined,
                        onPressed: () {}
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.medium,
                        style: ActionButtonStyle.tertiary,
                        text: 'Medium',
                        rightIcon: Icons.navigate_next_outlined,
                        onPressed: () {}
                      )
                    ),
                    const SizedBox(height: 10,),
                    ActionButton.instantiate(viewModel: 
                      ActionButtonViewModel(
                        size: ActionButtonSize.small,
                        style: ActionButtonStyle.tertiary,
                        leftIcon: Icons.navigate_before,
                        rightIcon: Icons.navigate_next_outlined,
                        text: 'Small',
                        onPressed: () {}
                      )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}