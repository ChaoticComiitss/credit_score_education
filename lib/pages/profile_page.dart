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
          name: 'New User',
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
        name: 'Demo User',
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
        SnackBar(content: Text('Name cannot be empty')),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.person,
                size: 60,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20),

            // User Name with Edit Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isEditingName)
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      maxLength: 20,
                      onSubmitted: (_) => _updateUserName(),
                    ),
                  )
                else
                  Text(
                    _userData.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                SizedBox(width: 8),
                if (!_isEditingName)
                  IconButton(
                    icon: Icon(Icons.edit, size: 20, color: Theme.of(context).colorScheme.onSurface),
                    onPressed: _startEditingName,
                    tooltip: 'Edit Name',
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green, size: 20),
                        onPressed: _updateUserName,
                        tooltip: 'Save',
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red, size: 20),
                        onPressed: _cancelEditingName,
                        tooltip: 'Cancel',
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 8),

            // User Email/Status
            Text(
              'Credit Score: ${_userData.simulatedScore}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 30),

            // Stats Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Score', _userData.simulatedScore.toString(), Icons.assessment),
                    _buildStatItem('XP', _userData.xpPoints.toString(), Icons.star),
                    _buildStatItem('Lessons', _userData.completedLessons.length.toString(), Icons.menu_book),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            // Currency Selector Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferred Currency',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: widget.selectedCurrency,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          _updateCurrency(newValue);
                        }
                      },
                      items: _currencies.keys.map((String currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Row(
                            children: [
                              Text(
                                _currencies[currency]!['symbol'],
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${_currencies[currency]!['name']} ($currency)',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Select Currency',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      dropdownColor: Theme.of(context).cardColor,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Current: ${_getCurrencySymbol()} (1 USD = ${_getCurrencySymbol()}${_currencies[widget.selectedCurrency]!['rate']!.toStringAsFixed(2)})',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Progress Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learning Progress',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildInfoRow('Completed Lessons', '${_userData.completedLessons.length}'),
                    _buildInfoRow('Quizzes Taken', '${_userData.quizScores.length}'),
                    _buildInfoRow('Badges Earned', '${_userData.earnedBadges.length}'),
                    _buildInfoRow('Total XP', '${_userData.xpPoints}'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Theme Toggle Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Spacer(),
                    Switch(
                      value: widget.isDarkMode,
                      onChanged: (value) {
                        widget.toggleTheme();
                      },
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
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