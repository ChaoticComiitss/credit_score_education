import 'dart:math';

import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../models/user_data.dart';

class SimulatorPage extends StatefulWidget {
  final VoidCallback? onScoreUpdated;

  const SimulatorPage({Key? key, this.onScoreUpdated}) : super(key: key);

  @override
  _SimulatorPageState createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  int _currentScore = 720;
  final List<SimulationAction> _actions = [
    SimulationAction(
      title: 'Pay on time',
      description: 'Make timely payment',
      points: 20,
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    SimulationAction(
      title: 'Miss payment',
      description: 'Late or missed payment',
      points: -50,
      icon: Icons.cancel,
      color: Colors.red,
    ),
    SimulationAction(
      title: 'Open new card',
      description: 'Apply for new credit card',
      points: -10,
      icon: Icons.credit_card,
      color: Colors.orange,
    ),
    SimulationAction(
      title: 'Reduce debt',
      description: 'Pay down credit card balances',
      points: 30,
      icon: Icons.trending_down,
      color: Colors.green,
    ),
    SimulationAction(
      title: 'Increase utilization',
      description: 'Use more of available credit',
      points: -25,
      icon: Icons.warning,
      color: Colors.red,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadCurrentScore();
  }

  void _loadCurrentScore() {
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final userData = userBox.getAt(0)!;
      setState(() {
        _currentScore = userData.simulatedScore;
      });
    } else {
      final defaultUser = UserData(
        name: "User",
        simulatedScore: 720,
        xpPoints: 0,
        completedLessons: [],
        quizScores: {},
        earnedBadges: [],
        preferredCurrency: 'USD',
      );
      userBox.add(defaultUser);
    }
  }

  void _applyAction(int points) {
    setState(() {
      _currentScore = (_currentScore + points).clamp(300, 850);
    });

    // Update score in database
    _updateSimulatedScore(_currentScore);

    // Notify parent widget about score update
    if (widget.onScoreUpdated != null) {
      widget.onScoreUpdated!();
    }
  }

  void _updateSimulatedScore(int newScore) {
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0)!;
      user.simulatedScore = newScore;
      userBox.putAt(0, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.grey[50]!;
    final subtitleColor = isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;

    final scoreRange = _getScoreRange(_currentScore);

    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Simulator'),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          _buildHorizontalMeter(isDarkMode, textColor, cardColor, subtitleColor, scoreRange),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _actions.length,
              itemBuilder: (context, index) {
                return ActionCard(
                  action: _actions[index],
                  onTap: () => _applyAction(_actions[index].points),
                  isDarkMode: isDarkMode,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalMeter(bool isDarkMode, Color textColor, Color cardColor, Color subtitleColor, Map<String, dynamic> scoreRange) {
    final availableWidth = MediaQuery.of(context).size.width - 72;

    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Current Credit Score',
              style: TextStyle(
                fontSize: 18,
                color: subtitleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: _getScoreColor(_currentScore).withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: _getScoreColor(_currentScore),
                  width: 2,
                ),
              ),
              child: Text(
                '$_currentScore',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: _getScoreColor(_currentScore),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              scoreRange['label'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: scoreRange['color'],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              child: Stack(
                children: [
                  Positioned(
                    top: 25,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.orange,
                            Colors.yellow,
                            Colors.green,
                          ],
                          stops: [0.0, 0.4, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                  _buildMovingCircle(isDarkMode, availableWidth),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: _buildNumberLabels(isDarkMode),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovingCircle(bool isDarkMode, double availableWidth) {
    final circleRadius = 15.0;
    final horizontalPadding = 20.0;
    final trackWidth = availableWidth - (horizontalPadding * 2);
    final percentage = (_currentScore - 300) / (850 - 300);
    final circleCenterPosition = horizontalPadding + (percentage * trackWidth);

    return Positioned(
      top: 15,
      left: circleCenterPosition - circleRadius,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: _getScoreColor(_currentScore),
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _getScoreColor(_currentScore),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberLabels(bool isDarkMode) {
    final textColor = isDarkMode ? Colors.white70 : Colors.grey[700]!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('300', style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w500)),
        Text('500', style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w500)),
        Text('600', style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w500)),
        Text('700', style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w500)),
        Text('850', style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 700) return Colors.green;
    if (score >= 600) return Colors.yellow;
    if (score >= 500) return Colors.orange;
    return Colors.red;
  }

  Map<String, dynamic> _getScoreRange(int score) {
    if (score >= 700) {
      return {'label': 'Excellent', 'color': Colors.green};
    } else if (score >= 600) {
      return {'label': 'Good', 'color': Colors.yellow};
    } else if (score >= 500) {
      return {'label': 'Average', 'color': Colors.orange};
    } else {
      return {'label': 'Poor', 'color': Colors.red};
    }
  }
}

class SimulationAction {
  final String title;
  final String description;
  final int points;
  final IconData icon;
  final Color color;

  SimulationAction({
    required this.title,
    required this.description,
    required this.points,
    required this.icon,
    required this.color,
  });
}

class ActionCard extends StatelessWidget {
  final SimulationAction action;
  final VoidCallback onTap;
  final bool isDarkMode;

  const ActionCard({
    Key? key,
    required this.action,
    required this.onTap,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subtitleColor = isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: cardColor,
      elevation: 2,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: action.color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(
              color: action.color.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: Icon(action.icon, color: action.color),
        ),
        title: Text(
          action.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        subtitle: Text(
          action.description,
          style: TextStyle(color: subtitleColor),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: action.points > 0 ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            '${action.points > 0 ? '+' : ''}${action.points}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}