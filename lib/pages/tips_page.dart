import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Tips'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(Icons.lightbulb, size: 64, color: Colors.amber),
                SizedBox(height: 16),
                Text(
                  'Credit Tips & Insights',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  '20 Essential Tips to Improve Your Credit Score',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Tips List
          _buildTipItem(
            number: 1,
            title: "Pay Bills on Time",
            description: "Payment history is the most important factor in your credit score. Set up automatic payments to avoid missed due dates.",
          ),
          _buildTipItem(
            number: 2,
            title: "Keep Credit Utilization Low",
            description: "Aim to use less than 30% of your available credit limit across all cards to show responsible usage.",
          ),
          _buildTipItem(
            number: 3,
            title: "Don't Close Old Accounts",
            description: "Length of credit history matters. Keep old accounts open to maintain a longer average account age.",
          ),
          _buildTipItem(
            number: 4,
            title: "Monitor Your Credit Report",
            description: "Check your credit reports regularly for errors and dispute any inaccuracies immediately.",
          ),
          _buildTipItem(
            number: 5,
            title: "Diversify Your Credit Mix",
            description: "Having different types of credit (installment loans, credit cards) can positively impact your score.",
          ),
          _buildTipItem(
            number: 6,
            title: "Limit Hard Inquiries",
            description: "Too many credit applications in a short period can lower your score. Space out credit applications.",
          ),
          _buildTipItem(
            number: 7,
            title: "Become an Authorized User",
            description: "Ask a family member with good credit to add you as an authorized user on their account.",
          ),
          _buildTipItem(
            number: 8,
            title: "Pay More Than Minimum",
            description: "Paying more than the minimum payment reduces interest and shows responsible credit management.",
          ),
          _buildTipItem(
            number: 9,
            title: "Set Up Payment Alerts",
            description: "Use mobile banking alerts to remind you of upcoming due dates and current balances.",
          ),
          _buildTipItem(
            number: 10,
            title: "Address Collections Immediately",
            description: "If an account goes to collections, negotiate payment or settlement terms right away.",
          ),
          _buildTipItem(
            number: 11,
            title: "Maintain Stable Employment",
            description: "Lenders view job stability positively when evaluating credit applications.",
          ),
          _buildTipItem(
            number: 12,
            title: "Use Balance Alerts",
            description: "Set up alerts when your balance reaches a certain percentage of your credit limit.",
          ),
          _buildTipItem(
            number: 13,
            title: "Consider Credit Builder Loans",
            description: "Some financial institutions offer loans specifically designed to help build credit history.",
          ),
          _buildTipItem(
            number: 14,
            title: "Avoid Maxing Out Cards",
            description: "Maxing out credit cards signals financial stress and can significantly lower your score.",
          ),
          _buildTipItem(
            number: 15,
            title: "Review Statements Carefully",
            description: "Regularly check statements for fraudulent charges and reporting errors.",
          ),
          _buildTipItem(
            number: 16,
            title: "Build Emergency Savings",
            description: "Having savings reduces reliance on credit for unexpected expenses.",
          ),
          _buildTipItem(
            number: 17,
            title: "Understand Credit Score Factors",
            description: "Know what impacts your score: payment history, utilization, length, mix, and new credit.",
          ),
          _buildTipItem(
            number: 18,
            title: "Negotiate Credit Limits",
            description: "Request credit limit increases (without hard pulls) to lower your utilization ratio.",
          ),
          _buildTipItem(
            number: 19,
            title: "Use Secured Credit Cards",
            description: "If rebuilding credit, secured cards can help establish positive payment history.",
          ),
          _buildTipItem(
            number: 20,
            title: "Be Patient and Consistent",
            description: "Building good credit takes time. Stay consistent with good financial habits.",
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem({
    required int number,
    required String title,
    required String description,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}