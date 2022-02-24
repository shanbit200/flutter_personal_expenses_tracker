import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_personal_expenses_tracker/models/enums/navigation_items.dart';
import 'package:flutter_personal_expenses_tracker/pages/barchart_page.dart';
import 'package:flutter_personal_expenses_tracker/pages/home_page.dart';
import 'package:flutter_personal_expenses_tracker/pages/myprofile_page.dart';
import 'package:flutter_personal_expenses_tracker/pages/pie_chart_page.dart';
import 'package:flutter_personal_expenses_tracker/responsive.dart';
import 'package:flutter_personal_expenses_tracker/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class NavigationPanel extends StatefulWidget {
  final Axis axis;
  const NavigationPanel({Key? key, required this.axis}) : super(key: key);

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: Responsive.isDesktop(context)
          ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          : const EdgeInsets.all(10),
      child: widget.axis == Axis.vertical
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logo.png", height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: NavigationItems.values
                      .map(
                        (e) => NavigationButton(
                          onPressed: () {
                            setState(() {
                              activeTab = e.index;
                            });
                          },
                          icon: e.icon,
                          isActive: e.index == activeTab,
                        ),
                      )
                      .toList(),
                ),
                Container()
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logo.png", height: 20),
                Row(
                  children: NavigationItems.values
                      .map(
                        (e) => NavigationButton(
                          onPressed: () {
                            setState(() {
                              activeTab = e.index;
                            });
                            if (e.icon == Icons.home) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            } else if (e.icon == Icons.bar_chart) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BarChartPage()),
                              );
                            } else if (e.icon == Icons.pie_chart) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PiechartPage()),
                              );
                            } else if (e.icon == Icons.person) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyProfilePage()),
                              );
                            }
                          },
                          icon: e.icon,
                          isActive: e.index == activeTab,
                        ),
                      )
                      .toList(),
                ),
                Container()
              ],
            ),
    );
  }
}
