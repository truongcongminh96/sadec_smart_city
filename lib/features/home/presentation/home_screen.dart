import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sa Đéc Smart')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Chào mừng đến với SmartCity Sa Đéc!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/report'),
              child: const Text('Gửi phản ánh'),
            ),
          ],
        ),
      ),
    );
  }
}
