import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import '../../Components/Dropdown/dropdown_view_model.dart';
import 'widgets/dropdown_example_widget.dart';

class DropdownSampleScreen extends StatefulWidget {
  const DropdownSampleScreen({super.key});

  @override
  State<DropdownSampleScreen> createState() => _DropdownSampleScreenState();
}

class _DropdownSampleScreenState extends State<DropdownSampleScreen> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedCategory;

  final List<DropdownItem<String>> countries = [
    DropdownItem(value: 'br', label: 'Brasil', icon: const Icon(Icons.flag, size: 16)),
    DropdownItem(value: 'us', label: 'Estados Unidos', icon: const Icon(Icons.flag, size: 16)),
    DropdownItem(value: 'ca', label: 'Canadá', icon: const Icon(Icons.flag, size: 16)),
    DropdownItem(value: 'mx', label: 'México', icon: const Icon(Icons.flag, size: 16)),
  ];

  final List<DropdownItem<String>> cities = [
    DropdownItem(value: 'sp', label: 'São Paulo'),
    DropdownItem(value: 'rj', label: 'Rio de Janeiro'),
    DropdownItem(value: 'bh', label: 'Belo Horizonte'),
    DropdownItem(value: 'salvador', label: 'Salvador'),
  ];

  final List<DropdownItem<String>> categories = [
    DropdownItem(value: 'tech', label: 'Tecnologia', icon: const Icon(Icons.computer, size: 16)),
    DropdownItem(value: 'design', label: 'Design', icon: const Icon(Icons.palette, size: 16)),
    DropdownItem(value: 'business', label: 'Negócios', icon: const Icon(Icons.business, size: 16)),
    DropdownItem(value: 'education', label: 'Educação', icon: const Icon(Icons.school, size: 16)),
  ];

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dropdown Examples',
          style: navbarSmallTitle.copyWith(color: lightTertiaryBaseColorLight),
        ),
        backgroundColor: normalSecondaryBrandColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: lightTertiaryBaseColorLight),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              normalSecondaryBrandColor,
              lightSecondaryBrandColor,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: spaceXl),
                Text(
                  'Componente Dropdown',
                  style: heading4Regular.copyWith(
                    color: lightTertiaryBaseColorLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spaceSm),
                Text(
                  'Exemplos de uso do componente Dropdown',
                  style: paragraph1Regular.copyWith(
                    color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spaceXl),
                
                DropdownExampleWidget(
                  title: 'Dropdown Básico',
                  description: 'Dropdown simples sem ícones',
                  viewModel: DropdownViewModel<String>(
                    items: cities,
                    selectedValue: selectedCity,
                    placeholder: 'Selecione uma cidade',
                    onChanged: (value) => setState(() => selectedCity = value),
                  ),
                ),
                
                DropdownExampleWidget(
                  title: 'Dropdown com Ícones',
                  description: 'Dropdown com ícones nos itens',
                  viewModel: DropdownViewModel<String>(
                    items: countries,
                    selectedValue: selectedCountry,
                    placeholder: 'Selecione um país',
                    onChanged: (value) => setState(() => selectedCountry = value),
                  ),
                ),
                
                DropdownExampleWidget(
                  title: 'Dropdown com Validação',
                  description: 'Dropdown com validação obrigatória',
                  viewModel: DropdownViewModel<String>(
                    items: categories,
                    selectedValue: selectedCategory,
                    placeholder: 'Selecione uma categoria',
                    validator: validateRequired,
                    onChanged: (value) => setState(() => selectedCategory = value),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}