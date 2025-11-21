import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips & Insights',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Header
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Credit Mastery',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Essential Credit Tips',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '20 proven strategies to boost your credit score',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            // Stats Cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context,
                      'Score Impact',
                      'High',
                      Icons.trending_up_rounded,
                      Colors.green,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      'Time Required',
                      'Ongoing',
                      Icons.schedule_rounded,
                      Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Tips List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _buildModernTipItem(
                    context: context,
                    number: 1,
                    title: "Pay Bills on Time",
                    description: "Payment history is the most important factor in your credit score. Set up automatic payments to avoid missed due dates.",
                    icon: Icons.alarm_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 2,
                    title: "Keep Credit Utilization Low",
                    description: "Aim to use less than 30% of your available credit limit across all cards to show responsible usage.",
                    icon: Icons.pie_chart_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 3,
                    title: "Don't Close Old Accounts",
                    description: "Length of credit history matters. Keep old accounts open to maintain a longer average account age.",
                    icon: Icons.history_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 4,
                    title: "Monitor Your Credit Report",
                    description: "Check your credit reports regularly for errors and dispute any inaccuracies immediately.",
                    icon: Icons.monitor_heart_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 5,
                    title: "Diversify Your Credit Mix",
                    description: "Having different types of credit (installment loans, credit cards) can positively impact your score.",
                    icon: Icons.account_balance_wallet_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 6,
                    title: "Limit Hard Inquiries",
                    description: "Too many credit applications in a short period can lower your score. Space out credit applications.",
                    icon: Icons.search_off_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 7,
                    title: "Become an Authorized User",
                    description: "Ask a family member with good credit to add you as an authorized user on their account.",
                    icon: Icons.supervised_user_circle_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 8,
                    title: "Pay More Than Minimum",
                    description: "Paying more than the minimum payment reduces interest and shows responsible credit management.",
                    icon: Icons.attach_money_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 9,
                    title: "Set Up Payment Alerts",
                    description: "Use mobile banking alerts to remind you of upcoming due dates and current balances.",
                    icon: Icons.notifications_active_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 10,
                    title: "Address Collections Immediately",
                    description: "If an account goes to collections, negotiate payment or settlement terms right away.",
                    icon: Icons.warning_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 11,
                    title: "Maintain Stable Employment",
                    description: "Lenders view job stability positively when evaluating credit applications.",
                    icon: Icons.work_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 12,
                    title: "Use Balance Alerts",
                    description: "Set up alerts when your balance reaches a certain percentage of your credit limit.",
                    icon: Icons.balance_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 13,
                    title: "Consider Credit Builder Loans",
                    description: "Some financial institutions offer loans specifically designed to help build credit history.",
                    icon: Icons.construction_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 14,
                    title: "Avoid Maxing Out Cards",
                    description: "Maxing out credit cards signals financial stress and can significantly lower your score.",
                    icon: Icons.block_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 15,
                    title: "Review Statements Carefully",
                    description: "Regularly check statements for fraudulent charges and reporting errors.",
                    icon: Icons.description_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 16,
                    title: "Build Emergency Savings",
                    description: "Having savings reduces reliance on credit for unexpected expenses.",
                    icon: Icons.savings_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 17,
                    title: "Understand Credit Score Factors",
                    description: "Know what impacts your score: payment history, utilization, length, mix, and new credit.",
                    icon: Icons.analytics_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 18,
                    title: "Negotiate Credit Limits",
                    description: "Request credit limit increases (without hard pulls) to lower your utilization ratio.",
                    icon: Icons.trending_up_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 19,
                    title: "Use Secured Credit Cards",
                    description: "If rebuilding credit, secured cards can help establish positive payment history.",
                    icon: Icons.credit_card_rounded,
                  ),
                  _buildModernTipItem(
                    context: context,
                    number: 20,
                    title: "Be Patient and Consistent",
                    description: "Building good credit takes time. Stay consistent with good financial habits.",
                    icon: Icons.self_improvement_rounded,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernTipItem({
    required BuildContext context,
    required int number,
    required String title,
    required String description,
    required IconData icon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = _getTipColor(number);

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number Badge
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, _darkenColor(color, 0.2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '$number',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(icon, size: 16, color: color),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 12),

                      // Progress indicator for implementation
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: _getImplementationProgress(number),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [color, _darkenColor(color, 0.2)],
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Action Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getTipColor(int number) {
    final colors = [
      Color(0xFF6366F1), // Indigo
      Color(0xFF10B981), // Emerald
      Color(0xFFF59E0B), // Amber
      Color(0xFFEF4444), // Red
      Color(0xFF8B5CF6), // Violet
      Color(0xFF06B6D4), // Cyan
      Color(0xFF84CC16), // Lime
      Color(0xFFF97316), // Orange
      Color(0xFFEC4899), // Pink
      Color(0xFF14B8A6), // Teal
    ];
    return colors[number % colors.length];
  }

  Color _darkenColor(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  double _getImplementationProgress(int number) {
    // Simulate different implementation progress for visual variety
    final progressValues = [0.3, 0.6, 0.8, 0.4, 0.9, 0.5, 0.7, 0.2, 0.1, 0.95];
    return progressValues[number % progressValues.length];
  }
}