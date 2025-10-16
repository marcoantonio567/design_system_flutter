import 'package:flutter/material.dart';

class AvatarSampleConstants {
  // Strings
  static const String screenTitle = 'Avatar Component';
  static const String screenDescription = 'Componente versátil para exibir avatares de usuários com diferentes tipos e tamanhos.';
  static const String previewTitle = 'Preview';
  static const String controlsTitle = 'Controles';
  static const String examplesTitle = 'Exemplos de Uso';
  static const String avatarClickedMessage = 'Avatar clicado!';
  
  // Labels
  static const String sizeLabel = 'Tamanho:';
  static const String typeLabel = 'Tipo:';
  static const String badgeLabel = 'Mostrar Badge:';
  static const String initialsLabel = 'Iniciais:';
  static const String iconLabel = 'Ícone:';
  static const String initialsHint = 'Ex: JD';
  
  // Example sections
  static const String differentSizesExample = 'Tamanhos Diferentes';
  static const String withBadgeExample = 'Com Badge';
  static const String differentTypesExample = 'Tipos Diferentes';
  
  // Size labels
  static const Map<String, String> sizeLabels = {
    'small': 'Pequeno',
    'medium': 'Médio',
    'large': 'Grande',
    'extraLarge': 'Extra Grande',
  };
  
  // Type labels
  static const Map<String, String> typeLabels = {
    'image': 'Imagem',
    'initials': 'Iniciais',
    'icon': 'Ícone',
  };
  
  // Default values
  static const String defaultInitials = 'JD';
  static const int maxInitialsLength = 3;
  
  // Sample URLs
  static const String sampleImageUrl1 = 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face';
  static const String sampleImageUrl2 = 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face';
  static const String sampleImageUrl3 = 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face';
  
  // Available icons
  static const List<IconData> availableIcons = [
    Icons.person,
    Icons.account_circle,
    Icons.face,
    Icons.emoji_emotions,
    Icons.pets,
    Icons.business,
  ];
  
  // Example section titles
  static const String sizesExampleTitle = 'Tamanhos Diferentes';
  static const String typesExampleTitle = 'Tipos Diferentes';
  static const String badgeExampleTitle = 'Com Badge';
  
  // Default values for examples
  static const String sampleImageUrl = 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face';
  static const IconData defaultIcon = Icons.person;
}