import 'package:flutter/material.dart';
import '../../Components/Radio/custom_radio.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class RadioSampleScreen extends StatefulWidget {
  const RadioSampleScreen({super.key});

  @override
  State<RadioSampleScreen> createState() => _RadioSampleScreenState();
}

class _RadioSampleScreenState extends State<RadioSampleScreen> {
  String? selectedPrimaryOption = 'option1';
  String? selectedSecondaryOption;
  String? selectedSuccessOption = 'success2';
  String? selectedErrorOption;
  String? selectedDisabledOption;
  
  String? selectedPaymentMethod;
  String? selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTertiaryBaseColorLight,
      appBar: AppBar(
        title: const Text('Radio Components'),
        backgroundColor: normalSecondaryBrandColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Estilos de Radio'),
            const SizedBox(height: spaceSm),
            _buildStylesSection(),
            
            const SizedBox(height: spaceLg),
            _buildSectionTitle('Estados'),
            const SizedBox(height: spaceSm),
            _buildStatesSection(),
            
            const SizedBox(height: spaceLg),
            _buildSectionTitle('Radio Group - Horizontal'),
            const SizedBox(height: spaceSm),
            _buildHorizontalGroupSection(),
            
            const SizedBox(height: spaceLg),
            _buildSectionTitle('Exemplo Prático - Método de Pagamento'),
            const SizedBox(height: spaceSm),
            _buildPracticalExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: heading5Regular.copyWith(
        color: normalPrimaryBaseColorLight,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildStylesSection() {
    return Container(
      padding: const EdgeInsets.all(spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomRadio<String>(
            value: 'option1',
            groupValue: selectedPrimaryOption,
            onChanged: (value) => setState(() => selectedPrimaryOption = value),
            label: 'Radio Primário',
            style: RadioStyle.primary,
          ),
          const SizedBox(height: spaceMd),
          CustomRadio<String>(
            value: 'option2',
            groupValue: selectedSecondaryOption,
            onChanged: (value) => setState(() => selectedSecondaryOption = value),
            label: 'Radio Secundário',
            style: RadioStyle.secondary,
          ),
          const SizedBox(height: spaceMd),
          CustomRadio<String>(
            value: 'success2',
            groupValue: selectedSuccessOption,
            onChanged: (value) => setState(() => selectedSuccessOption = value),
            label: 'Radio de Sucesso',
            style: RadioStyle.success,
          ),
          const SizedBox(height: spaceMd),
          CustomRadio<String>(
            value: 'error1',
            groupValue: selectedErrorOption,
            onChanged: (value) => setState(() => selectedErrorOption = value),
            label: 'Radio de Erro',
            style: RadioStyle.error,
          ),
        ],
      ),
    );
  }

  Widget _buildStatesSection() {
    return Container(
      padding: const EdgeInsets.all(spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const CustomRadio<String>(
            value: 'disabled1',
            groupValue: 'disabled1',
            onChanged: null,
            label: 'Radio Desabilitado (Selecionado)',
            enabled: false,
          ),
          const SizedBox(height: spaceMd),
          const CustomRadio<String>(
            value: 'disabled2',
            groupValue: 'disabled1',
            onChanged: null,
            label: 'Radio Desabilitado (Desmarcado)',
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalGroupSection() {
    return Container(
      padding: const EdgeInsets.all(spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecione o tema:',
            style: paragraph1Regular.copyWith(
              fontWeight: FontWeight.w600,
              color: normalPrimaryBaseColorLight,
            ),
          ),
          const SizedBox(height: spaceMd),
          CustomRadioGroup<String>(
            options: const [
              CustomRadioOption(value: 'light', label: 'Claro'),
              CustomRadioOption(value: 'dark', label: 'Escuro'),
              CustomRadioOption(value: 'auto', label: 'Automático'),
            ],
            groupValue: selectedTheme,
            onChanged: (value) => setState(() => selectedTheme = value),
            direction: Axis.horizontal,
            style: RadioStyle.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildPracticalExample() {
    return Container(
      padding: const EdgeInsets.all(spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Método de Pagamento:',
            style: paragraph1Regular.copyWith(
              fontWeight: FontWeight.w600,
              color: normalPrimaryBaseColorLight,
            ),
          ),
          const SizedBox(height: spaceMd),
          CustomRadioGroup<String>(
             groupValue: selectedPaymentMethod,
             onChanged: (value) => setState(() => selectedPaymentMethod = value ?? ''),
             options: const [
               CustomRadioOption(value: 'credit', label: 'Cartão de Crédito'),
               CustomRadioOption(value: 'debit', label: 'Cartão de Débito'),
               CustomRadioOption(value: 'pix', label: 'PIX'),
               CustomRadioOption(value: 'boleto', label: 'Boleto Bancário'),
             ],
             direction: Axis.vertical,
             style: RadioStyle.primary,
           ),
          const SizedBox(height: spaceMd),
          if (selectedPaymentMethod != null && selectedPaymentMethod!.isNotEmpty) ...[
            const Divider(),
            const SizedBox(height: spaceSm),
            Container(
              padding: const EdgeInsets.all(spaceSm),
              decoration: BoxDecoration(
                color: lightSuccessSystemColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: normalSuccessSystemColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: normalSuccessSystemColor,
                    size: 20,
                  ),
                  const SizedBox(width: spaceSm),
                  Expanded(
                    child: Text(
                      'Método selecionado: ${_getPaymentMethodName(selectedPaymentMethod!)}',
                      style: paragraph2Medium.copyWith(
                        color: normalSuccessSystemColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _getPaymentMethodName(String method) {
    switch (method) {
      case 'credit':
        return 'Cartão de Crédito';
      case 'debit':
        return 'Cartão de Débito';
      case 'pix':
        return 'PIX';
      case 'boleto':
        return 'Boleto Bancário';
      default:
        return method;
    }
  }
}