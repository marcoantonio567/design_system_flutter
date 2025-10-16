import 'package:flutter/material.dart';
import '../../Components/Avatar/avatar_config.dart';
import 'avatar_sample_constants.dart';

class AvatarSampleController extends ChangeNotifier {
  AvatarSize _selectedSize = AvatarSize.medium;
  AvatarType _selectedType = AvatarType.initials;
  bool _showBadge = false;
  String _initials = AvatarSampleConstants.defaultInitials;
  IconData _selectedIcon = Icons.person;

  // Getters
  AvatarSize get selectedSize => _selectedSize;
  AvatarType get selectedType => _selectedType;
  bool get showBadge => _showBadge;
  String get initials => _initials;
  IconData get selectedIcon => _selectedIcon;

  // Current avatar config
  AvatarConfig get currentConfig => AvatarConfig(
    size: _selectedSize,
    type: _selectedType,
    initials: _selectedType == AvatarType.initials ? _initials : null,
    icon: _selectedType == AvatarType.icon ? _selectedIcon : null,
    imageUrl: _selectedType == AvatarType.image 
        ? AvatarSampleConstants.sampleImageUrl1
        : null,
    showBadge: _showBadge,
  );

  // Setters with notification
  void setSize(AvatarSize size) {
    if (_selectedSize != size) {
      _selectedSize = size;
      notifyListeners();
    }
  }

  void setType(AvatarType type) {
    if (_selectedType != type) {
      _selectedType = type;
      notifyListeners();
    }
  }

  void setBadgeVisibility(bool show) {
    if (_showBadge != show) {
      _showBadge = show;
      notifyListeners();
    }
  }

  void setInitials(String newInitials) {
    if (_initials != newInitials) {
      _initials = newInitials;
      notifyListeners();
    }
  }

  void setIcon(IconData icon) {
    if (_selectedIcon != icon) {
      _selectedIcon = icon;
      notifyListeners();
    }
  }

  // Helper methods
  String getSizeLabel(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return AvatarSampleConstants.sizeLabels['small']!;
      case AvatarSize.medium:
        return AvatarSampleConstants.sizeLabels['medium']!;
      case AvatarSize.large:
        return AvatarSampleConstants.sizeLabels['large']!;
      case AvatarSize.extraLarge:
        return AvatarSampleConstants.sizeLabels['extraLarge']!;
    }
  }

  String getTypeLabel(AvatarType type) {
    switch (type) {
      case AvatarType.image:
        return AvatarSampleConstants.typeLabels['image']!;
      case AvatarType.initials:
        return AvatarSampleConstants.typeLabels['initials']!;
      case AvatarType.icon:
        return AvatarSampleConstants.typeLabels['icon']!;
    }
  }

  // Reset to defaults
  void reset() {
    _selectedSize = AvatarSize.medium;
    _selectedType = AvatarType.initials;
    _showBadge = false;
    _initials = AvatarSampleConstants.defaultInitials;
    _selectedIcon = Icons.person;
    notifyListeners();
  }
}