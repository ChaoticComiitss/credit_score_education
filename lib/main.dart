import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_dashboard.dart';
import 'pages/onboarding_page.dart';
import 'models/user_data.dart';
import 'adapters/manual_user_data_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Hive
    await Hive.initFlutter();

    // Register the manual adapter
    Hive.registerAdapter(ManualUserDataAdapter());

    // Open boxes with error handling
    await Hive.openBox<UserData>('userData').catchError((error) {
      print('Error opening userData box: $error');
      // If opening fails, delete and recreate the box
      return Hive.deleteBoxFromDisk('userData').then((_) {
        return Hive.openBox<UserData>('userData');
      });
    });

    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    runApp(MyApp(
      initialDarkMode: isDarkMode,
      hasSeenOnboarding: hasSeenOnboarding,
    ));
  } catch (e) {
    print('Hive initialization failed: $e');
    // If Hive fails completely, run app without it
    runApp(MyApp(initialDarkMode: false, hasSeenOnboarding: false));
  }
}

class MyApp extends StatefulWidget {
  final bool initialDarkMode;
  final bool hasSeenOnboarding;

  const MyApp({
    Key? key,
    required this.initialDarkMode,
    required this.hasSeenOnboarding,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialDarkMode;
  }

  void _toggleTheme() async {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Score Education',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.blue[700]!,
          surface: Colors.white,
          onSurface: Colors.black87,
          background: Colors.grey[50],
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        cardColor: Colors.white,
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[700],
        colorScheme: ColorScheme.dark(
          primary: Colors.blue[700]!,
          secondary: Colors.blue[300]!,
          surface: Color(0xFF1E1E1E),
          onSurface: Colors.white,
          background: Color(0xFF121212),
          surfaceVariant: Color(0xFF2D2D2D),
        ),
        scaffoldBackgroundColor: Color(0xFF121212),
        cardColor: Color(0xFF1E1E1E),
        cardTheme: CardThemeData(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Color(0xFF1E1E1E),
          shadowColor: Colors.black.withOpacity(0.6),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF2D2D2D),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue[300]!),
          ),
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: widget.hasSeenOnboarding
          ? HomeDashboard(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      )
          : OnboardingPage(toggleTheme: _toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}