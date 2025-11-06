import 'package:flutter/material.dart';
import '../../Components/Banner/custom_banner.dart';
import '../../Components/Banner/banner_view_model.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';

class BannerSampleScreen extends StatefulWidget {
  const BannerSampleScreen({super.key});

  @override
  State<BannerSampleScreen> createState() => _BannerSampleScreenState();
}

class _BannerSampleScreenState extends State<BannerSampleScreen> {
  final Map<String, bool> _bannerVisibility = {
    'info': true,
    'success': true,
    'warning': true,
    'error': true,
    'promotional': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: _buildBackgroundGradient(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: spaceLg),
                  _buildHeader(),
                  const SizedBox(height: space2xl),
                  ..._buildBannerExamples(),
                  const SizedBox(height: space2xl),
                  _buildRestoreButton(),
                  const SizedBox(height: space2xl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Banners Personalizados',
        style: navbarSmallTitle.copyWith(color: lightTertiaryBaseColorLight),
      ),
      backgroundColor: normalSecondaryBrandColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: lightTertiaryBaseColorLight),
    );
  }

  BoxDecoration _buildBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [normalSecondaryBrandColor, lightSecondaryBrandColor],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Componente de Banner',
          style: heading4Regular.copyWith(color: lightTertiaryBaseColorLight),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: spaceXs),
        Text(
          'Banners informativos e promocionais',
          style: paragraph1Regular.copyWith(
            color: lightTertiaryBaseColorLight.withValues(alpha: 0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  List<Widget> _buildBannerExamples() {
    return [
      if (_bannerVisibility['info']!)
        CustomBanner.instantiate(
          viewModel: BannerViewModel(
            title: 'Informação Importante',
            subtitle: 'Esta é uma mensagem informativa para o usuário.',
            type: BannerType.info,
            showCloseButton: true,
            onDismiss: () => _hideBanner('info'),
          ),
        ),

      if (_bannerVisibility['success']!)
        CustomBanner.instantiate(
          viewModel: BannerViewModel(
            title: 'Operação Realizada com Sucesso!',
            subtitle: 'Seus dados foram salvos corretamente.',
            type: BannerType.success,
            actionText: 'Ver Detalhes',
            onActionPressed: () => _showSnackBar('Detalhes visualizados'),
            showCloseButton: true,
            onDismiss: () => _hideBanner('success'),
          ),
        ),

      if (_bannerVisibility['warning']!)
        CustomBanner.instantiate(
          viewModel: BannerViewModel(
            title: 'Atenção Necessária',
            subtitle: 'Alguns campos precisam ser preenchidos antes de continuar.',
            type: BannerType.warning,
            actionText: 'Corrigir',
            onActionPressed: () => _showSnackBar('Redirecionando para correção'),
            showCloseButton: true,
            onDismiss: () => _hideBanner('warning'),
          ),
        ),

      if (_bannerVisibility['error']!)
        CustomBanner.instantiate(
          viewModel: BannerViewModel(
            title: 'Erro na Operação',
            subtitle: 'Não foi possível completar a ação. Tente novamente.',
            type: BannerType.error,
            actionText: 'Tentar Novamente',
            onActionPressed: () => _showSnackBar('Tentando novamente...'),
            showCloseButton: true,
            onDismiss: () => _hideBanner('error'),
          ),
        ),

      if (_bannerVisibility['promotional']!)
        CustomBanner.instantiate(
          viewModel: BannerViewModel(
            title: 'Oferta Especial!',
            subtitle: 'Aproveite 50% de desconto em todos os produtos.',
            type: BannerType.promotional,
            actionText: 'Aproveitar',
            onActionPressed: () => _showSnackBar('Oferta ativada!'),
            showCloseButton: true,
            onDismiss: () => _hideBanner('promotional'),
          ),
        ),

      // Promocional com gradiente
      CustomBanner.instantiate(
        viewModel: BannerViewModel(
          title: 'Premium Upgrade',
          subtitle: 'Desbloqueie recursos exclusivos agora!',
          type: BannerType.promotional,
          actionText: 'Upgrade',
          onActionPressed: () => _showSnackBar('Upgrade iniciado'),
          showCloseButton: true,
          onDismiss: () => _showSnackBar('Banner fechado'),
        ),
      ),

      // Info com conteúdo customizado
      CustomBanner.instantiate(
        viewModel: BannerViewModel(
          title: 'Novidades do App',
          type: BannerType.info,
          actionText: 'Saiba Mais',
          onActionPressed: () => _showSnackBar('Abrindo detalhes das novidades'),
          customContent: _buildCustomContent(),
        ),
      ),

      // Promocional Black Friday com gradiente
      CustomBanner.instantiate(
        viewModel: BannerViewModel(
          title: 'Black Friday',
          subtitle: 'Descontos imperdíveis até 70% OFF!',
          type: BannerType.promotional,
          actionText: 'Comprar Agora',
          onActionPressed: () => _showSnackBar('Redirecionando para loja'),
          showCloseButton: true,
          onDismiss: () => _showSnackBar('Promoção dispensada'),
        ),
        gradientColors: const [normalTertiaryBrandColor, lightTertiaryBrandColor],
      ),

      // Banner simples sem ação
      CustomBanner.instantiate(
        viewModel: BannerViewModel(
          title: 'Manutenção Programada',
          subtitle: 'O sistema estará indisponível das 02:00 às 04:00.',
          type: BannerType.warning,
          icon: Icons.build_outlined,
        ),
      ),
    ];
  }

  Widget _buildCustomContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureItem('• Nova interface redesenhada'),
        _buildFeatureItem('• Performance melhorada'),
        _buildFeatureItem('• Novos recursos de segurança'),
      ],
    );
  }

  Widget _buildFeatureItem(String text) {
    return Text(
      text,
      style: paragraph2Medium.copyWith(color: normalSecondaryBaseColorLight),
    );
  }

  Widget _buildRestoreButton() {
    return ElevatedButton(
      onPressed: _restoreAllBanners,
      style: ElevatedButton.styleFrom(
        backgroundColor: lightTertiaryBaseColorLight,
        foregroundColor: normalSecondaryBrandColor,
        padding: const EdgeInsets.symmetric(vertical: spaceMd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSm),
        ),
      ),
      child: Text('Restaurar Todos os Banners', style: button2Semibold),
    );
  }

  void _hideBanner(String bannerKey) {
    setState(() {
      _bannerVisibility[bannerKey] = false;
    });
  }

  void _restoreAllBanners() {
    setState(() {
      _bannerVisibility.updateAll((key, value) => true);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: normalSecondaryBrandColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSm),
        ),
      ),
    );
  }
}