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
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learning Modules',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: isDark ? Colors.transparent : Colors.white,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: _showProgressInfo,
            tooltip: 'Progress Info',
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Header
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                  primaryColor.withOpacity(0.2),
                  primaryColor.withOpacity(0.1),
                ]
                    : [
                  primaryColor.withOpacity(0.1),
                  primaryColor.withOpacity(0.05),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.school_rounded, color: primaryColor, size: 24),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learning Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '${widget.completedLessons.length}/${_lessons.length} lessons completed',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 12),
                      // Progress Bar
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: widget.completedLessons.length / _lessons.length,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [primaryColor, primaryColor.withOpacity(0.7)],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, primaryColor.withOpacity(0.8)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${((widget.completedLessons.length / _lessons.length) * 100).toInt()}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
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
          },
        ),
      ),
    ).then((_){
      if(mounted){
        setState(() {

        });
      }
    });
  }

  void _showLockedMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.lock_rounded, color: Colors.orange),
            SizedBox(width: 8),
            Text('Lesson Locked 🔒'),
          ],
        ),
        content: Text('Complete previous lessons to unlock this one. Focus on mastering each concept before moving forward.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Got It',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void _showProgressInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Learning Path Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem('• Complete lessons in order for best learning'),
            SizedBox(height: 8),
            _buildInfoItem('• Each lesson increases your credit score by 5 points'),
            SizedBox(height: 8),
            _buildInfoItem('• Master each concept before moving forward'),
            SizedBox(height: 8),
            _buildInfoItem('• Revisit completed lessons anytime for review'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Got It',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.circle, size: 6, color: Theme.of(context).colorScheme.primary),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
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

  const LessonCard({
    Key? key,
    required this.lesson,
    required this.isCompleted,
    required this.isNextLesson,
    required this.isLocked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Material(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: isDark ? 0 : 4,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: isDark
                  ? Border.all(color: Colors.grey[700]!)
                  : Border.all(color: Colors.grey[100]!),
            ),
            child: Row(
              children: [
                // Icon Container
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: _getIconGradient(),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: _getIconColor().withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    lesson.icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: isLocked
                              ? Theme.of(context).colorScheme.onBackground.withOpacity(0.4)
                              : Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        lesson.description,
                        style: TextStyle(
                          color: isLocked
                              ? Theme.of(context).colorScheme.onBackground.withOpacity(0.3)
                              : Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(context).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: _getStatusColor(context).withOpacity(0.3)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule_rounded,
                                  size: 12,
                                  color: _getStatusColor(context),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  lesson.duration,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: _getStatusColor(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isCompleted) ...[
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.green.withOpacity(0.3)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.check_rounded, size: 12, color: Colors.green),
                                  SizedBox(width: 4),
                                  Text(
                                    'Completed',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),

                // Action Button
                _buildTrailingButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient _getIconGradient() {
    if (isCompleted) {
      return LinearGradient(
        colors: [Colors.green, Colors.green.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (isNextLesson) {
      return LinearGradient(
        colors: [Colors.blue, Colors.blue.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (isLocked) {
      return LinearGradient(
        colors: [Colors.grey, Colors.grey.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      return LinearGradient(
        colors: [Colors.orange, Colors.orange.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
  }

  Color _getIconColor() {
    if (isCompleted) return Colors.green;
    if (isNextLesson) return Colors.blue;
    if (isLocked) return Colors.grey;
    return Colors.orange;
  }

  Color _getStatusColor(BuildContext context) {
    if (isLocked) return Colors.grey;
    return Theme.of(context).colorScheme.primary;
  }

  Widget _buildTrailingButton() {
    if (isCompleted) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.green.shade600],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_rounded, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Text(
              'Done',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    } else if (isNextLesson) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue.shade600],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_arrow_rounded, color: Colors.white, size: 18),
            SizedBox(width: 6),
            Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.lock_rounded,
          color: Colors.grey,
          size: 20,
        ),
      );
    }
  }
}

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
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lesson.title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: isDark ? Colors.transparent : Colors.white,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        actions: [
          if (!isCompleted)
            Container(
              margin: EdgeInsets.only(right: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  _showCompletionDialog(context);
                },
                icon: Icon(Icons.check_circle_rounded, size: 18),
                label: Text('Complete'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Header
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    primaryColor.withOpacity(0.1),
                    primaryColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryColor, primaryColor.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(lesson.icon, color: Colors.white, size: 32),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          lesson.description,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 12),
                        // Fixed Row with Wrap to prevent overflow
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.schedule_rounded, size: 14, color: primaryColor),
                                  SizedBox(width: 6),
                                  Text(
                                    lesson.duration,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isCompleted)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_rounded, size: 14, color: Colors.green),
                                    SizedBox(width: 6),
                                    Text(
                                      'Completed',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Key Points
            Text(
              'Key Takeaways',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 16),
            ...lesson.keyPoints.map((point) => Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check_rounded, size: 14, color: Colors.green),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onBackground,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 32),

            // Detailed Content
            Text(
              'Detailed Explanation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.3),
                ),
              ),
              child: Text(
                lesson.detailedDescription,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.9),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Action Button
            if (!isCompleted)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    _showCompletionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_rounded),
                      SizedBox(width: 12),
                      Text(
                        'Mark as Complete',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade50,
                Colors.green.shade100,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check_rounded, color: Colors.white, size: 40),
              ),
              SizedBox(height: 20),
              Text(
                'Lesson Completed! 🎉',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.green.shade800,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Congratulations! You have completed "${lesson.title}".',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green.shade700,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.trending_up_rounded, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '+5 points to your credit score!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    onComplete(); // Call the completion callback
                    Navigator.pop(context); // Navigate back to lessons list
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Continue Learning',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}