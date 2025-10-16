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