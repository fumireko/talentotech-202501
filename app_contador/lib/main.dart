import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Responsivo'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return MobileLayout(
              counter: _counter,
              increment: _increment,
              decrement: _decrement,
            );
          } else {
            return DesktopLayout(
              counter: _counter,
              increment: _increment,
              decrement: _decrement,
            );
          }
        },
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  const MobileLayout({
    super.key,
    required this.counter,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Contador:',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            '$counter',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrement,
                child: const Text('-', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: increment,
                child: const Text('+', style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  const DesktopLayout({
    super.key,
    required this.counter,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: decrement,
          child: const Text('-', style: TextStyle(fontSize: 32)),
        ),
        const SizedBox(width: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Contador:',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(width: 40),
        ElevatedButton(
          onPressed: increment,
          child: const Text('+', style: TextStyle(fontSize: 32)),
        ),
      ],
    );
  }
}