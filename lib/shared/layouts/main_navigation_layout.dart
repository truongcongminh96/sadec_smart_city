import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/shared/widgets/fancy_bottom_navigation/component/gbutton.dart';
import 'package:sadec_smart_city/shared/widgets/fancy_bottom_navigation/component/gnav.dart';

class MainNavigationLayout extends StatelessWidget {
  final Widget child;

  const MainNavigationLayout({super.key, required this.child});

  static const tabs = ['/home', '/notifications', '/events', '/profile'];

  static const navIndexMap = {
    '/home': 0,
    '/notifications': 1,
    '/events': 2,
    '/profile': 3,
  };

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = navIndexMap[location] ?? -1;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    double gap = 0;
    int badge = 0;
    final double iconSize = 22;
    final padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 12);

    return Scaffold(
      body: child,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow:
                isDark
                    ? []
                    : [
                      BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 25),
                      ),
                    ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: GNav(
              tabBorderRadius: 100,
              color: isDark ? Colors.grey[400] : Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor:
                  isDark ? Colors.white10 : Colors.grey.shade200,
              backgroundColor: Colors.transparent,
              padding: padding,
              gap: gap,
              iconSize: iconSize,
              selectedIndex: currentIndex,
              onTabChange: (index) {
                final route = tabs[index];
                context.go(route);
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Trang chủ',
                  iconColor: isDark ? Colors.grey[400] : Colors.black,
                  iconActiveColor: Colors.purple,
                  textColor: Colors.purple,
                  backgroundColor: Colors.purple.withOpacity(0.2),
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Thông báo',
                  iconColor: isDark ? Colors.grey[400] : Colors.black,
                  iconActiveColor: Colors.amber,
                  textColor: Colors.amber,
                  backgroundColor: Colors.amber.withOpacity(0.2),
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                GButton(
                  icon: Icons.event_note,
                  text: 'Sự kiện',
                  iconColor: isDark ? Colors.grey[400] : Colors.black,
                  iconActiveColor: Colors.orange,
                  textColor: Colors.orange,
                  backgroundColor: Colors.orange.withOpacity(0.2),
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                GButton(
                  icon: Icons.verified_user,
                  text: 'Giới thiệu',
                  iconColor: isDark ? Colors.grey[400] : Colors.black,
                  iconActiveColor: Colors.teal,
                  textColor: Colors.teal,
                  backgroundColor: Colors.teal.withOpacity(0.2),
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  leading: const CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/logo_sdc.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
