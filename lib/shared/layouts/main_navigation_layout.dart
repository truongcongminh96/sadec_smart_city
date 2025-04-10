import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/shared/widgets/fancy_bottom_navigation/component/gbutton.dart';
import 'package:sadec_smart_city/shared/widgets/fancy_bottom_navigation/component/gnav.dart';

class MainNavigationLayout extends StatelessWidget {
  final Widget child;

  const MainNavigationLayout({super.key, required this.child});

  static const tabs = ['/home', '/report'];
  static const navIndexMap = {'/home': 0, '/report': 1};

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = navIndexMap[location] ?? -1;
    double gap = 10;
    int badge = 0;
    final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);

    print(currentIndex);
    return Scaffold(
      body: child,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withValues(alpha: 0.4),
                offset: Offset(0, 25),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: GNav(
              tabs: [
                GButton(
                  gap: gap,
                  iconActiveColor: Colors.purple,
                  iconColor: Colors.black,
                  textColor: Colors.purple,
                  backgroundColor: Colors.purple.withValues(alpha: 0.2),
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.home,
                  text: 'Trang chủ',
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: Colors.teal,
                  iconColor: Colors.black,
                  textColor: Colors.teal,
                  backgroundColor: Colors.teal.withValues(alpha: 0.2),
                  iconSize: 24,
                  padding: padding,
                  icon: Icons.verified_user,
                  leading: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/logo_sdc.png'),
                  ),
                  text: 'Tài khoản',
                ),
              ],
              selectedIndex: currentIndex,
              onTabChange: (index) {
                final route = tabs[index];
                context.go(route);
              },
            ),
          ),
        ),
      ),
    );
  }
}
