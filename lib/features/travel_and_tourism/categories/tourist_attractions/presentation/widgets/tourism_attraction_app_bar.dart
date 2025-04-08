import 'package:flutter/material.dart';

class TourismAttractionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TourismAttractionAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      elevation: 0,
      backgroundColor:
          theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
      title: Text(
        'Discover.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: isDark ? theme.colorScheme.primary : theme.colorScheme.primary,
        ),
      ),
      actions: [
        Icon(Icons.filter, color: theme.iconTheme.color ?? Colors.black),
        const SizedBox(width: 16),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.iconTheme.color ?? Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
