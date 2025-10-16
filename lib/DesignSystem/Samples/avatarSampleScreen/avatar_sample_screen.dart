import 'package:flutter/material.dart';
import '../../Components/Avatar/custom_avatar.dart';
import '../../Components/Avatar/avatar_config.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import 'avatar_sample_constants.dart';
import 'avatar_sample_widgets.dart';
import 'avatar_sample_controller.dart';

class AvatarSampleScreen extends StatefulWidget {
  const AvatarSampleScreen({super.key});

  @override
  State<AvatarSampleScreen> createState() => _AvatarSampleScreenState();
}

class _AvatarSampleScreenState extends State<AvatarSampleScreen> {
  late final AvatarSampleController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AvatarSampleController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        AvatarSampleConstants.screenTitle,
        style: navbarSmallTitle.copyWith(color: lightTertiaryBaseColorLight),
      ),
      backgroundColor: normalSecondaryBrandColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: lightTertiaryBaseColorLight),
    );
  }

  Widget _buildBody() {
    return Container(
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
          child: ListenableBuilder(
            listenable: _controller,
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: AvatarSampleConstants.screenTitle,
                    description: AvatarSampleConstants.screenDescription,
                  ),
                  const SizedBox(height: space2xl),
                  _buildPreviewSection(),
                  const SizedBox(height: space2xl),
                  _buildControlsSection(),
                  const SizedBox(height: space2xl),
                  _buildExamplesSection(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewSection() {
    return SampleCard(
      title: AvatarSampleConstants.previewTitle,
      child: Center(
        child: CustomAvatar(
          config: _controller.currentConfig,
          onTap: () => _showAvatarClickedMessage(),
        ),
      ),
    );
  }

  Widget _buildControlsSection() {
    return SampleCard(
      title: AvatarSampleConstants.controlsTitle,
      child: Column(
        children: [
          _buildSizeSelector(),
          const SizedBox(height: spaceMd),
          _buildTypeSelector(),
          const SizedBox(height: spaceMd),
          _buildBadgeToggle(),
          if (_controller.selectedType == AvatarType.initials) ...[
            const SizedBox(height: spaceMd),
            _buildInitialsInput(),
          ],
          if (_controller.selectedType == AvatarType.icon) ...[
            const SizedBox(height: spaceMd),
            _buildIconSelector(),
          ],
        ],
      ),
    );
  }

  Widget _buildSizeSelector() {
    return ControlSection(
      label: AvatarSampleConstants.sizeLabel,
      child: ChipSelector<AvatarSize>(
        options: AvatarSize.values,
        selectedValue: _controller.selectedSize,
        onChanged: _controller.setSize,
        labelBuilder: _controller.getSizeLabel,
      ),
    );
  }

  Widget _buildTypeSelector() {
    return ControlSection(
      label: AvatarSampleConstants.typeLabel,
      child: ChipSelector<AvatarType>(
        options: AvatarType.values,
        selectedValue: _controller.selectedType,
        onChanged: _controller.setType,
        labelBuilder: _controller.getTypeLabel,
      ),
    );
  }

  Widget _buildBadgeToggle() {
    return ToggleControl(
      title: AvatarSampleConstants.badgeLabel,
      value: _controller.showBadge,
      onChanged: _controller.setBadgeVisibility,
    );
  }

  Widget _buildInitialsInput() {
    return ControlSection(
      label: AvatarSampleConstants.initialsLabel,
      child: TextField(
        decoration: InputDecoration(
          hintText: AvatarSampleConstants.initialsHint,
          border: const OutlineInputBorder(),
        ),
        maxLength: AvatarSampleConstants.maxInitialsLength,
        onChanged: _controller.setInitials,
      ),
    );
  }

  Widget _buildIconSelector() {
    return ControlSection(
      label: AvatarSampleConstants.iconLabel,
      child: Wrap(
        spacing: spaceXs,
        children: AvatarSampleConstants.availableIcons.map((icon) {
          final isSelected = _controller.selectedIcon == icon;
          return GestureDetector(
            onTap: () => _controller.setIcon(icon),
            child: Container(
              padding: const EdgeInsets.all(spaceXs),
              decoration: BoxDecoration(
                color: isSelected ? normalPrimaryBaseColorLight : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExamplesSection() {
    return SampleCard(
      title: AvatarSampleConstants.examplesTitle,
      child: Column(
        children: [
          _buildSizeExamples(),
          const SizedBox(height: spaceLg),
          _buildTypeExamples(),
          const SizedBox(height: spaceLg),
          _buildBadgeExamples(),
        ],
      ),
    );
  }

  Widget _buildSizeExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: AvatarSampleConstants.sizesExampleTitle),
        const SizedBox(height: spaceMd),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: AvatarSize.values.map((size) {
            return Column(
              children: [
                QuickAvatar(
                  initials: AvatarSampleConstants.defaultInitials,
                  size: size,
                ),
                const SizedBox(height: spaceXs),
                Text(
                   _controller.getSizeLabel(size),
                   style: label2Regular,
                 ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTypeExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: AvatarSampleConstants.typesExampleTitle),
        const SizedBox(height: spaceMd),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                QuickAvatar(
                  imageUrl: AvatarSampleConstants.sampleImageUrl,
                  size: AvatarSize.medium,
                ),
                const SizedBox(height: spaceXs),
                Text('Imagem', style: label2Regular),
               ],
             ),
             Column(
               children: [
                 QuickAvatar(
                   initials: AvatarSampleConstants.defaultInitials,
                   size: AvatarSize.medium,
                 ),
                 const SizedBox(height: spaceXs),
                 Text('Iniciais', style: label2Regular),
               ],
             ),
             Column(
               children: [
                 QuickAvatar(
                   icon: AvatarSampleConstants.defaultIcon,
                   size: AvatarSize.medium,
                 ),
                 const SizedBox(height: spaceXs),
                 Text('Ícone', style: label2Regular),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadgeExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: AvatarSampleConstants.badgeExampleTitle),
        const SizedBox(height: spaceMd),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                QuickAvatar(
                  initials: AvatarSampleConstants.defaultInitials,
                  size: AvatarSize.medium,
                  showBadge: false,
                ),
                const SizedBox(height: spaceXs),
                Text('Sem Badge', style: label2Regular),
               ],
             ),
             Column(
               children: [
                 QuickAvatar(
                   initials: AvatarSampleConstants.defaultInitials,
                   size: AvatarSize.medium,
                   showBadge: true,
                 ),
                 const SizedBox(height: spaceXs),
                 Text('Com Badge', style: label2Regular),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _showAvatarClickedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Avatar clicado!')),
    );
  }
}