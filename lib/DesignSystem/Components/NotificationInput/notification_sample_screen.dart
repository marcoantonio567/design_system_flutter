import 'package:flutter/material.dart';
import 'notification_input.dart';
import 'notification_config.dart';
import 'notification_theme.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class NotificationSampleScreen extends StatefulWidget {
  const NotificationSampleScreen({super.key});

  @override
  State<NotificationSampleScreen> createState() => _NotificationSampleScreenState();
}

class _NotificationSampleScreenState extends State<NotificationSampleScreen> {
  // Estados das notificações organizados por categoria
  final Map<String, bool> _notificationStates = {
    // Push Notifications
    'push_general': true,
    'push_marketing': false,
    'push_security': true,
    'push_activity': false,
    
    // Email Notifications
    'email_newsletter': true,
    'email_updates': false,
    'email_security': true,
    'email_marketing': false,
    
    // SMS Notifications
    'sms_alerts': false,
    'sms_security': true,
    
    // In-App Notifications
    'inapp_messages': true,
    'inapp_updates': true,
    'inapp_system': true,
  };

  // Estados das frequências
  final Map<String, NotificationFrequency> _frequencyStates = {
    'push_general': NotificationFrequency.instant,
    'email_newsletter': NotificationFrequency.weekly,
    'email_updates': NotificationFrequency.daily,
    'inapp_messages': NotificationFrequency.instant,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTertiaryBaseColorLight,
      appBar: AppBar(
        title: const Text('Configurações de Notificação'),
        backgroundColor: lightTertiaryBaseColorLight,
        elevation: 0,
        titleTextStyle: heading4Regular.copyWith(
          color: normalPrimaryBaseColorLight,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(
          color: normalPrimaryBaseColorLight,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: spaceLg),
            _buildPushNotifications(),
            const SizedBox(height: spaceMd),
            _buildEmailNotifications(),
            const SizedBox(height: spaceMd),
            _buildSMSNotifications(),
            const SizedBox(height: spaceMd),
            _buildInAppNotifications(),
            const SizedBox(height: spaceLg),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          Container(
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
          ),
          const SizedBox(width: spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalize suas Notificações',
                  style: heading5Regular.copyWith(
                    color: normalPrimaryBaseColorLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: spaceXs),
                Text(
                  'Configure como e quando você deseja receber notificações',
                  style: paragraph2Medium.copyWith(
                    color: normalSecondaryBaseColorLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPushNotifications() {
    return NotificationGroup(
      title: 'Notificações Push',
      subtitle: 'Receba notificações diretamente no seu dispositivo',
      children: [
        NotificationConfig.push(
          title: 'Notificações Gerais',
          subtitle: 'Receba atualizações importantes',
          initialValue: _notificationStates['push_general']!,
          onChanged: (value) => _updateNotificationState('push_general', value),
        ),
        NotificationConfig.marketing(
          title: 'Marketing e Promoções',
          subtitle: 'Ofertas especiais e novidades',
          initialValue: _notificationStates['push_marketing']!,
          onChanged: (value) => _updateNotificationState('push_marketing', value),
        ),
        NotificationConfig.security(
          title: 'Alertas de Segurança',
          subtitle: 'Notificações críticas de segurança',
          onChanged: (value) => _updateNotificationState('push_security', value),
        ),
        NotificationConfig.activity(
          title: 'Atividades',
          subtitle: 'Interações e atividades da conta',
          initialValue: _notificationStates['push_activity']!,
          onChanged: (value) => _updateNotificationState('push_activity', value),
        ),
      ],
    );
  }

  Widget _buildEmailNotifications() {
    return NotificationGroup(
      title: 'Notificações por Email',
      subtitle: 'Receba atualizações no seu email',
      children: [
        NotificationConfig.email(
          title: 'Newsletter',
          subtitle: 'Receba nossa newsletter semanal',
          initialValue: _notificationStates['email_newsletter']!,
          onChanged: (value) => _updateNotificationState('email_newsletter', value),
        ),
        NotificationConfig.email(
          title: 'Atualizações de Produto',
          subtitle: 'Novidades e melhorias',
          initialValue: _notificationStates['email_updates']!,
          onChanged: (value) => _updateNotificationState('email_updates', value),
        ),
        NotificationConfig.email(
          title: 'Alertas de Segurança',
          subtitle: 'Notificações importantes de segurança',
          initialValue: _notificationStates['email_security']!,
          onChanged: (value) => _updateNotificationState('email_security', value),
        ),
        NotificationConfig.marketing(
          title: 'Promoções por Email',
          type: NotificationType.email,
          initialValue: _notificationStates['email_marketing']!,
          onChanged: (value) => _updateNotificationState('email_marketing', value),
        ),
      ],
    );
  }

  Widget _buildSMSNotifications() {
    return NotificationGroup(
      title: 'Notificações por SMS',
      subtitle: 'Receba alertas importantes via SMS',
      children: [
        NotificationConfig.sms(
          title: 'Alertas Críticos',
          subtitle: 'Apenas para situações urgentes',
          initialValue: _notificationStates['sms_alerts']!,
          onChanged: (value) => _updateNotificationState('sms_alerts', value),
        ),
        NotificationConfig.security(
          title: 'Códigos de Verificação',
          type: NotificationType.sms,
          onChanged: (value) => _updateNotificationState('sms_security', value),
        ),
      ],
    );
  }

  Widget _buildInAppNotifications() {
    return NotificationGroup(
      title: 'Notificações no App',
      subtitle: 'Mensagens e atualizações dentro do aplicativo',
      children: [
        NotificationConfig.inApp(
          title: 'Mensagens do Sistema',
          subtitle: 'Avisos e informações importantes',
          initialValue: _notificationStates['inapp_messages']!,
          onChanged: (value) => _updateNotificationState('inapp_messages', value),
        ),
        NotificationConfig.inApp(
          title: 'Atualizações de Status',
          subtitle: 'Mudanças no status das suas atividades',
          initialValue: _notificationStates['inapp_updates']!,
          onChanged: (value) => _updateNotificationState('inapp_updates', value),
        ),
        NotificationConfig.system(
          title: 'Notificações do Sistema',
          initialValue: _notificationStates['inapp_system']!,
          onChanged: (value) => _updateNotificationState('inapp_system', value),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _saveSettings,
            style: ElevatedButton.styleFrom(
              backgroundColor: normalPrimaryBrandColor,
              foregroundColor: lightTertiaryBaseColorLight,
              padding: const EdgeInsets.symmetric(vertical: spaceMd),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusMd),
              ),
            ),
            child: Text(
              'Salvar Configurações',
              style: button1Bold,
            ),
          ),
        ),
        const SizedBox(height: spaceSm),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: _resetToDefaults,
            style: OutlinedButton.styleFrom(
              foregroundColor: normalSecondaryBaseColorLight,
              side: const BorderSide(color: normalSecondaryBaseColorLight),
              padding: const EdgeInsets.symmetric(vertical: spaceMd),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusMd),
              ),
            ),
            child: Text(
              'Restaurar Padrões',
              style: button2Semibold,
            ),
          ),
        ),
      ],
    );
  }

  void _updateNotificationState(String key, bool value) {
    setState(() {
      _notificationStates[key] = value;
    });
  }

  void _saveSettings() {
    // Aqui você implementaria a lógica para salvar as configurações
    final successTheme = NotificationTheme.getTheme(NotificationType.push);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Configurações salvas com sucesso!',
          style: label2Semibold.copyWith(
            color: lightTertiaryBaseColorLight,
          ),
        ),
        backgroundColor: successTheme.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
        ),
      ),
    );
  }

  void _resetToDefaults() {
    setState(() {
      // Resetar para valores padrão
      _notificationStates.updateAll((key, value) {
        if (key.contains('security')) {
          return true;
        }
        if (key == 'push_general' || 
            key == 'email_newsletter' || 
            key == 'inapp_messages' ||
            key == 'inapp_system') {
          return true;
        }
        return false;
      });
      
      _frequencyStates.updateAll((key, value) => NotificationFrequency.instant);
      _frequencyStates['email_newsletter'] = NotificationFrequency.weekly;
    });

    final warningTheme = NotificationTheme.getTheme(NotificationType.email);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Configurações resetadas para os padrões!',
          style: label2Semibold.copyWith(
            color: lightTertiaryBaseColorLight,
          ),
        ),
        backgroundColor: warningTheme.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
        ),
      ),
    );
  }
}