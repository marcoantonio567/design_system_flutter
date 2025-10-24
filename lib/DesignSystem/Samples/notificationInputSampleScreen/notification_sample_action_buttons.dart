import 'package:flutter/material.dart';
import '../../Components/NotificationInput/notification_theme.dart';
import '../../Shared/colors.dart';
import '../../Shared/spacing.dart';
import '../../Shared/styles.dart';
import 'notification_sample_constants.dart';

/// Widget dos botões de ação da tela de configurações de notificação
class NotificationSampleActionButtons extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onReset;

  const NotificationSampleActionButtons({
    super.key,
    required this.onSave,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSaveButton(),
        const SizedBox(height: spaceSm),
        _buildResetButton(),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: normalPrimaryBrandColor,
          foregroundColor: lightTertiaryBaseColorLight,
          padding: const EdgeInsets.symmetric(vertical: spaceMd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
        ),
        child: Text(
          NotificationSampleConstants.saveButtonText,
          style: button1Bold,
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onReset,
        style: OutlinedButton.styleFrom(
          foregroundColor: normalSecondaryBaseColorLight,
          side: const BorderSide(color: normalSecondaryBaseColorLight),
          padding: const EdgeInsets.symmetric(vertical: spaceMd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
        ),
        child: Text(
          NotificationSampleConstants.resetButtonText,
          style: button2Semibold,
        ),
      ),
    );
  }

  /// Método utilitário para mostrar mensagem de sucesso ao salvar
  static void showSaveSuccessMessage(BuildContext context) {
    final successTheme = NotificationTheme.getTheme(NotificationType.push);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          NotificationSampleConstants.saveSuccessMessage,
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

  /// Método utilitário para mostrar mensagem de sucesso ao resetar
  static void showResetSuccessMessage(BuildContext context) {
    final warningTheme = NotificationTheme.getTheme(NotificationType.email);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          NotificationSampleConstants.resetSuccessMessage,
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