import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/database_service.dart';
import '../models/user_data.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  final Function(String) onCurrencyChanged;
  final String selectedCurrency;
  final Function(String)? onNameChanged;

  const ProfilePage({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
    required this.onCurrencyChanged,
    required this.selectedCurrency,
    this.onNameChanged,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserData _userData;
  bool _isLoading = true;
  bool _isEditingName = false;
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  final Map<String, Map<String, dynamic>> _currencies = {
    'USD': {'symbol': '\$', 'name': 'US Dollar', 'rate': 1.0},
    'EUR': {'symbol': '€', 'name': 'Euro', 'rate': 0.85},
    'GBP': {'symbol': '£', 'name': 'British Pound', 'rate': 0.73},
    'INR': {'symbol': '₹', 'name': 'Indian Rupee', 'rate': 83.0},
    'JPY': {'symbol': '¥', 'name': 'Japanese Yen', 'rate': 110.0},
    'CAD': {'symbol': 'C\$', 'name': 'Canadian Dollar', 'rate': 1.25},
    'AUD': {'symbol': 'A\$', 'name': 'Australian Dollar', 'rate': 1.35},
  };

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));

      final userBox = DatabaseService.userBox;
      if (userBox.isNotEmpty) {
        _userData = userBox.getAt(0)!;
        _nameController.text = _userData.name;
      } else {
        _userData = UserData(
          name: '', // Empty name initially
          simulatedScore: 720,
          xpPoints: 0,
          completedLessons: [],
          quizScores: {},
          earnedBadges: [],
          preferredCurrency: 'USD',
        );
        _nameController.text = _userData.name;
        await userBox.add(_userData);
      }
    } catch (e) {
      _userData = UserData(
        name: '', // Empty name initially
        simulatedScore: 720,
        xpPoints: 0,
        completedLessons: [],
        quizScores: {},
        earnedBadges: [],
        preferredCurrency: 'USD',
      );
      _nameController.text = _userData.name;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _updateCurrency(String currency) async {
    setState(() {
      widget.onCurrencyChanged(currency);
    });

    // Save preference to user data
    final updatedUserData = _userData.copyWith(preferredCurrency: currency);
    _saveUserData(updatedUserData);
  }

  void _updateUserName() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name cannot be empty'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      return;
    }

    final newName = _nameController.text.trim();
    final updatedUserData = _userData.copyWith(name: newName);

    setState(() {
      _userData = updatedUserData;
      _isEditingName = false;
    });

    // Save to database
    await _saveUserData(updatedUserData);

    // Notify parent about name change
    if (widget.onNameChanged != null) {
      widget.onNameChanged!(newName);
    }
  }

  Future<void> _saveUserData(UserData userData) async {
    final userBox = DatabaseService.userBox;
    if (userBox.isNotEmpty) {
      await userBox.putAt(0, userData);
    }
  }

  void _startEditingName() {
    setState(() {
      _isEditingName = true;
    });
    // Focus on the text field after a short delay to ensure it's built
    Future.delayed(Duration(milliseconds: 100), () {
      _nameFocusNode.requestFocus();
    });
  }

  void _cancelEditingName() {
    setState(() {
      _isEditingName = false;
      _nameController.text = _userData.name; // Reset to original name
    });
  }

  String _formatCurrency(double amount) {
    final currency = _currencies[widget.selectedCurrency]!;
    final convertedAmount = amount * currency['rate']!;
    return '${currency['symbol']}${convertedAmount.toStringAsFixed(2)}';
  }

  String _getCurrencySymbol() {
    return _currencies[widget.selectedCurrency]!['symbol'];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color surfaceColor = Theme.of(context).colorScheme.surface;
    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 1.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: onSurfaceColor,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: surfaceColor.withOpacity(0.5),
            ),
            child: IconButton(
              icon: Icon(
                widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: primaryColor,
                size: 22,
              ),
              onPressed: widget.toggleTheme,
              tooltip: 'Toggle Theme',
              padding: EdgeInsets.all(8),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
        ),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Stats Card - Fixed Pixel Alignment
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                    Color(0xFF2D2B4E),
                    Color(0xFF1E1E2C),
                  ]
                      : [
                    Color(0xFF667EEA),
                    Color(0xFF764BA2),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.4)
                        : Colors.purple.withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildModernStatItem(
                        'Score', _userData.simulatedScore.toString(), Icons.assessment),
                  ),
                  Expanded(
                    child: _buildModernStatItem(
                        'XP', _userData.xpPoints.toString(), Icons.star),
                  ),
                  Expanded(
                    child: _buildModernStatItem('Lessons',
                        _userData.completedLessons.length.toString(), Icons.menu_book),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // 2. Name Card - Fixed Alignment
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: primaryColor, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Your Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: onSurfaceColor,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (_isEditingName)
                    Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          style: TextStyle(
                            fontSize: 16,
                            color: onSurfaceColor,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(
                              color: onSurfaceColor.withOpacity(0.5),
                              height: 1.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: isDark
                                ? Colors.grey[800]!.withOpacity(0.3)
                                : Colors.grey[100]!,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                          maxLength: 20,
                          onSubmitted: (_) => _updateUserName(),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: _cancelEditingName,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: onSurfaceColor.withOpacity(0.7),
                                side: BorderSide(color: onSurfaceColor.withOpacity(0.3)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(height: 1.0),
                              ),
                            ),
                            SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: _updateUserName,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                elevation: 2,
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(height: 1.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: _startEditingName,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey[800]!.withOpacity(0.3)
                                    : Colors.grey[100]!,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: onSurfaceColor.withOpacity(0.1),
                                ),
                              ),
                              child: Text(
                                _userData.name.isEmpty ? 'Enter your name' : _userData.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _userData.name.isEmpty
                                      ? onSurfaceColor.withOpacity(0.5)
                                      : onSurfaceColor,
                                  fontWeight: _userData.name.isEmpty
                                      ? FontWeight.w400
                                      : FontWeight.w500,
                                  height: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.edit, size: 18, color: primaryColor),
                            onPressed: _startEditingName,
                            tooltip: 'Edit Name',
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // 3. Currency Selector Card - Fixed Dropdown
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.currency_exchange_outlined, color: primaryColor, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Select Currency',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: onSurfaceColor,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Fixed Dropdown - Pixel Perfect
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isDark
                          ? Colors.grey[800]!.withOpacity(0.3)
                          : Colors.grey[100]!,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: widget.selectedCurrency,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _updateCurrency(newValue);
                          }
                        },
                        items: _currencies.keys.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _currencies[currency]!['symbol'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor,
                                          height: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        _currencies[currency]!['name'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: onSurfaceColor,
                                          height: 1.0,
                                        ),
                                      ),
                                      Text(
                                        currency,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: onSurfaceColor.withOpacity(0.6),
                                          height: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down, color: primaryColor),
                        dropdownColor: isDark ? Color(0xFF2D2D2D) : Colors.white,
                        style: TextStyle(
                          color: onSurfaceColor,
                          fontSize: 14,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 16, color: primaryColor),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '1 USD = ${_getCurrencySymbol()}${_currencies[widget.selectedCurrency]!['rate']!.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: onSurfaceColor.withOpacity(0.7),
                              height: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // 4. Learning Progress Card - Fixed Alignment
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timeline_outlined, color: primaryColor, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Learning Progress',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: onSurfaceColor,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildModernInfoRow('Completed Lessons', '${_userData.completedLessons.length}'),
                  _buildModernInfoRow('Quizzes Taken', '${_userData.quizScores.length}'),
                  _buildModernInfoRow('Badges Earned', '${_userData.earnedBadges.length}'),
                  _buildModernInfoRow('Total XP', '${_userData.xpPoints}'),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildModernStatItem(String label, String value, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildModernInfoRow(String label, String value) {
    final Color onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: onSurfaceColor.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }
}