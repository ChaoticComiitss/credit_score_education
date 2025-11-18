import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'learning_module_page.dart';
import 'simulator_page.dart';
import 'quiz_page.dart';
import 'tips_page.dart';
import 'tools_page.dart';
import '../services/database_service.dart';
import '../models/user_data.dart';

class HomeDashboard extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomeDashboard({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _currentIndex = 0;
  String userName = ""; // Make this mutable
  int simulatedScore = 720;
  List<String> completedLessons = [];
  int totalLessons = 5;
  String _selectedCurrency = 'USD';

  final Map<String, Map<String, dynamic>> _currencies = {
    'USD': {'symbol': '\$', 'name': 'US Dollar', 'rate': 1.0},
    'EUR': {'symbol': '€', 'name': 'Euro', 'rate': 0.85},
    'GBP': {'symbol': '£', 'name': 'British Pound', 'rate': 0.73},
    'INR': {'symbol': '₹', 'name': 'Indian Rupee', 'rate': 83.0},
    'JPY': {'symbol': '¥', 'name': 'Japanese Yen', 'rate': 110.0},
    'CAD': {'symbol': 'C\$', 'name': 'Canadian Dollar', 'rate': 1.25},
    'AUD': {'symbol': 'A\$', 'name': 'Australian Dollar', 'rate': 1.35},
  };

  final List<String> creditTips = [
    "Paying your bills on time is the most important factor in your credit score.",
    "Keep your credit card balances below 30% of your available limit.",
    "A longer credit history generally improves your score.",
    "Avoid applying for multiple credit cards in a short period.",
    "Regularly check your credit report for errors."
  ];
  int currentTipIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Add this method to handle name updates
  void _onNameChanged(String newName) {
    setState(() {
      userName = newName;
    });

    // Also update in the database
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final currentUser = userBox.getAt(0)!;
      final updatedUser = currentUser.copyWith(name: newName);
      userBox.putAt(0, updatedUser);
    }
  }

  // Add this method to refresh data when returning to home
  void _refreshData() {
    _loadUserData();
  }

  void _loadUserData() {
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final userData = userBox.getAt(0)!;
      setState(() {
        userName = userData.name; // Load name from database
        simulatedScore = userData.simulatedScore;
        completedLessons = userData.completedLessons;
        _selectedCurrency = userData.preferredCurrency ?? 'USD';
      });
    } else {
      final defaultUser = UserData(
        name: "",
        simulatedScore: 720,
        xpPoints: 0,
        completedLessons: [],
        quizScores: {},
        earnedBadges: [],
        preferredCurrency: 'USD',
      );
      userBox.add(defaultUser);
      setState(() {
        userName = "";
      });
    }
  }

  void _onCurrencyChanged(String currency) {
    setState(() {
      _selectedCurrency = currency;
    });

    // Update user data with new currency preference
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0)!;
      user.preferredCurrency = currency;
      userBox.putAt(0, user);
    }
  }

  void _updateScore(int newScore) {
    setState(() {
      simulatedScore = newScore;
    });

    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0)!;
      user.simulatedScore = newScore;
      userBox.putAt(0, user);
    }
  }

  void _completeLesson(String lessonId) {
    setState(() {
      if (!completedLessons.contains(lessonId)) {
        completedLessons.add(lessonId);
        simulatedScore = (simulatedScore + 5).clamp(300, 850);
      }
    });

    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      final user = userBox.getAt(0)!;
      user.completedLessons = completedLessons;
      user.simulatedScore = simulatedScore;
      userBox.putAt(0, user);
    }
  }

  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return LearningModulePage(
          onLessonComplete: _completeLesson,
          completedLessons: completedLessons,
        );
      case 2:
        return ToolsPage(
          selectedCurrency: _selectedCurrency,
          currencies: _currencies,
        );
      case 3:
        return QuizPage();
      case 4:
        return ProfilePage(
          toggleTheme: widget.toggleTheme,
          isDarkMode: widget.isDarkMode,
          onCurrencyChanged: _onCurrencyChanged,
          selectedCurrency: _selectedCurrency,
          onNameChanged: _onNameChanged, // Pass the callback
        );
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24),
              _buildCreditScoreGauge(isDark),
              SizedBox(height: 24),
              _buildLearningProgress(isDark),
              SizedBox(height: 24),
              _buildCreditTipCard(isDark),
              SizedBox(height: 24),
              _buildContinueLearningButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName.isEmpty ? 'Hey there! 👋' : 'Hey, $userName! 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Ready to improve your credit?',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  toggleTheme: widget.toggleTheme,
                  isDarkMode: widget.isDarkMode,
                  onCurrencyChanged: _onCurrencyChanged,
                  selectedCurrency: _selectedCurrency,
                  onNameChanged: _onNameChanged,
                ),
              ),
            ).then((_) {
              _refreshData();
            });
          },
          icon: CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              userName.isEmpty ? "?" : userName.substring(0, 1), // Fix: Check if name is empty
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          tooltip: 'Profile',
        )
      ],
    );
  }

  // ... Rest of the methods remain the same (CreditScoreGauge, LearningProgress, etc.)

  Widget _buildCreditScoreGauge(bool isDark) {
    return Container(
      width: double.infinity,
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
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        children: [
          Text(
            'Your Simulated Credit Score',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: simulatedScore / 850,
                  strokeWidth: 12,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Column(
                children: [
                  Text(
                    '$simulatedScore',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _getScoreRating(simulatedScore),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Based on your learning progress',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  String _getScoreRating(int score) {
    if (score >= 800) return 'Excellent';
    if (score >= 740) return 'Very Good';
    if (score >= 670) return 'Good';
    if (score >= 580) return 'Fair';
    return 'Poor';
  }

  Widget _buildLearningProgress(bool isDark) {
    int completedCount = completedLessons.length;
    double progress = completedCount / totalLessons;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: isDark
            ? Border.all(
                color: Colors.grey[800]!,
                width: 1,
              )
            : null,
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.school,
                      color: Theme.of(context).colorScheme.primary, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Learning Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Text(
                '$completedCount/$totalLessons',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: progress,
            backgroundColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
          SizedBox(height: 12),
          Text(
            progress >= 1.0
                ? 'Congratulations! You completed all lessons! 🎉'
                : 'Complete all lessons to master credit basics',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditTipCard(bool isDark) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: isDark
            ? Border.all(
                color: Colors.grey[800]!,
                width: 1,
              )
            : null,
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.amber[700], size: 22),
              SizedBox(width: 8),
              Text(
                "Today's Credit Tip",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            creditTips[currentTipIndex],
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: _nextTip,
              icon: Icon(Icons.refresh, size: 18),
              label: Text('Next Tip'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2,
                shadowColor: isDark ? Colors.black : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueLearningButton() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() => _currentIndex = 1);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          shadowColor: isDark ? Colors.black : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 20),
            SizedBox(width: 10),
            Text(
              completedLessons.isEmpty ? 'Start Learning' : 'Continue Learning',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        // Refresh data when returning to home page
        if (index == 0 && _currentIndex != 0) {
          _refreshData();
        }
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor:
          Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      elevation: isDark ? 8 : 4,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          activeIcon: Icon(Icons.menu_book),
          label: 'Learn',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build_outlined),
          activeIcon: Icon(Icons.build),
          label: 'Tools',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz_outlined),
          activeIcon: Icon(Icons.quiz),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings_applications),
          label: 'Setting',
        ),
      ],
    );
  }

  void _nextTip() {
    setState(() {
      currentTipIndex = (currentTipIndex + 1) % creditTips.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getCurrentPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
