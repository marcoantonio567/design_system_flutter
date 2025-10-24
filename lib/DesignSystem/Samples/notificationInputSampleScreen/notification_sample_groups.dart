import 'package:flutter/material.dart';
import '../../Components/NotificationInput/notification_input.dart';
import '../../Components/NotificationInput/notification_config.dart';
import '../../Components/NotificationInput/notification_theme.dart';
import 'notification_sample_constants.dart';

/// Widget para o grupo de notificações Push
class PushNotificationGroup extends StatelessWidget {
  final Map<String, bool> notificationStates;
  final Function(String, bool) onNotificationChanged;

  const PushNotificationGroup({
    super.key,
    required this.notificationStates,
    required this.onNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationGroup(
      title: NotificationSampleConstants.pushNotificationsTitle,
      subtitle: NotificationSampleConstants.pushNotificationsSubtitle,
      children: [
        NotificationConfig.push(
          title: 'Notificações Gerais',
          subtitle: 'Receba atualizações importantes',
          initialValue: notificationStates['push_general']!,
          onChanged: (value) => onNotificationChanged('push_general', value),
        ),
        NotificationConfig.marketing(
          title: 'Marketing e Promoções',
          subtitle: 'Ofertas especiais e novidades',
          initialValue: notificationStates['push_marketing']!,
          onChanged: (value) => onNotificationChanged('push_marketing', value),
        ),
        NotificationConfig.security(
          title: 'Alertas de Segurança',
          subtitle: 'Notificações críticas de segurança',
          onChanged: (value) => onNotificationChanged('push_security', value),
        ),
        NotificationConfig.activity(
          title: 'Atividades',
          subtitle: 'Interações e atividades da conta',
          initialValue: notificationStates['push_activity']!,
          onChanged: (value) => onNotificationChanged('push_activity', value),
        ),
      ],
    );
  }
}

/// Widget para o grupo de notificações por Email
class EmailNotificationGroup extends StatelessWidget {
  final Map<String, bool> notificationStates;
  final Function(String, bool) onNotificationChanged;

  const EmailNotificationGroup({
    super.key,
    required this.notificationStates,
    required this.onNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationGroup(
      title: NotificationSampleConstants.emailNotificationsTitle,
      subtitle: NotificationSampleConstants.emailNotificationsSubtitle,
      children: [
        NotificationConfig.email(
          title: 'Newsletter',
          subtitle: 'Receba nossa newsletter semanal',
          initialValue: notificationStates['email_newsletter']!,
          onChanged: (value) => onNotificationChanged('email_newsletter', value),
        ),
        NotificationConfig.email(
          title: 'Atualizações de Produto',
          subtitle: 'Novidades e melhorias',
          initialValue: notificationStates['email_updates']!,
          onChanged: (value) => onNotificationChanged('email_updates', value),
        ),
        NotificationConfig.email(
          title: 'Alertas de Segurança',
          subtitle: 'Notificações importantes de segurança',
          initialValue: notificationStates['email_security']!,
          onChanged: (value) => onNotificationChanged('email_security', value),
        ),
        NotificationConfig.marketing(
          title: 'Promoções por Email',
          type: NotificationType.email,
          initialValue: notificationStates['email_marketing']!,
          onChanged: (value) => onNotificationChanged('email_marketing', value),
        ),
      ],
    );
  }
}

/// Widget para o grupo de notificações por SMS
class SMSNotificationGroup extends StatelessWidget {
  final Map<String, bool> notificationStates;
  final Function(String, bool) onNotificationChanged;

  const SMSNotificationGroup({
    super.key,
    required this.notificationStates,
    required this.onNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationGroup(
      title: NotificationSampleConstants.smsNotificationsTitle,
      subtitle: NotificationSampleConstants.smsNotificationsSubtitle,
      children: [
        NotificationConfig.sms(
          title: 'Alertas Críticos',
          subtitle: 'Apenas para situações urgentes',
          initialValue: notificationStates['sms_alerts']!,
          onChanged: (value) => onNotificationChanged('sms_alerts', value),
        ),
        NotificationConfig.security(
          title: 'Códigos de Verificação',
          type: NotificationType.sms,
          onChanged: (value) => onNotificationChanged('sms_security', value),
        ),
      ],
    );
  }
}

/// Widget para o grupo de notificações no App
class InAppNotificationGroup extends StatelessWidget {
  final Map<String, bool> notificationStates;
  final Function(String, bool) onNotificationChanged;

  const InAppNotificationGroup({
    super.key,
    required this.notificationStates,
    required this.onNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationGroup(
      title: NotificationSampleConstants.inAppNotificationsTitle,
      subtitle: NotificationSampleConstants.inAppNotificationsSubtitle,
      children: [
        NotificationConfig.inApp(
          title: 'Mensagens do Sistema',
          subtitle: 'Avisos e informações importantes',
          initialValue: notificationStates['inapp_messages']!,
          onChanged: (value) => onNotificationChanged('inapp_messages', value),
        ),
        NotificationConfig.inApp(
          title: 'Atualizações de Status',
          subtitle: 'Mudanças no status das suas atividades',
          initialValue: notificationStates['inapp_updates']!,
          onChanged: (value) => onNotificationChanged('inapp_updates', value),
        ),
        NotificationConfig.system(
          title: 'Notificações do Sistema',
          initialValue: notificationStates['inapp_system']!,
          onChanged: (value) => onNotificationChanged('inapp_system', value),
        ),
      ],
    );
  }
}