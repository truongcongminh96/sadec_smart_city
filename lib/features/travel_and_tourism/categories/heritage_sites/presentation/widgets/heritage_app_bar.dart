import 'package:flutter/material.dart';

class HeritageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeritageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        'Discover.',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      actions: const [Icon(Icons.filter, color: Colors.black)],
      leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
    );
  }
}
