import 'package:flutter/material.dart';

class LearningModulePage extends StatefulWidget {
  final Function(String)? onLessonComplete;
  final List<String> completedLessons;

  const LearningModulePage({
    Key? key,
    this.onLessonComplete,
    required this.completedLessons,
  }) : super(key: key);

  @override
  _LearningModulePageState createState() => _LearningModulePageState();
}

class _LearningModulePageState extends State<LearningModulePage> {
  final List<Lesson> _lessons = [
    Lesson(
      id: 'lesson_1',
      title: 'What is Credit Score?',
      description: 'Understand the basics of credit scoring and why it matters',
      duration: '8 min',
      icon: Icons.credit_score,
      detailedDescription: '''
A credit score is a three-digit number that represents your creditworthiness - how likely you are to repay borrowed money. It's based on your credit history and ranges from 300 to 850.

**Key Points:**
• Scores are calculated using information from your credit reports
• Higher scores mean better creditworthiness
• Lenders use scores to decide loan approvals and interest rates
• Scores can affect insurance rates, rental applications, and even job opportunities

**Why It Matters:**
Your credit score determines:
• Whether you get approved for loans and credit cards
• What interest rates you'll pay
• Your insurance premiums
• Rental applications
• Sometimes even job opportunities

**Score Ranges:**
• 800-850: Excellent
• 740-799: Very Good
• 670-739: Good
• 580-669: Fair
• 300-579: Poor
''',
      keyPoints: [
        'Credit scores range from 300-850',
        'Higher scores mean better loan terms',
        'Used by lenders, landlords, and employers',
        'Based on payment history, utilization, length of credit, and more'
      ],
    ),
    Lesson(
      id: 'lesson_2',
      title: 'Factors Affecting Credit',
      description: 'Learn what impacts your credit score the most',
      duration: '10 min',
      icon: Icons.analytics,
      detailedDescription: '''
Your credit score is determined by five main factors, each with different weightings in the calculation.

**Payment History (35%):**
• Most important factor - 35% of your score
• Records whether you pay bills on time
• Late payments, collections, and bankruptcies hurt your score
• Even one 30-day late payment can significantly impact your score

**Credit Utilization (30%):**
• Second most important - 30% of your score
• Ratio of your credit card balances to credit limits
• Keep below 30% for optimal scores
• Below 10% is even better
• Applies to individual cards and overall utilization

**Credit History Length (15%):**
• How long you've had credit accounts
• Average age of all accounts matters
• Older accounts help your score
• Don't close old credit cards unnecessarily

**Credit Mix (10%):**
• Variety of credit types
• Includes credit cards, mortgages, auto loans, student loans
• Shows you can handle different types of credit
• Don't open accounts just for mix

**New Credit (10%):**
• Recent credit applications and inquiries
• Multiple applications in short period can hurt
• Rate shopping for same type of loan is treated as single inquiry
• Space out credit applications
''',
      keyPoints: [
        'Payment history is 35% of your score',
        'Credit utilization should be below 30%',
        'Longer credit history improves scores',
        'Multiple credit applications can lower scores'
      ],
    ),
    Lesson(
      id: 'lesson_3',
      title: 'Building Good Credit',
      description: 'Strategies to establish and improve your credit',
      duration: '12 min',
      icon: Icons.trending_up,
      detailedDescription: '''
Building and maintaining good credit requires consistent, responsible financial behavior over time.

**Starting from Scratch:**
• Get a secured credit card with a small deposit
• Become an authorized user on someone else's account
• Apply for a credit-builder loan
• Use rent reporting services

**Improving Existing Credit:**
• Pay all bills on time, every time
• Keep credit card balances low
• Don't close old credit cards
• Limit new credit applications
• Dispute errors on your credit reports

**Maintaining Excellent Credit:**
• Set up automatic payments for minimum amounts
• Monitor your credit regularly
• Keep utilization below 10%
• Maintain a mix of credit types
• Review credit reports annually

**Common Mistakes to Avoid:**
• Maxing out credit cards
• Closing old accounts
• Applying for multiple cards at once
• Ignoring bills or collections
• Co-signing loans without understanding risks
''',
      keyPoints: [
        'Start with secured cards or authorized user status',
        'Always pay bills on time',
        'Keep credit utilization low',
        'Monitor credit reports regularly'
      ],
    ),
    Lesson(
      id: 'lesson_4',
      title: 'Credit Reports',
      description: 'How to read and understand credit reports',
      duration: '15 min',
      icon: Icons.description,
      detailedDescription: '''
Credit reports contain your detailed credit history and are used to calculate your credit scores.

**What's in a Credit Report:**
• Personal information (name, address, SSN)
• Credit accounts (cards, loans, mortgages)
• Payment history
• Credit inquiries
• Public records (bankruptcies, liens)
• Collection accounts

**The Three Major Bureaus:**
1. **Equifax** - One of the three national credit bureaus
2. **Experian** - Another major credit reporting agency
3. **TransUnion** - The third national credit bureau

**Getting Your Reports:**
• Free annual reports from AnnualCreditReport.com
• One from each bureau every 12 months
• Space them out to monitor throughout the year
• Additional free reports in some situations

**Reading Your Report:**
• Check personal information for accuracy
• Review all accounts - are they yours?
• Verify payment history is correct
• Look for unauthorized inquiries
• Identify any errors or fraudulent activity

**Disputing Errors:**
• File disputes with the credit bureaus
• Provide documentation to support your claim
• Bureaus have 30 days to investigate
• Errors must be corrected or deleted
''',
      keyPoints: [
        'Three major credit bureaus: Equifax, Experian, TransUnion',
        'Get free annual reports from AnnualCreditReport.com',
        'Review reports for errors and fraud',
        'Dispute inaccuracies promptly'
      ],
    ),
    Lesson(
      id: 'lesson_5',
      title: 'Managing Debt',
      description: 'Effective debt management and reduction strategies',
      duration: '14 min',
      icon: Icons.money_off,
      detailedDescription: '''
Effective debt management is crucial for financial health and maintaining good credit.

**Understanding Your Debt:**
• List all debts with amounts, interest rates, and minimum payments
• Calculate total debt and monthly payments
• Identify highest interest rate debts
• Understand the impact on your credit score

**Debt Payoff Strategies:**

**Snowball Method:**
• Pay minimums on all debts
• Put extra money toward smallest debt first
• Roll payments to next smallest when paid off
• Psychological wins keep you motivated

**Avalanche Method:**
• Pay minimums on all debts
• Put extra money toward highest interest debt
• Mathematically saves the most money
• Takes discipline but is most efficient

**Debt Consolidation:**
• Combine multiple debts into one payment
• Balance transfer credit cards
• Personal loans
• Home equity loans
• Can simplify payments and lower interest

**When to Seek Help:**
• Credit counseling services
• Debt management plans
• Debt settlement companies
• Bankruptcy as last resort
''',
      keyPoints: [
        'Snowball method: pay smallest debts first',
        'Avalanche method: pay highest interest first',
        'Debt consolidation can simplify payments',
        'Seek professional help if overwhelmed'
      ],
    ),
    Lesson(
      id: 'lesson_6',
      title: 'Credit Cards & Utilization',
      description: 'Smart credit card usage and utilization management',
      duration: '11 min',
      icon: Icons.credit_card,
      detailedDescription: '''
Credit cards are powerful financial tools when used responsibly but can quickly lead to debt if mismanaged.

**Smart Credit Card Usage:**
• Use cards for planned purchases you can pay off
• Pay statement balance in full each month
• Understand your card's terms and fees
• Use rewards programs wisely
• Keep track of spending

**Credit Utilization Management:**
• Keep individual card utilization below 30%
• Aim for overall utilization below 10%
• Pay down balances before statement closing date
• Consider multiple payments per month
• Request credit limit increases (if responsible)

**Choosing the Right Card:**
• Secured cards for building credit
• Cash back cards for everyday spending
• Travel cards for frequent travelers
• Balance transfer cards for debt consolidation
• Student cards for building credit history

**Avoiding Common Pitfalls:**
• Don't max out credit cards
• Avoid cash advances (high fees/interest)
• Don't use cards for impulse purchases
• Understand grace periods
• Watch for annual fees and penalty APRs
''',
      keyPoints: [
        'Pay credit card balances in full each month',
        'Keep credit utilization below 30%',
        'Choose cards that match your spending habits',
        'Avoid cash advances and high fees'
      ],
    ),
    Lesson(
      id: 'lesson_7',
      title: 'Loans & Mortgages',
      description: 'Understanding different types of loans and their impact',
      duration: '13 min',
      icon: Icons.home,
      detailedDescription: '''
Different types of loans serve different purposes and affect your credit in various ways.

**Types of Loans:**

**Installment Loans:**
• Fixed payments over set period
• Auto loans, personal loans, student loans
• Help credit mix when paid responsibly
• Multiple applications can hurt score temporarily

**Revolving Credit:**
• Credit cards, lines of credit
• Flexible borrowing limits
• High impact on credit utilization
• Requires careful management

**Mortgages:**
• Largest loan most people will ever have
• Strict qualification requirements
• Typically require 620+ credit score
• Rate shopping within 45 days counts as one inquiry

**Loan Qualification:**
• Credit score requirements vary by lender
• Debt-to-income ratio matters
• Employment history and income stability
• Down payment requirements

**Impact on Credit:**
• New loans cause temporary score drops
• Multiple inquiries for same purpose are combined
• Payment history is crucial
• Closing accounts can affect credit age
''',
      keyPoints: [
        'Different loans serve different purposes',
        'Mortgages have strict qualification requirements',
        'Multiple loan inquiries are combined when rate shopping',
        'Payment history affects all types of credit'
      ],
    ),
    Lesson(
      id: 'lesson_8',
      title: 'Credit Monitoring',
      description: 'Tools and techniques for ongoing credit monitoring',
      duration: '9 min',
      icon: Icons.security,
      detailedDescription: '''
Regular credit monitoring helps protect your financial health and catch problems early.

**Why Monitor Your Credit:**
• Detect identity theft early
• Catch errors on credit reports
• Track your credit improvement progress
• Prepare for major purchases
• Ensure accuracy of your financial records

**Monitoring Methods:**

**Free Monitoring Services:**
• Credit card company提供的免费分数监控
• Bank-provided credit scores
• Credit Karma, Credit Sesame
• Annual credit report reviews

**Paid Monitoring Services:**
• Three-bureau monitoring
• Identity theft protection
• Real-time alerts
• Credit score simulators

**DIY Monitoring:**
• Review statements monthly
• Check credit reports quarterly
• Set up fraud alerts
• Use credit freezes when necessary

**Identity Theft Protection:**
• Place fraud alerts with all three bureaus
• Consider credit freezes
• Monitor financial statements closely
• Report suspicious activity immediately
''',
      keyPoints: [
        'Monitor credit regularly for errors and fraud',
        'Use free services from banks and credit cards',
        'Set up fraud alerts for protection',
        'Review all three credit reports annually'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Modules'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: _showProgressInfo,
            tooltip: 'Progress Info',
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Header
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learning Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${widget.completedLessons.length}/${_lessons.length} lessons completed',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${((widget.completedLessons.length / _lessons.length) * 100).toInt()}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _lessons.length,
              itemBuilder: (context, index) {
                final lesson = _lessons[index];
                final isCompleted = widget.completedLessons.contains(lesson.id);
                final isNextLesson = _getNextLessonIndex() == index;
                final isLocked = !isCompleted && !isNextLesson;

                return LessonCard(
                  lesson: lesson,
                  isCompleted: isCompleted,
                  isNextLesson: isNextLesson,
                  isLocked: isLocked,
                  onTap: () {
                    if (isNextLesson || isCompleted) {
                      _navigateToLessonDetails(context, lesson, isCompleted);
                    } else if (isLocked) {
                      _showLockedMessage(context);
                    }
                  },
                  isDarkMode: isDark,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getNextLessonIndex() {
    for (int i = 0; i < _lessons.length; i++) {
      if (!widget.completedLessons.contains(_lessons[i].id)) {
        return i;
      }
    }
    return _lessons.length; // All lessons completed
  }

  void _navigateToLessonDetails(BuildContext context, Lesson lesson, bool isCompleted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonDetailPage(
          lesson: lesson,
          isCompleted: isCompleted,
          onComplete: () {
            if (!isCompleted && widget.onLessonComplete != null) {
              widget.onLessonComplete!(lesson.id);
            }
            Navigator.pop(context);
            setState(() {});
          },
        ),
      ),
    );
  }

  void _showLockedMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lesson Locked 🔒'),
        content: Text('Complete previous lessons to unlock this one. Focus on mastering each concept before moving forward.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Got It'),
          ),
        ],
      ),
    );
  }

  void _showProgressInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Learning Path Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Complete lessons in order for best learning'),
            SizedBox(height: 8),
            Text('• Each lesson increases your credit score by 5 points'),
            SizedBox(height: 8),
            Text('• Master each concept before moving forward'),
            SizedBox(height: 8),
            Text('• Revisit completed lessons anytime for review'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Got It'),
          ),
        ],
      ),
    );
  }
}

class Lesson {
  final String id;
  final String title;
  final String description;
  final String duration;
  final IconData icon;
  final String detailedDescription;
  final List<String> keyPoints;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.icon,
    required this.detailedDescription,
    required this.keyPoints,
  });
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final bool isCompleted;
  final bool isNextLesson;
  final bool isLocked;
  final VoidCallback onTap;
  final bool isDarkMode;

  const LessonCard({
    Key? key,
    required this.lesson,
    required this.isCompleted,
    required this.isNextLesson,
    required this.isLocked,
    required this.onTap,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subtitleColor = isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;
    final lockedColor = isDarkMode ? Colors.grey[600]! : Colors.grey;

    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shadowColor: isDarkMode ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.1),
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isDarkMode
            ? BorderSide(color: Colors.grey[700]!, width: 1)
            : BorderSide.none,
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green.withOpacity(isDarkMode ? 0.3 : 0.2)
                : isNextLesson
                ? Colors.blue.withOpacity(isDarkMode ? 0.3 : 0.2)
                : (isDarkMode ? Colors.grey[700]! : Colors.grey).withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isCompleted
                  ? Colors.green
                  : isNextLesson
                  ? Colors.blue
                  : (isDarkMode ? Colors.grey[600]! : Colors.grey),
              width: 2,
            ),
          ),
          child: Icon(
            lesson.icon,
            color: isCompleted
                ? Colors.green
                : isNextLesson
                ? Colors.blue
                : (isDarkMode ? Colors.grey[400]! : Colors.grey),
          ),
        ),
        title: Text(
          lesson.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isLocked ? lockedColor : textColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.description,
              style: TextStyle(
                color: isLocked ? lockedColor : subtitleColor,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.schedule, size: 12, color: isLocked ? lockedColor : subtitleColor),
                SizedBox(width: 4),
                Text(
                  lesson.duration,
                  style: TextStyle(
                    color: isLocked ? lockedColor : subtitleColor,
                    fontSize: 12,
                  ),
                ),
                if (isCompleted) ...[
                  SizedBox(width: 12),
                  Icon(Icons.check_circle, size: 12, color: Colors.green),
                  SizedBox(width: 4),
                  Text(
                    'Completed',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        trailing: _buildTrailingIcon(),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildTrailingIcon() {
    if (isCompleted) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check, color: Colors.green, size: 16),
            SizedBox(width: 4),
            Text(
              'Done',
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else if (isNextLesson) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_arrow, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[700]! : Colors.grey[200]!,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.lock,
          color: isDarkMode ? Colors.grey[400]! : Colors.grey[600]!,
          size: 20,
        ),
      );
    }
  }
}

// New Lesson Detail Page
class LessonDetailPage extends StatelessWidget {
  final Lesson lesson;
  final bool isCompleted;
  final VoidCallback onComplete;

  const LessonDetailPage({
    Key? key,
    required this.lesson,
    required this.isCompleted,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        actions: [
          if (!isCompleted)
            IconButton(
              icon: Icon(Icons.check_circle_outline),
              onPressed: () {
                _showCompletionDialog(context);
              },
              tooltip: 'Mark as Complete',
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(lesson.icon, color: Theme.of(context).colorScheme.primary, size: 30),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          lesson.description,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              lesson.duration,
                              style: TextStyle(color: Colors.grey),
                            ),
                            if (isCompleted) ...[
                              SizedBox(width: 16),
                              Icon(Icons.check_circle, size: 16, color: Colors.green),
                              SizedBox(width: 4),
                              Text(
                                'Completed',
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Key Points
            Text(
              'Key Takeaways:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            ...lesson.keyPoints.map((point) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 24),

            // Detailed Content
            Text(
              'Detailed Explanation:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Text(
                lesson.detailedDescription,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 32),

            // Action Button
            if (!isCompleted)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showCompletionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle),
                      SizedBox(width: 8),
                      Text(
                        'Mark as Complete',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lesson Completed! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Congratulations! You have completed "${lesson.title}".'),
            SizedBox(height: 12),
            Text('📈 +5 points to your credit score!'),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Remember: ${lesson.keyPoints.first}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onComplete();
            },
            child: Text('Continue Learning'),
          ),
        ],
      ),
    );
  }
}