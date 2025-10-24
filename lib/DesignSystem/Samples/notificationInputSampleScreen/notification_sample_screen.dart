import 'package:flutter/material.dart';
import '../../Shared/colors.dart';
import '../../Shared/spacing.dart';
import 'notification_sample_constants.dart';
import 'notification_sample_header.dart';
import 'notification_sample_action_buttons.dart';
import 'notification_sample_groups.dart';

class NotificationSampleScreen extends StatefulWidget {
  const NotificationSampleScreen({super.key});

  @override
  State<NotificationSampleScreen> createState() =>
      _NotificationSampleScreenState();
}

class _NotificationSampleScreenState extends State<NotificationSampleScreen> {
  // Estados das notificações usando as constantes
  Map<String, bool> notificationStates = 
      NotificationSampleConstants.getDefaultNotificationStates();

  void _updateNotificationState(String key, bool value) {
    setState(() {
      notificationStates[key] = value;
    });
  }

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(NotificationSampleConstants.saveSuccessMessage),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _resetSettings() {
    setState(() {
      notificationStates = NotificationSampleConstants.getDefaultNotificationStates();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(NotificationSampleConstants.resetSuccessMessage),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTertiaryBaseColorLight,
      body: SafeArea(
        child: Column(
          children: [
            const NotificationSampleHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PushNotificationGroup(
                      notificationStates: notificationStates,
                      onNotificationChanged: _updateNotificationState,
                    ),
                    const SizedBox(height: spaceLg),
                    EmailNotificationGroup(
                      notificationStates: notificationStates,
                      onNotificationChanged: _updateNotificationState,
                    ),
                    const SizedBox(height: spaceLg),
                    SMSNotificationGroup(
                      notificationStates: notificationStates,
                      onNotificationChanged: _updateNotificationState,
                    ),
                    const SizedBox(height: spaceLg),
                    InAppNotificationGroup(
                      notificationStates: notificationStates,
                      onNotificationChanged: _updateNotificationState,
                    ),
                    const SizedBox(height: spaceXl),
                  ],
                ),
              ),
            ),
            NotificationSampleActionButtons(
              onSave: _saveSettings,
              onReset: _resetSettings,
            ),
          ],
        ),
      ),
    );
  }
}
