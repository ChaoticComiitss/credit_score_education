import 'package:flutter/material.dart';
import 'quiz_game_page.dart';

class QuizCategoriesPage extends StatelessWidget {
  const QuizCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Quizzes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Test Your Knowledge',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Choose a category to start learning',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  QuizCategoryCard(
                    title: 'Credit Basics',
                    description: 'Fundamental concepts for beginners',
                    icon: '📚',
                    questionCount: 8,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizGamePage(
                            category: 'Credit Basics',
                            questions: _basicQuestions,
                          ),
                        ),
                      );
                    },
                  ),
                  QuizCategoryCard(
                    title: 'Score Myths',
                    description: 'Debunk common misconceptions',
                    icon: '🧠',
                    questionCount: 7,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizGamePage(
                            category: 'Score Myths',
                            questions: _mythQuestions,
                          ),
                        ),
                      );
                    },
                  ),
                  QuizCategoryCard(
                    title: 'Advanced Tips',
                    description: 'Expert strategies for optimization',
                    icon: '🚀',
                    questionCount: 6,
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizGamePage(
                            category: 'Advanced Tips',
                            questions: _advancedQuestions,
                          ),
                        ),
                      );
                    },
                  ),
                  QuizCategoryCard(
                    title: 'Quick Challenge',
                    description: '5 random questions from all categories',
                    icon: '⚡',
                    questionCount: 5,
                    color: Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizGamePage(
                            category: 'Quick Challenge',
                            questions: _quickChallengeQuestions,
                          ),
                        ),
                      );
                    },
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

class QuizCategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final int questionCount;
  final Color color;
  final VoidCallback onTap;

  const QuizCategoryCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.questionCount,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    icon,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(width: 16),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '$questionCount questions',
                      style: TextStyle(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Start Button
              Icon(Icons.arrow_forward_ios_rounded, color: color, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Sample questions for each category
final List<QuizQuestion> _basicQuestions = [
  QuizQuestion(
    question: 'What is the highest possible credit score?',
    options: ['850', '800', '750', '900'],
    correctAnswerIndex: 0,
    explanation: 'The FICO score ranges from 300 to 850, with 850 being the highest possible score.',
  ),
  QuizQuestion(
    question: 'What percentage of your credit score is payment history?',
    options: ['35%', '25%', '15%', '45%'],
    correctAnswerIndex: 0,
    explanation: 'Payment history is the most important factor, making up 35% of your FICO score.',
  ),
  // Add more questions...
];

final List<QuizQuestion> _mythQuestions = [
  QuizQuestion(
    question: 'Checking your own credit score lowers it.',
    options: ['True', 'False', 'Sometimes', 'Only for new accounts'],
    correctAnswerIndex: 1,
    explanation: 'Checking your own credit is a "soft inquiry" and does not affect your score.',
  ),
  // Add more questions...
];

final List<QuizQuestion> _advancedQuestions = [
  QuizQuestion(
    question: 'What is the ideal credit utilization ratio?',
    options: ['Below 30%', 'Below 50%', 'Below 70%', 'Below 10%'],
    correctAnswerIndex: 0,
    explanation: 'Experts recommend keeping your credit utilization below 30% for optimal scores.',
  ),
  // Add more questions...
];

final List<QuizQuestion> _quickChallengeQuestions = [
  // Mix of questions from all categories
  ..._basicQuestions.take(2),
  ..._mythQuestions.take(2),
  ..._advancedQuestions.take(1),
];