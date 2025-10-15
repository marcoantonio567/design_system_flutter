import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import 'widgets/section_title.dart';
import 'widgets/card_examples.dart';

class CardSampleScreen extends StatelessWidget {
  const CardSampleScreen({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: normalSecondaryBrandColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTertiaryBaseColorLight,
      appBar: AppBar(
        title: Text(
          'Custom Cards',
          style: heading4Regular.copyWith(
            color: normalPrimaryBaseColorLight,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: lightTertiaryBaseColorLight,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: normalPrimaryBaseColorLight,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Tipos de Card'),
            const SizedBox(height: spaceMd),
            CardTypeExamples(onShowSnackBar: _showSnackBar),
            
            const SizedBox(height: spaceLg),
            
            const SectionTitle(title: 'Tamanhos de Card'),
            const SizedBox(height: spaceMd),
            CardSizeExamples(onShowSnackBar: _showSnackBar),
            
            const SizedBox(height: spaceLg),
            
            const SectionTitle(title: 'Exemplos Especiais'),
            const SizedBox(height: spaceMd),
            CardSpecialExamples(onShowSnackBar: _showSnackBar),
          ],
        ),
      ),
    );
  }
}