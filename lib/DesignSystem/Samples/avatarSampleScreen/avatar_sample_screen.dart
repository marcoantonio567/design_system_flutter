import 'package:flutter/material.dart';
import '../../Components/Avatar/custom_avatar.dart';
import '../../Components/Avatar/avatar_config.dart' as avatar_config;
import '../../Components/Avatar/avatar_view_model.dart' as avatar_vm;
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

  // Helper: converte AvatarViewModel em Widget (CustomAvatar)
  avatar_config.AvatarSize _mapSize(avatar_vm.AvatarSize s) {
    switch (s) {
      case avatar_vm.AvatarSize.small:
        return avatar_config.AvatarSize.small;
      case avatar_vm.AvatarSize.medium:
        return avatar_config.AvatarSize.medium;
      case avatar_vm.AvatarSize.large:
        return avatar_config.AvatarSize.large;
      case avatar_vm.AvatarSize.extraLarge:
        return avatar_config.AvatarSize.extraLarge;
    }
  }

  avatar_config.AvatarType _mapType(avatar_vm.AvatarType t) {
    switch (t) {
      case avatar_vm.AvatarType.image:
        return avatar_config.AvatarType.image;
      case avatar_vm.AvatarType.initials:
        return avatar_config.AvatarType.initials;
      case avatar_vm.AvatarType.icon:
        return avatar_config.AvatarType.icon;
    }
  }

  // Map enums de Config -> ViewModel (para construir o ViewModel do preview)
  avatar_vm.AvatarSize _vmSize(avatar_config.AvatarSize s) {
    switch (s) {
      case avatar_config.AvatarSize.small:
        return avatar_vm.AvatarSize.small;
      case avatar_config.AvatarSize.medium:
        return avatar_vm.AvatarSize.medium;
      case avatar_config.AvatarSize.large:
        return avatar_vm.AvatarSize.large;
      case avatar_config.AvatarSize.extraLarge:
        return avatar_vm.AvatarSize.extraLarge;
    }
  }

  avatar_vm.AvatarType _vmType(avatar_config.AvatarType t) {
    switch (t) {
      case avatar_config.AvatarType.image:
        return avatar_vm.AvatarType.image;
      case avatar_config.AvatarType.initials:
        return avatar_vm.AvatarType.initials;
      case avatar_config.AvatarType.icon:
        return avatar_vm.AvatarType.icon;
    }
  }

  Widget _avatarFromViewModel(avatar_vm.AvatarViewModel vm) {
    return CustomAvatar(
      config: avatar_config.AvatarConfig(
        size: _mapSize(vm.size),
        type: _mapType(vm.type),
        imageUrl: vm.imageUrl,
        initials: vm.initials,
        icon: vm.icon,
        backgroundColor: vm.backgroundColor,
        textColor: vm.textColor,
        borderColor: vm.borderColor,
        borderWidth: vm.borderWidth,
        showBadge: vm.showBadge,
        badgeColor: vm.badgeColor,
        badgeWidget: vm.badgeWidget,
      ),
      onTap: vm.onTap,
    );
  }

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
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewSection() {
    final vm = avatar_vm.AvatarViewModel(
      size: _vmSize(_controller.selectedSize),
      type: _vmType(_controller.selectedType),
      initials: _controller.selectedType == avatar_config.AvatarType.initials
          ? _controller.initials
          : null,
      icon: _controller.selectedType == avatar_config.AvatarType.icon
          ? _controller.selectedIcon
          : null,
      imageUrl: _controller.selectedType == avatar_config.AvatarType.image
          ? AvatarSampleConstants.sampleImageUrl
          : null,
      showBadge: _controller.showBadge,
      onTap: () => _showAvatarClickedMessage(),
    );

    return SampleCard(
      title: AvatarSampleConstants.previewTitle,
      child: Center(child: _avatarFromViewModel(vm)),
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
          if (_controller.selectedType == avatar_config.AvatarType.initials) ...[
            const SizedBox(height: spaceMd),
            _buildInitialsInput(),
          ],
          if (_controller.selectedType == avatar_config.AvatarType.icon) ...[
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
      child: ChipSelector<avatar_config.AvatarSize>(
        options: avatar_config.AvatarSize.values,
        selectedValue: _controller.selectedSize,
        onChanged: _controller.setSize,
        labelBuilder: _controller.getSizeLabel,
      ),
    );
  }

  Widget _buildTypeSelector() {
    return ControlSection(
      label: AvatarSampleConstants.typeLabel,
      child: ChipSelector<avatar_config.AvatarType>(
        options: avatar_config.AvatarType.values,
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

  // Exemplos removidos para manter apenas o essencial

  void _showAvatarClickedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Avatar clicado!')),
    );
  }
}