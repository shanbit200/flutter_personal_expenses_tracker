import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses_tracker/layout/app_layout.dart';
import 'package:flutter_personal_expenses_tracker/models/card_details.dart';
import 'package:flutter_personal_expenses_tracker/models/enums/card_type.dart';
import 'package:flutter_personal_expenses_tracker/responsive.dart';
import 'package:flutter_personal_expenses_tracker/sections/expense_income_chart.dart';
import 'package:flutter_personal_expenses_tracker/sections/latest_transactions.dart';
import 'package:flutter_personal_expenses_tracker/sections/statics_by_category.dart';
import 'package:flutter_personal_expenses_tracker/sections/upgrade_pro_section.dart';
import 'package:flutter_personal_expenses_tracker/sections/your_cards_section.dart';
import 'package:flutter_personal_expenses_tracker/styles/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: Row(
            children: [
              // Main Panel
              Expanded(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: ExpenseIncomeCharts(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Styles.defaultPadding,
                        ),
                        child: const UpgradeProSection(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LatestTransactions(),
                    ),
                  ],
                ),
                flex: 5,
              ),
              // Right Panel
              Visibility(
                visible: Responsive.isDesktop(context),
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: Styles.defaultPadding),
                    child: Column(
                      children: [
                        CardsSection(
                          cardDetails: [
                            CardDetails("431421432", CardType.mastercard),
                            CardDetails("423142231", CardType.mastercard),
                          ],
                        ),
                        const Expanded(
                          child: StaticsByCategory(),
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
