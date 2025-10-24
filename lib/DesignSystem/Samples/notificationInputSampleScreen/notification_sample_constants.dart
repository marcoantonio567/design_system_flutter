import '../../Components/NotificationInput/notification_theme.dart';

/// Constantes e configurações padrão para a tela de exemplo de notificações
class NotificationSampleConstants {
  // Estados padrão das notificações organizados por categoria
  static const Map<String, bool> defaultNotificationStates = {
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

  // Estados padrão das frequências
  static const Map<String, NotificationFrequency> defaultFrequencyStates = {
    'push_general': NotificationFrequency.instant,
    'email_newsletter': NotificationFrequency.weekly,
    'email_updates': NotificationFrequency.daily,
    'inapp_messages': NotificationFrequency.instant,
  };

  // Textos da interface
  static const String screenTitle = 'Configurações de Notificação';
  static const String headerTitle = 'Personalize suas Notificações';
  static const String headerSubtitle = 'Configure como e quando você deseja receber notificações';
  static const String saveButtonText = 'Salvar Configurações';
  static const String resetButtonText = 'Restaurar Padrões';
  static const String saveSuccessMessage = 'Configurações salvas com sucesso!';
  static const String resetSuccessMessage = 'Configurações resetadas para os padrões!';

  // Títulos e subtítulos dos grupos
  static const String pushNotificationsTitle = 'Notificações Push';
  static const String pushNotificationsSubtitle = 'Receba notificações diretamente no seu dispositivo';
  
  static const String emailNotificationsTitle = 'Notificações por Email';
  static const String emailNotificationsSubtitle = 'Receba atualizações no seu email';
  
  static const String smsNotificationsTitle = 'Notificações por SMS';
  static const String smsNotificationsSubtitle = 'Receba alertas importantes via SMS';
  
  static const String inAppNotificationsTitle = 'Notificações no App';
  static const String inAppNotificationsSubtitle = 'Mensagens e atualizações dentro do aplicativo';

  /// Retorna uma cópia dos estados padrão das notificações
  static Map<String, bool> getDefaultNotificationStates() {
    return Map<String, bool>.from(defaultNotificationStates);
  }

  /// Retorna uma cópia dos estados padrão das frequências
  static Map<String, NotificationFrequency> getDefaultFrequencyStates() {
    return Map<String, NotificationFrequency>.from(defaultFrequencyStates);
  }

  /// Lógica para resetar estados para valores padrão
  static Map<String, bool> getResetNotificationStates() {
    final Map<String, bool> resetStates = {};
    
    for (String key in defaultNotificationStates.keys) {
      if (key.contains('security')) {
        resetStates[key] = true;
      } else if (key == 'push_general' || 
                 key == 'email_newsletter' || 
                 key == 'inapp_messages' ||
                 key == 'inapp_system') {
        resetStates[key] = true;
      } else {
        resetStates[key] = false;
      }
    }
    
    return resetStates;
  }

  /// Lógica para resetar frequências para valores padrão
  static Map<String, NotificationFrequency> getResetFrequencyStates() {
    final Map<String, NotificationFrequency> resetStates = {};
    
    for (String key in defaultFrequencyStates.keys) {
      resetStates[key] = NotificationFrequency.instant;
    }
    
    resetStates['email_newsletter'] = NotificationFrequency.weekly;
    
    return resetStates;
  }
}