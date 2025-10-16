import 'package:flutter/material.dart';
import '../../shared/scene_widget.dart';

// Widgets de exemplo usando SceneWidget reutilizável
class Scene1 extends StatelessWidget {
  const Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 1',
      message:
          'Esta é uma demonstração do componente SceneWidget reutilizável.',
    );
  }
}

class Scene2 extends StatelessWidget {
  const Scene2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 2',
      message: 'Agora todas as scenes usam o mesmo componente base.',
    );
  }
}

class Scene3 extends StatelessWidget {
  const Scene3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 3',
      message: 'Isso elimina duplicação de código e facilita manutenção.',
    );
  }
}

class Scene4 extends StatelessWidget {
  const Scene4({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 4',
      message: 'Componentes reutilizáveis são a base de um bom Design System.',
    );
  }
}

class Scene5 extends StatelessWidget {
  const Scene5({super.key});

  @override
  Widget build(BuildContext context) {
    return const SceneWidget(
      title: 'Scene 5',
      message: 'Agora você pode personalizar facilmente cada scene.',
    );
  }
}

class Scene6 extends StatelessWidget {
  const Scene6({super.key});

  @override
  Widget build(BuildContext context) {
    return SceneWidget(
      title: 'Scene 6',
      message: 'Componente de card interativo com design consistente.',
      child: _buildInteractiveCard(context),
    );
  }

  Widget _buildInteractiveCard(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                size: 48,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 16),
              const Text(
                'Card Interativo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Este é um exemplo de card que mantém a identidade visual do Design System.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ação principal executada!')),
                      );
                    },
                    child: const Text('Ação'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ação secundária executada!')),
                      );
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Scene7 extends StatelessWidget {
  const Scene7({super.key});

  @override
  Widget build(BuildContext context) {
    return SceneWidget(
      title: 'Scene 7',
      message: 'Lista interativa com ações e design consistente.',
      child: _buildInteractiveList(context),
    );
  }

  Widget _buildInteractiveList(BuildContext context) {
    final items = [
      {'title': 'Item 1', 'subtitle': 'Descrição do primeiro item', 'icon': Icons.home},
      {'title': 'Item 2', 'subtitle': 'Descrição do segundo item', 'icon': Icons.work},
      {'title': 'Item 3', 'subtitle': 'Descrição do terceiro item', 'icon': Icons.favorite},
      {'title': 'Item 4', 'subtitle': 'Descrição do quarto item', 'icon': Icons.settings},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              child: Icon(
                item['icon'] as IconData,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            subtitle: Text(
              item['subtitle'] as String,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
              ),
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$value executado para ${item['title']}')),
                );
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Editar',
                  child: Text('Editar'),
                ),
                const PopupMenuItem(
                  value: 'Compartilhar',
                  child: Text('Compartilhar'),
                ),
                const PopupMenuItem(
                  value: 'Excluir',
                  child: Text('Excluir'),
                ),
              ],
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item['title']} selecionado')),
              );
            },
          ),
        );
      },
    );
  }
}