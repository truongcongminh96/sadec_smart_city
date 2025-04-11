import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sadec_smart_city/shared/widgets/fancy_bottom_navigation/component/gbutton.dart';
import 'package:sadec_smart_city/shared/widgets/fancy_bottom_navigation/component/gnav.dart';

class FancyBottomNavigationExample extends StatefulWidget {
  const FancyBottomNavigationExample({super.key});

  @override
  FancyBottomNavigationExampleState createState() =>
      FancyBottomNavigationExampleState();
}

class FancyBottomNavigationExampleState
    extends State<FancyBottomNavigationExample> {
  int selectedIndex = 0;
  int badge = 0;
  final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  double gap = 10;

  PageController controller = PageController();

  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('GoogleNavBar', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),

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
                    text: 'Home',
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: Colors.pink,
                    iconColor: Colors.black,
                    textColor: Colors.pink,
                    backgroundColor: Colors.pink.withValues(alpha: 0.2),
                    iconSize: 24,
                    padding: padding,
                    icon: Icons.favorite,
                    text: 'Tan vỡ',
                    leading:
                        selectedIndex == 1 || badge == 0
                            ? null
                            : Badge(
                              child: Icon(
                                Icons.heart_broken,
                                color:
                                    selectedIndex == 1
                                        ? Colors.pink
                                        : Colors.black,
                              ),
                            ),
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: Colors.amber[600],
                    iconColor: Colors.black,
                    textColor: Colors.amber[600],
                    backgroundColor: Colors.amber[600]!.withValues(alpha: 0.2),
                    iconSize: 24,
                    padding: padding,
                    icon: Icons.search,
                    text: 'Search',
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
                    text: 'Sheldon',
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
