import 'package:flutter/material.dart';
import 'simulator_page.dart';
import 'tips_page.dart';

class ToolsPage extends StatefulWidget {
  final String selectedCurrency;
  final Map<String, Map<String, dynamic>> currencies;

  const ToolsPage({
    Key? key,
    required this.selectedCurrency,
    required this.currencies,
  }) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  late List<ToolItem> tools;

  @override
  void initState() {
    super.initState();
    _initializeTools();
  }

  void _initializeTools() {
    tools = [
      ToolItem(
        title: 'Credit Simulator',
        description: 'See financial decisions impact',
        icon: Icons.trending_up_rounded,
        color: Colors.orange,
        page: SimulatorPage(),
      ),
      ToolItem(
        title: 'Tips & Insights',
        description: 'Daily credit tips & insights',
        icon: Icons.lightbulb_rounded,
        color: Colors.amber,
        page: TipsPage(),
      ),
      ToolItem(
        title: 'Utilization Calc',
        description: 'Calculate credit ratio',
        icon: Icons.calculate_rounded,
        color: Colors.green,
        page: UtilizationCalculatorPage(
          selectedCurrency: widget.selectedCurrency,
          currencies: widget.currencies,
        ),
      ),
      ToolItem(
        title: 'Payment Planner',
        description: 'Plan your payments',
        icon: Icons.calendar_today_rounded,
        color: Colors.purple,
        page: PaymentPlannerPage(
          selectedCurrency: widget.selectedCurrency,
          currencies: widget.currencies,
        ),
      ),
    ];
  }

  @override
  void didUpdateWidget(covariant ToolsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCurrency != widget.selectedCurrency) {
      _initializeTools();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Tools'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: tools.length,
          itemBuilder: (context, index) {
            return ToolCard(tool: tools[index]);
          },
        ),
      ),
    );
  }
}

class ToolItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget page;

  ToolItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.page,
  });
}

// In the ToolCard widget, update the Card to have better dark mode visibility:
class ToolCard extends StatelessWidget {
  final ToolItem tool;

  const ToolCard({Key? key, required this.tool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: isDark ? 8 : 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tool.page),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: tool.color.withOpacity(isDark ? 0.25 : 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(tool.icon, size: 32, color: tool.color),
              ),
              SizedBox(height: 12),

              // Title
              Text(
                tool.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6),

              // Description
              Text(
                tool.description,
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Utilization Calculator Page
class UtilizationCalculatorPage extends StatefulWidget {
  final String selectedCurrency;
  final Map<String, Map<String, dynamic>> currencies;

  const UtilizationCalculatorPage({
    Key? key,
    required this.selectedCurrency,
    required this.currencies,
  }) : super(key: key);

  @override
  _UtilizationCalculatorPageState createState() => _UtilizationCalculatorPageState();
}

class _UtilizationCalculatorPageState extends State<UtilizationCalculatorPage> {
  final TextEditingController _totalBalanceController = TextEditingController();
  final TextEditingController _totalLimitController = TextEditingController();
  double _utilizationRate = 0.0;

  String _getCurrencySymbol() {
    return widget.currencies[widget.selectedCurrency]!['symbol'];
  }

  void _calculateUtilization() {
    final balance = double.tryParse(_totalBalanceController.text) ?? 0;
    final limit = double.tryParse(_totalLimitController.text) ?? 1;

    setState(() {
      _utilizationRate = (balance / limit) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilization Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Currency Display (Read-only)
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.currency_exchange, color: Colors.blue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected Currency',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${widget.currencies[widget.selectedCurrency]!['name']} (${_getCurrencySymbol()})',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _totalBalanceController,
                      decoration: InputDecoration(
                        labelText: 'Total Credit Card Balance (${_getCurrencySymbol()})',
                        hintText: 'e.g., 2500',
                        prefixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _totalLimitController,
                      decoration: InputDecoration(
                        labelText: 'Total Credit Limit (${_getCurrencySymbol()})',
                        hintText: 'e.g., 10000',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _calculateUtilization,
                      child: Text('Calculate Utilization'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_utilizationRate > 0)
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 4,
                    color: _getUtilizationColor(_utilizationRate).withOpacity(0.1),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Your Utilization Rate',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${_utilizationRate.toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: _getUtilizationColor(_utilizationRate),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            _getUtilizationMessage(_utilizationRate),
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Balance: ${_getCurrencySymbol()}${_totalBalanceController.text} | Limit: ${_getCurrencySymbol()}${_totalLimitController.text}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getUtilizationColor(double rate) {
    if (rate <= 30) return Colors.green;
    if (rate <= 50) return Colors.orange;
    return Colors.red;
  }

  String _getUtilizationMessage(double rate) {
    if (rate <= 30) return 'Excellent! Keep utilization below 30% for best scores.';
    if (rate <= 50) return 'Good, but try to get below 30% for optimal scores.';
    return 'High utilization! Pay down balances to improve your score.';
  }
}

// Payment Planner Page
class PaymentPlannerPage extends StatefulWidget {
  final String selectedCurrency;
  final Map<String, Map<String, dynamic>> currencies;

  const PaymentPlannerPage({
    Key? key,
    required this.selectedCurrency,
    required this.currencies,
  }) : super(key: key);

  @override
  _PaymentPlannerPageState createState() => _PaymentPlannerPageState();
}

class _PaymentPlannerPageState extends State<PaymentPlannerPage> {
  final TextEditingController _debtController = TextEditingController();
  final TextEditingController _monthlyPaymentController = TextEditingController();
  final TextEditingController _interestController = TextEditingController(text: '15');
  List<PaymentPlan> _paymentPlan = [];

  String _getCurrencySymbol() {
    return widget.currencies[widget.selectedCurrency]!['symbol'];
  }

  String _formatCurrency(double amount) {
    return '${_getCurrencySymbol()}${amount.toStringAsFixed(2)}';
  }

  void _calculatePaymentPlan() {
    final debt = double.tryParse(_debtController.text) ?? 0;
    final monthlyPayment = double.tryParse(_monthlyPaymentController.text) ?? 0;
    final annualInterest = double.tryParse(_interestController.text) ?? 15;

    if (debt <= 0 || monthlyPayment <= 0) return;

    setState(() {
      _paymentPlan = _generatePaymentPlan(debt, monthlyPayment, annualInterest);
    });
  }

  List<PaymentPlan> _generatePaymentPlan(double debt, double monthlyPayment, double annualInterest) {
    List<PaymentPlan> plan = [];
    double remainingDebt = debt;
    int month = 1;
    final monthlyInterestRate = annualInterest / 12 / 100;

    while (remainingDebt > 0 && month <= 60) {
      double interest = remainingDebt * monthlyInterestRate;
      double principal = monthlyPayment - interest;

      if (principal > remainingDebt) {
        principal = remainingDebt;
        monthlyPayment = principal + interest;
      }

      remainingDebt -= principal;

      plan.add(PaymentPlan(
        month: month,
        payment: monthlyPayment,
        principal: principal,
        interest: interest,
        remainingBalance: remainingDebt > 0 ? remainingDebt : 0,
      ));

      month++;
    }

    return plan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Planner'),
      ),
      body: _paymentPlan.isEmpty ? _buildInputSection() : _buildResultsSection(),
    );
  }

  Widget _buildInputSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Currency Display (Read-only)
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.currency_exchange, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selected Currency',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${widget.currencies[widget.selectedCurrency]!['name']} (${_getCurrencySymbol()})',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          // Input Card
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _debtController,
                    decoration: InputDecoration(
                      labelText: 'Total Debt Amount (${_getCurrencySymbol()})',
                      hintText: 'e.g., 5000',
                      prefixIcon: Icon(Icons.money),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _monthlyPaymentController,
                    decoration: InputDecoration(
                      labelText: 'Monthly Payment (${_getCurrencySymbol()})',
                      hintText: 'e.g., 200',
                      prefixIcon: Icon(Icons.payment),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _interestController,
                    decoration: InputDecoration(
                      labelText: 'Annual Interest Rate (%)',
                      hintText: 'e.g., 15',
                      prefixIcon: Icon(Icons.percent),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculatePaymentPlan,
                    child: Text('Calculate Payment Plan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsSection() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Currency Display (Read-only)
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.currency_exchange, color: Colors.blue),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selected Currency',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${widget.currencies[widget.selectedCurrency]!['name']} (${_getCurrencySymbol()})',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.check_circle, color: Colors.green),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Input Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _debtController,
                          decoration: InputDecoration(
                            labelText: 'Total Debt Amount (${_getCurrencySymbol()})',
                            hintText: 'e.g., 5000',
                            prefixIcon: Icon(Icons.money),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _monthlyPaymentController,
                          decoration: InputDecoration(
                            labelText: 'Monthly Payment (${_getCurrencySymbol()})',
                            hintText: 'e.g., 200',
                            prefixIcon: Icon(Icons.payment),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _interestController,
                          decoration: InputDecoration(
                            labelText: 'Annual Interest Rate (%)',
                            hintText: 'e.g., 15',
                            prefixIcon: Icon(Icons.percent),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _calculatePaymentPlan,
                          child: Text('Calculate Payment Plan'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Results Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Plan (${_getCurrencySymbol()})',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Total Time: ${_paymentPlan.length} months',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        ..._paymentPlan.map((plan) => ListTile(
                          title: Text(
                            'Month ${plan.month}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          subtitle: Text(
                            'Principal: ${_formatCurrency(plan.principal)} | Interest: ${_formatCurrency(plan.interest)}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                          trailing: Text(
                            'Balance: ${_formatCurrency(plan.remainingBalance)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        )).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentPlan {
  final int month;
  final double payment;
  final double principal;
  final double interest;
  final double remainingBalance;

  PaymentPlan({
    required this.month,
    required this.payment,
    required this.principal,
    required this.interest,
    required this.remainingBalance,
  });
}