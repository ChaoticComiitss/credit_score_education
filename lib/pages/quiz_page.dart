// import 'package:flutter/material.dart';
// import '../services/database_service.dart';
// import 'quiz_game_page.dart';
//
// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   final List<QuizCategory> _categories = [
//     QuizCategory(
//       title: 'Credit Basics',
//       description: 'Fundamental concepts about credit scores and reports',
//       icon: Icons.credit_card,
//       color: Colors.blue,
//       difficulty: 'Beginner',
//       questions: [
//         QuizQuestion(
//           question: 'What is a credit score?',
//           options: [
//             'A measure of your creditworthiness',
//             'The amount of money you have in the bank',
//             'Your annual income',
//             'The number of credit cards you own'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'A credit score is a numerical representation of your creditworthiness based on your credit history. Lenders use it to assess your risk as a borrower.',
//         ),
//         QuizQuestion(
//           question: 'What is the typical range for FICO scores?',
//           options: [
//             '300-850',
//             '200-800',
//             '400-900',
//             '100-1000'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'FICO scores typically range from 300 to 850, with higher scores indicating better creditworthiness. 800+ is considered excellent.',
//         ),
//         QuizQuestion(
//           question: 'How long does negative information stay on your credit report?',
//           options: [
//             '7 years',
//             '5 years',
//             '10 years',
//             '3 years'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Most negative information (late payments, collections) stays on your credit report for 7 years. Bankruptcy can stay for up to 10 years.',
//         ),
//         QuizQuestion(
//           question: 'What is the minimum credit score typically needed for a conventional mortgage?',
//           options: [
//             '620',
//             '580',
//             '700',
//             '650'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Most conventional mortgages require a minimum credit score of 620, though better rates are available with scores of 740 or higher.',
//         ),
//       ],
//     ),
//     QuizCategory(
//       title: 'Payment History',
//       description: 'How payments and credit utilization affect your score',
//       icon: Icons.payment,
//       color: Colors.green,
//       difficulty: 'Intermediate',
//       questions: [
//         QuizQuestion(
//           question: 'How much does payment history typically affect your credit score?',
//           options: [
//             '35%',
//             '25%',
//             '15%',
//             '45%'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Payment history is the most important factor, typically accounting for 35% of your FICO score. Always pay on time!',
//         ),
//         QuizQuestion(
//           question: 'What is the recommended credit utilization ratio?',
//           options: [
//             'Below 30%',
//             'Below 50%',
//             'Below 75%',
//             'Below 10%'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Keeping your credit utilization below 30% is recommended for optimal credit scores. Below 10% is even better.',
//         ),
//         QuizQuestion(
//           question: 'How soon can a late payment affect your credit score?',
//           options: [
//             'After 30 days late',
//             'Immediately when late',
//             'After 60 days late',
//             'After 15 days late'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Payments reported as 30 days late can negatively impact your score. Always pay at least the minimum by the due date.',
//         ),
//       ],
//     ),
//     QuizCategory(
//       title: 'Credit Building',
//       description: 'Strategies for establishing and improving credit',
//       icon: Icons.trending_up,
//       color: Colors.orange,
//       difficulty: 'Intermediate',
//       questions: [
//         QuizQuestion(
//           question: 'What is a secured credit card?',
//           options: [
//             'A card backed by a cash deposit',
//             'A card with high security features',
//             'A government-issued credit card',
//             'A card for online purchases only'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'A secured credit card requires a cash deposit that serves as your credit limit. It\'s great for building credit when starting out.',
//         ),
//         QuizQuestion(
//           question: 'How long does it take to build good credit?',
//           options: [
//             '6-12 months of responsible use',
//             '1 month',
//             '3 years',
//             '5 years'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'With consistent, responsible credit behavior, you can establish a good credit history within 6-12 months.',
//         ),
//         QuizQuestion(
//           question: 'What is credit mix and how does it affect your score?',
//           options: [
//             'Having different types of credit accounts',
//             'Using multiple credit cards',
//             'Having credit from different banks',
//             'Mixing personal and business credit'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Credit mix (10% of score) refers to having different types of credit like installment loans and revolving credit, showing you can manage various credit types.',
//         ),
//       ],
//     ),
//     QuizCategory(
//       title: 'Advanced Concepts',
//       description: 'Complex credit scenarios and advanced strategies',
//       icon: Icons.analytics,
//       color: Colors.purple,
//       difficulty: 'Advanced',
//       questions: [
//         QuizQuestion(
//           question: 'What is a credit inquiry and how long does it affect your score?',
//           options: [
//             'When lenders check your credit - 2 years',
//             'When you check your own credit - 1 year',
//             'When you apply for credit - 6 months',
//             'When credit is denied - 3 years'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Hard inquiries (when lenders check your credit for applications) stay on your report for 2 years but only affect your score for 1 year.',
//         ),
//         QuizQuestion(
//           question: 'What is the difference between FICO and VantageScore?',
//           options: [
//             'Different scoring models by different companies',
//             'FICO is for mortgages, Vantage for credit cards',
//             'FICO is older, Vantage is newer',
//             'They are the same thing'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'FICO and VantageScore are different scoring models created by different companies. FICO is more widely used by lenders.',
//         ),
//         QuizQuestion(
//           question: 'How can you quickly improve your credit score?',
//           options: [
//             'Pay down credit card balances',
//             'Close old accounts',
//             'Apply for multiple new cards',
//             'Ignore collection accounts'
//           ],
//           correctAnswerIndex: 0,
//           explanation: 'Paying down credit card balances to lower utilization is one of the fastest ways to improve your score. Closing accounts can actually hurt your score.',
//         ),
//       ],
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Credit Quizzes'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.leaderboard),
//             onPressed: _showQuizStats,
//             tooltip: 'Quiz Statistics',
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Quiz Info Card
//           Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//               border: Border(
//                 bottom: BorderSide(
//                   color: Theme.of(context).dividerColor,
//                   width: 1,
//                 ),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.quiz, color: Theme.of(context).colorScheme.primary),
//                 SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Test Your Credit Knowledge',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Complete quizzes to reinforce learning and earn XP',
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.all(16),
//               itemCount: _categories.length,
//               itemBuilder: (context, index) {
//                 return QuizCategoryCard(
//                   category: _categories[index],
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => QuizGamePage(
//                           category: _categories[index].title,
//                           questions: _categories[index].questions,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showQuizStats() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Quiz Statistics'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildStatItem('Total Categories', '${_categories.length}'),
//             _buildStatItem('Total Questions', '${_getTotalQuestions()}'),
//             _buildStatItem('Difficulty Levels', 'Beginner to Advanced'),
//             SizedBox(height: 16),
//             Text(
//               'Tips:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text('• Start with beginner categories'),
//             Text('• Review explanations for wrong answers'),
//             Text('• Retake quizzes to improve scores'),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Got It'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatItem(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label),
//           Text(
//             value,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   int _getTotalQuestions() {
//     return _categories.fold(0, (total, category) => total + category.questions.length);
//   }
// }
//
// class QuizCategory {
//   final String title;
//   final String description;
//   final IconData icon;
//   final Color color;
//   final String difficulty;
//   final List<QuizQuestion> questions;
//
//   QuizCategory({
//     required this.title,
//     required this.description,
//     required this.icon,
//     required this.color,
//     required this.difficulty,
//     required this.questions,
//   });
// }
//
// class QuizCategoryCard extends StatelessWidget {
//   final QuizCategory category;
//   final VoidCallback onTap;
//
//   const QuizCategoryCard({
//     Key? key,
//     required this.category,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       elevation: 3,
//       child: ListTile(
//         leading: Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             color: category.color.withOpacity(0.2),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(category.icon, color: category.color),
//         ),
//         title: Text(
//           category.title,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(category.description),
//             SizedBox(height: 4),
//             Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: _getDifficultyColor(category.difficulty),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     category.difficulty,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Icon(Icons.help_outline, size: 12, color: Colors.grey),
//                 SizedBox(width: 4),
//                 Text(
//                   '${category.questions.length} questions',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: Container(
//           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//           decoration: BoxDecoration(
//             color: category.color,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(Icons.play_arrow, color: Colors.white, size: 16),
//               SizedBox(width: 4),
//               Text(
//                 'Start',
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
//
//   Color _getDifficultyColor(String difficulty) {
//     switch (difficulty.toLowerCase()) {
//       case 'beginner':
//         return Colors.green;
//       case 'intermediate':
//         return Colors.orange;
//       case 'advanced':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }
// }
import 'package:flutter/material.dart';
import '../services/database_service.dart';
import 'quiz_game_page.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<QuizCategory> _categories = [
    QuizCategory(
      title: 'Credit Basics',
      description: 'Fundamental concepts about credit scores and reports',
      icon: Icons.credit_card,
      color: Colors.blue,
      difficulty: 'Beginner',
      questions: [
        QuizQuestion(
          question: 'What is a credit score?',
          options: [
            'A measure of your creditworthiness',
            'The amount of money you have in the bank',
            'Your annual income',
            'The number of credit cards you own'
          ],
          correctAnswerIndex: 0,
          explanation: 'A credit score is a numerical representation of your creditworthiness based on your credit history. Lenders use it to assess your risk as a borrower.',
        ),
        QuizQuestion(
          question: 'What is the typical range for FICO scores?',
          options: [
            '300-850',
            '200-800',
            '400-900',
            '100-1000'
          ],
          correctAnswerIndex: 0,
          explanation: 'FICO scores typically range from 300 to 850, with higher scores indicating better creditworthiness. 800+ is considered excellent.',
        ),
        QuizQuestion(
          question: 'How long does negative information stay on your credit report?',
          options: [
            '7 years',
            '5 years',
            '10 years',
            '3 years'
          ],
          correctAnswerIndex: 0,
          explanation: 'Most negative information (late payments, collections) stays on your credit report for 7 years. Bankruptcy can stay for up to 10 years.',
        ),
        QuizQuestion(
          question: 'What is the minimum credit score typically needed for a conventional mortgage?',
          options: [
            '620',
            '580',
            '700',
            '650'
          ],
          correctAnswerIndex: 0,
          explanation: 'Most conventional mortgages require a minimum credit score of 620, though better rates are available with scores of 740 or higher.',
        ),
      ],
    ),
    QuizCategory(
      title: 'Payment History',
      description: 'How payments and credit utilization affect your score',
      icon: Icons.payment,
      color: Colors.green,
      difficulty: 'Intermediate',
      questions: [
        QuizQuestion(
          question: 'How much does payment history typically affect your credit score?',
          options: [
            '35%',
            '25%',
            '15%',
            '45%'
          ],
          correctAnswerIndex: 0,
          explanation: 'Payment history is the most important factor, typically accounting for 35% of your FICO score. Always pay on time!',
        ),
        QuizQuestion(
          question: 'What is the recommended credit utilization ratio?',
          options: [
            'Below 30%',
            'Below 50%',
            'Below 75%',
            'Below 10%'
          ],
          correctAnswerIndex: 0,
          explanation: 'Keeping your credit utilization below 30% is recommended for optimal credit scores. Below 10% is even better.',
        ),
        QuizQuestion(
          question: 'How soon can a late payment affect your credit score?',
          options: [
            'After 30 days late',
            'Immediately when late',
            'After 60 days late',
            'After 15 days late'
          ],
          correctAnswerIndex: 0,
          explanation: 'Payments reported as 30 days late can negatively impact your score. Always pay at least the minimum by the due date.',
        ),
      ],
    ),
    QuizCategory(
      title: 'Credit Building',
      description: 'Strategies for establishing and improving credit',
      icon: Icons.trending_up,
      color: Colors.orange,
      difficulty: 'Intermediate',
      questions: [
        QuizQuestion(
          question: 'What is a secured credit card?',
          options: [
            'A card backed by a cash deposit',
            'A card with high security features',
            'A government-issued credit card',
            'A card for online purchases only'
          ],
          correctAnswerIndex: 0,
          explanation: 'A secured credit card requires a cash deposit that serves as your credit limit. It\'s great for building credit when starting out.',
        ),
        QuizQuestion(
          question: 'How long does it take to build good credit?',
          options: [
            '6-12 months of responsible use',
            '1 month',
            '3 years',
            '5 years'
          ],
          correctAnswerIndex: 0,
          explanation: 'With consistent, responsible credit behavior, you can establish a good credit history within 6-12 months.',
        ),
        QuizQuestion(
          question: 'What is credit mix and how does it affect your score?',
          options: [
            'Having different types of credit accounts',
            'Using multiple credit cards',
            'Having credit from different banks',
            'Mixing personal and business credit'
          ],
          correctAnswerIndex: 0,
          explanation: 'Credit mix (10% of score) refers to having different types of credit like installment loans and revolving credit, showing you can manage various credit types.',
        ),
      ],
    ),
    QuizCategory(
      title: 'Advanced Concepts',
      description: 'Complex credit scenarios and advanced strategies',
      icon: Icons.analytics,
      color: Colors.purple,
      difficulty: 'Advanced',
      questions: [
        QuizQuestion(
          question: 'What is a credit inquiry and how long does it affect your score?',
          options: [
            'When lenders check your credit - 2 years',
            'When you check your own credit - 1 year',
            'When you apply for credit - 6 months',
            'When credit is denied - 3 years'
          ],
          correctAnswerIndex: 0,
          explanation: 'Hard inquiries (when lenders check your credit for applications) stay on your report for 2 years but only affect your score for 1 year.',
        ),
        QuizQuestion(
          question: 'What is the difference between FICO and VantageScore?',
          options: [
            'Different scoring models by different companies',
            'FICO is for mortgages, Vantage for credit cards',
            'FICO is older, Vantage is newer',
            'They are the same thing'
          ],
          correctAnswerIndex: 0,
          explanation: 'FICO and VantageScore are different scoring models created by different companies. FICO is more widely used by lenders.',
        ),
        QuizQuestion(
          question: 'How can you quickly improve your credit score?',
          options: [
            'Pay down credit card balances',
            'Close old accounts',
            'Apply for multiple new cards',
            'Ignore collection accounts'
          ],
          correctAnswerIndex: 0,
          explanation: 'Paying down credit card balances to lower utilization is one of the fastest ways to improve your score. Closing accounts can actually hurt your score.',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Quizzes'),
        actions: [
          IconButton(
            icon: Icon(Icons.leaderboard),
            onPressed: _showQuizStats,
            tooltip: 'Quiz Statistics',
          ),
        ],
      ),
      body: Column(
        children: [
          // Quiz Info Card
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                  Colors.blueGrey[800]!,
                  Colors.blueGrey[900]!,
                ]
                    : [
                  primaryColor.withOpacity(0.1),
                  primaryColor.withOpacity(0.05),
                ],
              ),
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
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
                  child: Icon(Icons.quiz, color: primaryColor),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Test Your Credit Knowledge',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Complete quizzes to reinforce learning and earn XP',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return QuizCategoryCard(
                  category: _categories[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizGamePage(
                          category: _categories[index].title,
                          questions: _categories[index].questions,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showQuizStats() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Statistics'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatItem('Total Categories', '${_categories.length}'),
            _buildStatItem('Total Questions', '${_getTotalQuestions()}'),
            _buildStatItem('Difficulty Levels', 'Beginner to Advanced'),
            SizedBox(height: 16),
            Text(
              'Tips:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Start with beginner categories'),
            Text('• Review explanations for wrong answers'),
            Text('• Retake quizzes to improve scores'),
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

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  int _getTotalQuestions() {
    return _categories.fold(0, (total, category) => total + category.questions.length);
  }
}

class QuizCategory {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String difficulty;
  final List<QuizQuestion> questions;

  QuizCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.difficulty,
    required this.questions,
  });
}

class QuizCategoryCard extends StatelessWidget {
  final QuizCategory category;
  final VoidCallback onTap;

  const QuizCategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color cardColor = isDark ? Colors.grey[800]! : Colors.white;
    final Color textColor = isDark ? Colors.white : Colors.black87;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: isDark ? 2 : 4,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon Container
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor.withOpacity(0.8),
                      primaryColor.withOpacity(0.4),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  category.icon,
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
                      category.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      category.description,
                      style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        // Difficulty Badge
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getDifficultyColor(category.difficulty),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            category.difficulty,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        // Question Count
                        Row(
                          children: [
                            Icon(Icons.help_outline, size: 14, color: textColor.withOpacity(0.6)),
                            SizedBox(width: 4),
                            Text(
                              '${category.questions.length} Qs',
                              style: TextStyle(
                                fontSize: 12,
                                color: textColor.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Start Button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor,
                      primaryColor.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return Colors.green.shade200;
      case 'intermediate':
        return Colors.orange.shade200;
      case 'advanced':
        return Colors.red.shade200;
      default:
        return Colors.grey;
    }
  }
}