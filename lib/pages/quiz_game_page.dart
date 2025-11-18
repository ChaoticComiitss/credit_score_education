import 'package:flutter/material.dart';
import '../services/database_service.dart';

class QuizGamePage extends StatefulWidget {
  final String category;
  final List<QuizQuestion> questions;

  const QuizGamePage({
    Key? key,
    required this.category,
    required this.questions,
  }) : super(key: key);

  @override
  _QuizGamePageState createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;
  bool _showExplanation = false;
  int? _selectedAnswerIndex;
  List<bool> _answeredQuestions = [];

  @override
  void initState() {
    super.initState();
    _answeredQuestions = List.filled(widget.questions.length, false);
  }

  void _answerQuestion(int selectedIndex) {
    if (_answeredQuestions[_currentQuestionIndex]) return;

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _showExplanation = true;
      _answeredQuestions[_currentQuestionIndex] = true;
    });

    if (selectedIndex == widget.questions[_currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        _score++;
      });
    }

    Future.delayed(Duration(seconds: 2), () {
      if (_currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _showExplanation = false;
          _selectedAnswerIndex = null;
        });
      } else {
        _completeQuiz();
      }
    });
  }

  void _completeQuiz() {
    setState(() {
      _quizCompleted = true;
    });

    // Award XP based on performance
    final percentage = (_score / widget.questions.length * 100).round();
    int xpEarned = 0;

    if (percentage >= 80) {
      xpEarned = 30;
    } else if (percentage >= 60) {
      xpEarned = 20;
    } else {
      xpEarned = 10;
    }

    // Update user XP and quiz score
    _updateUserProgress(xpEarned);
  }

  void _updateUserProgress(int xpEarned) {
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0)!;
      user.xpPoints += xpEarned;
      user.quizScores[widget.category] = _score;
      userBox.putAt(0, user);
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
      _showExplanation = false;
      _selectedAnswerIndex = null;
      _answeredQuestions = List.filled(widget.questions.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_quizCompleted) {
      return _buildResultsScreen();
    }

    final question = widget.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_currentQuestionIndex + 1}/${widget.questions.length}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / widget.questions.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),

            // Question
            Text(
              question.question,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
            SizedBox(height: 24),

            // Options
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return _buildOptionCard(question, index);
                },
              ),
            ),

            // Explanation
            if (_showExplanation) _buildExplanation(question),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(QuizQuestion question, int index) {
    final isSelected = _selectedAnswerIndex == index;
    final isCorrect = index == question.correctAnswerIndex;
    final isAnswered = _answeredQuestions[_currentQuestionIndex];

    Color? cardColor;
    IconData? trailingIcon;

    if (isAnswered) {
      if (isCorrect) {
        cardColor = Colors.green.withOpacity(0.1);
        trailingIcon = Icons.check_circle;
      } else if (isSelected) {
        cardColor = Colors.red.withOpacity(0.1);
        trailingIcon = Icons.cancel;
      }
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: cardColor,
      child: ListTile(
        title: Text(
          question.options[index],
          style: TextStyle(
            fontSize: 16,
            color: isAnswered && isCorrect ? Colors.green :
            isAnswered && isSelected ? Colors.red : null,
          ),
        ),
        onTap: isAnswered ? null : () => _answerQuestion(index),
        trailing: isAnswered && trailingIcon != null
            ? Icon(
          trailingIcon,
          color: isCorrect ? Colors.green : Colors.red,
        )
            : null,
      ),
    );
  }

  Widget _buildExplanation(QuizQuestion question) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explanation:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(question.explanation),
        ],
      ),
    );
  }

  Widget _buildResultsScreen() {
    final percentage = (_score / widget.questions.length * 100).round();
    String message;
    Color color;
    String badge;

    if (percentage >= 80) {
      message = 'Excellent! You\'re a credit expert! 🎉';
      color = Colors.green;
      badge = '🏆 Credit Master';
    } else if (percentage >= 60) {
      message = 'Good job! You\'re getting there! 👍';
      color = Colors.orange;
      badge = '⭐ Credit Explorer';
    } else {
      message = 'Keep learning! Review the lessons and try again. 📚';
      color = Colors.red;
      badge = '🌱 Credit Beginner';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Complete'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Badge Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 3),
              ),
              child: Icon(
                Icons.emoji_events_rounded,
                size: 60,
                color: color,
              ),
            ),
            SizedBox(height: 24),

            // Results Text
            Text(
              'Quiz Complete!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Score
            Text(
              'Your Score:',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              '$_score/${widget.questions.length} ($percentage%)',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 24),

            // Badge Earned
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color),
              ),
              child: Text(
                badge,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Message
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: color,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Back to Categories'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _restartQuiz,
                    child: Text('Try Again'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}