import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_dashboard.dart';

class OnboardingPage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const OnboardingPage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingSlide> slides = [
    OnboardingSlide(
      title: 'Learn how credit score works step-by-step',
      description: 'Understand the fundamentals of credit scoring in simple, easy-to-follow lessons.',
      icon: Icons.school,
      color: Colors.blue,
      image: '🎓',
    ),
    OnboardingSlide(
      title: 'Play games & quizzes to boost your score knowledge',
      description: 'Test your knowledge with fun quizzes and interactive content.',
      icon: Icons.quiz,
      color: Colors.green,
      image: '🧠',
    ),
    OnboardingSlide(
      title: 'Simulate real credit actions safely',
      description: 'Practice credit decisions without any risk - no internet needed!',
      icon: Icons.trending_up,
      color: Colors.orange,
      image: '⚡',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () => _goToHome(),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            // Page View
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingSlideWidget(
                    slide: slides[index],
                    isDark: isDark,
                  );
                },
              ),
            ),

            // Indicators and Next Button
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(slides.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index
                              ? slides[index].color
                              : (isDark ? Colors.grey[700] : Colors.grey[300]),
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: 32),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage == slides.length - 1) {
                          _goToHome();
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: slides[_currentPage].color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        elevation: 4,
                        shadowColor: slides[_currentPage].color.withOpacity(0.3),
                      ),
                      child: Text(
                        _currentPage == slides.length - 1 ? 'Get Started' : 'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  void _goToHome() async {
    // Save that user has seen onboarding
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeDashboard(
        isDarkMode: false,
        toggleTheme: widget.toggleTheme,
      )),
    );
  }
}

class OnboardingSlide {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String image;

  OnboardingSlide({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.image,
  });
}

class OnboardingSlideWidget extends StatelessWidget {
  final OnboardingSlide slide;
  final bool isDark;

  const OnboardingSlideWidget({
    Key? key,
    required this.slide,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji/Icon Container
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: slide.color.withOpacity(isDark ? 0.2 : 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                slide.image,
                style: TextStyle(fontSize: 60),
              ),
            ),
          ),

          SizedBox(height: 48),

          // Title
          Text(
            slide.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          // Description
          Text(
            slide.description,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}