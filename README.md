# 🎨 Design System Flutter

Um sistema de design completo e reutilizável para Flutter, criado para acelerar o desenvolvimento de aplicações móveis com componentes consistentes e bem estruturados.

## 📋 Sobre o Projeto

Este projeto é um **Design System** desenvolvido em Flutter que oferece um conjunto abrangente de componentes UI reutilizáveis. O objetivo é permitir que desenvolvedores criem aplicações completas utilizando apenas esses componentes pré-construídos, garantindo consistência visual e funcional em todos os projetos.

## 🏗️ Arquitetura do Código

O projeto segue uma arquitetura modular e bem organizada:

```
lib/DesignSystem/
├── Components/          # Componentes UI reutilizáveis
│   ├── Avatar/         # Componente de avatar com configurações personalizáveis
│   ├── Banner/         # Banners informativos e promocionais
│   ├── Buttons/        # Botões de ação com diferentes estilos e tamanhos
│   ├── Card/           # Cards flexíveis para exibição de conteúdo
│   ├── Checkbox/       # Checkboxes customizados
│   ├── Dropdown/       # Menus dropdown interativos
│   ├── InputField/     # Campos de entrada de texto
│   ├── List/           # Listas customizadas
│   ├── Radio/          # Botões de rádio
│   ├── Tab/            # Componentes de abas
│   └── ...
├── Samples/            # Telas de exemplo demonstrando uso dos componentes
│   ├── actionButtonSampleScreen/
│   ├── avatarSampleScreen/
│   ├── cardSampleScreen/
│   └── ...
└── shared/             # Recursos compartilhados
    ├── colors.dart     # Paleta de cores do design system
    ├── spacing.dart    # Sistema de espaçamento
    ├── styles.dart     # Estilos de texto e tipografia
    ├── theme.dart      # Tema principal da aplicação
    └── widgets/        # Widgets auxiliares
```

### 🔧 Princípios Arquiteturais

- **Modularidade**: Cada componente é independente e pode ser usado isoladamente
- **Reutilização**: Todos os componentes são projetados para máxima reutilização
- **Consistência**: Sistema unificado de cores, espaçamento e tipografia
- **Flexibilidade**: Componentes configuráveis através de ViewModels e parâmetros
- **Manutenibilidade**: Código bem estruturado e documentado

## 🧩 Componentes Disponíveis

### Interface de Usuário
- **ActionButton**: Botões com múltiplos tamanhos (small, medium, large) e estilos
- **CustomCard**: Cards flexíveis com suporte a ícones, badges e conteúdo customizado
- **CustomAvatar**: Avatares personalizáveis com diferentes configurações
- **CustomBanner**: Banners informativos com temas configuráveis

### Formulários e Entrada
- **InputField**: Campos de texto com validação e estilos customizados
- **CustomCheckbox**: Checkboxes com design personalizado
- **CustomRadio**: Botões de rádio estilizados
- **CustomDropdown**: Menus dropdown com múltiplas opções

### Navegação
- **BottomTabBar**: Barra de navegação inferior
- **NavigationCard**: Cards de navegação para menus
- **Tab**: Sistema de abas customizável

### Layout e Estrutura
- **CustomList**: Listas personalizáveis
- **SceneWidget**: Widget base para telas reutilizáveis

## 🚀 Tipos de Aplicações Possíveis

Com este design system, você pode desenvolver diversos tipos de aplicações:

### 📱 Aplicações Comerciais
- **E-commerce**: Lojas virtuais com catálogo de produtos, carrinho e checkout
- **Marketplace**: Plataformas de venda com múltiplos vendedores
- **Aplicações Bancárias**: Apps financeiros com dashboards e transações
- **Aplicações de Delivery**: Plataformas de entrega de comida e produtos

### 🏢 Aplicações Corporativas
- **CRM**: Sistemas de gestão de relacionamento com cliente
- **ERP**: Sistemas de gestão empresarial
- **Dashboards Administrativos**: Painéis de controle e analytics
- **Aplicações de Produtividade**: Ferramentas de gestão de tarefas e projetos

### 🎯 Aplicações Sociais
- **Redes Sociais**: Plataformas de interação social
- **Aplicações de Mensagens**: Chats e comunicação
- **Fóruns e Comunidades**: Plataformas de discussão
- **Aplicações de Dating**: Apps de relacionamento

### 📚 Aplicações Educacionais
- **Plataformas de E-learning**: Cursos online e educação
- **Aplicações de Quiz**: Jogos educativos e avaliações
- **Bibliotecas Digitais**: Acesso a conteúdo educacional

### 🏥 Aplicações de Saúde
- **Telemedicina**: Consultas médicas remotas
- **Fitness e Wellness**: Apps de exercícios e bem-estar
- **Gestão de Saúde**: Acompanhamento médico e medicamentos

## 🎨 Design System de Referência

**Link do Design System Original**: 
```
https://www.figma.com/design/h62ZI8lMO7SsZVr2QZuVjA/Design-System--Community-?node-id=4-6&p=f&t=VHqQDjzTGV7NybJF-0
```

*Este espaço está reservado para o link do design system que serviu como base para este projeto.*

## 🛠️ Como Usar

### Instalação
1. Clone o repositório
2. Execute `flutter pub get` para instalar as dependências
3. Execute `flutter run` para ver os exemplos

### Importação de Componentes
```dart
// Importação individual
import 'DesignSystem/Components/Buttons/ActionButton/action_button.dart';

// Importação via index (recomendado)
import 'DesignSystem/shared/index.dart';
```

### Exemplo de Uso
```dart
// Usando um ActionButton
ActionButton.instantiate(
  viewModel: ActionButtonViewModel(
    text: 'Clique aqui',
    size: ActionButtonSize.large,
    type: ActionButtonType.primary,
    onPressed: () => print('Botão pressionado!'),
  ),
)

// Usando um CustomCard
CustomCard(
  type: CardType.primary,
  size: CardSize.medium,
  title: 'Título do Card',
  subtitle: 'Subtítulo',
  description: 'Descrição detalhada do conteúdo',
  icon: Icons.star,
  onTap: () => print('Card tocado!'),
)
```

## 🎯 Telas de Exemplo

O projeto inclui telas de exemplo para cada componente, demonstrando:
- Diferentes configurações e estados
- Casos de uso práticos
- Melhores práticas de implementação
- Integração entre componentes

Acesse as telas através do menu principal da aplicação para explorar todos os componentes disponíveis.

## 🤝 Contribuição

Este design system está em constante evolução. Contribuições são bem-vindas para:
- Novos componentes
- Melhorias nos existentes
- Correções de bugs
- Documentação adicional

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvido com 😡☕ usando Flutter**
