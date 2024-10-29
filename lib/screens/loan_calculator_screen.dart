import 'package:flutter/material.dart';

class LoanCalculatorScreen extends StatefulWidget {
  final double price;
  final String productName;

  LoanCalculatorScreen({required this.price, required this.productName});

  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _initialPaymentController = TextEditingController();
  final _numOfPaymentsController = TextEditingController();
  double totalAmount = 0.0;
  double installmentAmount = 0.0;

  void calculateTotal() {
    double initialPayment = double.parse(_initialPaymentController.text);
    int numOfPayments = int.parse(_numOfPaymentsController.text);
    double financedAmount = widget.price - initialPayment;

    double interestRate = getInterestRate(initialPayment, widget.price, numOfPayments);

    double totalInterest = financedAmount * interestRate;
    double subtotal = financedAmount + totalInterest;
    double iva = subtotal * 0.13; // IVA del 13%
    totalAmount = subtotal + iva;
    installmentAmount = totalAmount / numOfPayments;

    setState(() {});
  }

  double getInterestRate(double initialPayment, double price, int numOfPayments) {
    double initialPaymentPercentage = (initialPayment / price) * 100;
    double baseRate;

    if (initialPaymentPercentage >= 70) {
      baseRate = 0.01; // 1%
    } else if (initialPaymentPercentage >= 50) {
      baseRate = 0.02; // 2%
    } else {
      baseRate = 0.05; // 5%
    }

    double interestRate = baseRate * numOfPayments;
    return interestRate;
  }

  @override
  void dispose() {
    _initialPaymentController.dispose();
    _numOfPaymentsController.dispose();
    super.dispose();
  }

  String formatCurrency(double amount) {
    return amount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular Cuotas - ${widget.productName}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Precio del Producto: Bs ${formatCurrency(widget.price)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _initialPaymentController,
                decoration: InputDecoration(
                  labelText: 'Pago Inicial (Bs)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el pago inicial';
                  }
                  double? initialPayment = double.tryParse(value.replaceAll(',', '.'));
                  if (initialPayment == null) {
                    return 'Ingrese un número válido';
                  }
                  if (initialPayment <= 0 || initialPayment >= widget.price) {
                    return 'El pago inicial debe ser mayor que 0 y menor que el precio del producto';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _numOfPaymentsController,
                decoration: InputDecoration(
                  labelText: 'Número de Cuotas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de cuotas';
                  }
                  int? numOfPayments = int.tryParse(value);
                  if (numOfPayments == null || numOfPayments <= 0) {
                    return 'El número de cuotas debe ser mayor que 0';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                icon: Icon(Icons.calculate),
                label: Text('Calcular'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateTotal();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
              ),
              SizedBox(height: 24),
              if (totalAmount > 0)
                Card(
                  color: Colors.orange[50],
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monto Total a Pagar: Bs ${formatCurrency(totalAmount)}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'IVA (13%): Bs ${formatCurrency(totalAmount * 0.13)}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Monto por Cuota (${_numOfPaymentsController.text} cuotas): Bs ${formatCurrency(installmentAmount)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
