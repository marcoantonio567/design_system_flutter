import 'package:flutter/material.dart';
import '../../Components/Checkbox/custom_checkbox.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class CheckboxSampleScreen extends StatefulWidget {
  const CheckboxSampleScreen({super.key});

  @override
  State<CheckboxSampleScreen> createState() => _CheckboxSampleScreenState();
}

class _CheckboxSampleScreenState extends State<CheckboxSampleScreen> {
  bool primaryCheckbox = false;
  bool secondaryCheckbox = true;
  bool successCheckbox = false;
  bool errorCheckbox = true;
  bool disabledCheckbox = false;
  
  List<String> selectedOptions = [];
  final List<String> availableOptions = [
    'Opção 1',
    'Opção 2', 
    'Opção 3',
    'Opção 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTertiaryBaseColorLight,
      appBar: AppBar(
        title: const Text('Checkbox Components'),
        backgroundColor: normalSecondaryBrandColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Estilos de Checkbox'),
            const SizedBox(height: spaceSm),
            _buildStylesSection(),
            
            const SizedBox(height: spaceLg),
            _buildSectionTitle('Estados'),
            const SizedBox(height: spaceSm),
            _buildStatesSection(),
            
            const SizedBox(height: spaceLg),
            _buildSectionTitle('Exemplo Prático - Seleção Múltipla'),
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
          CustomCheckbox(
            value: primaryCheckbox,
            onChanged: (value) => setState(() => primaryCheckbox = value ?? false),
            label: 'Checkbox Primário',
            style: CheckboxStyle.primary,
          ),
          const SizedBox(height: spaceMd),
          CustomCheckbox(
            value: secondaryCheckbox,
            onChanged: (value) => setState(() => secondaryCheckbox = value ?? false),
            label: 'Checkbox Secundário',
            style: CheckboxStyle.secondary,
          ),
          const SizedBox(height: spaceMd),
          CustomCheckbox(
            value: successCheckbox,
            onChanged: (value) => setState(() => successCheckbox = value ?? false),
            label: 'Checkbox de Sucesso',
            style: CheckboxStyle.success,
          ),
          const SizedBox(height: spaceMd),
          CustomCheckbox(
            value: errorCheckbox,
            onChanged: (value) => setState(() => errorCheckbox = value ?? false),
            label: 'Checkbox de Erro',
            style: CheckboxStyle.error,
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
          const CustomCheckbox(
            value: true,
            onChanged: null,
            label: 'Checkbox Desabilitado (Marcado)',
            enabled: false,
          ),
          const SizedBox(height: spaceMd),
          const CustomCheckbox(
            value: false,
            onChanged: null,
            label: 'Checkbox Desabilitado (Desmarcado)',
            enabled: false,
          ),
          const SizedBox(height: spaceMd),
          CustomCheckbox(
            value: true,
            onChanged: (value) {},
            label: 'Checkbox sem Label',
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
            'Selecione suas preferências:',
            style: paragraph1Regular.copyWith(
              fontWeight: FontWeight.w600,
              color: normalPrimaryBaseColorLight,
            ),
          ),
          const SizedBox(height: spaceMd),
          ...availableOptions.map((option) {
            final isSelected = selectedOptions.contains(option);
            return Padding(
              padding: const EdgeInsets.only(bottom: spaceSm),
              child: CustomCheckbox(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      selectedOptions.add(option);
                    } else {
                      selectedOptions.remove(option);
                    }
                  });
                },
                label: option,
                style: CheckboxStyle.primary,
              ),
            );
          }),
          const SizedBox(height: spaceMd),
          if (selectedOptions.isNotEmpty) ...[
            const Divider(),
            const SizedBox(height: spaceSm),
            Text(
              'Selecionados: ${selectedOptions.join(', ')}',
              style: paragraph2Medium.copyWith(
                color: normalSecondaryBrandColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}