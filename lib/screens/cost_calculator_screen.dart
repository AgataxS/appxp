import 'package:flutter/material.dart';

class CostCalculatorScreen extends StatefulWidget {
  @override
  _CostCalculatorScreenState createState() => _CostCalculatorScreenState();
}

class _CostCalculatorScreenState extends State<CostCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _productCostController = TextEditingController();
  final _shippingCostController = TextEditingController();
  final _advancePaymentController = TextEditingController(text: '0');

  double totalCostBs = 0.0;
  double taxes = 0.0;
  double distribolService = 0.0;
  double totalToPay = 0.0;
  double balanceDue = 0.0;

  String selectedCurrency = 'USD';
  String selectedShippingType = 'Otros';

  List<String> currencies = ['USD', 'AUD', 'Bs', 'CAD', 'EUR', 'GBP'];
  List<String> shippingTypes = ['eBay', 'Amazon', 'Envío Rápido', 'USPS EMS', 'Otros'];

  double exchangeRate = 6.96;

  double getExchangeRate() {
    if (selectedCurrency == 'Bs') {
      return 1.0;
    } else {
      return exchangeRate;
    }
  }

  void calculateCosts() {
    double productCost = double.parse(_productCostController.text.replaceAll(',', '.'));
    double shippingCost = double.parse(_shippingCostController.text.replaceAll(',', '.'));

    double productCostInBs = productCost * getExchangeRate();
    double shippingCostInBs = shippingCost * getExchangeRate();

    double companyProfit = productCostInBs * 0.068;

    totalCostBs = productCostInBs + shippingCostInBs + companyProfit;

    taxes = 0.0;

    distribolService = productCostInBs * 0.068;

    totalToPay = totalCostBs + distribolService + taxes;

    balanceDue = totalToPay;

    setState(() {});
  }

  void calculateBalanceDue() {
    double advancePayment = double.parse(_advancePaymentController.text.replaceAll(',', '.'));

    balanceDue = totalToPay - advancePayment;

    setState(() {});
  }

  @override
  void dispose() {
    _productCostController.dispose();
    _shippingCostController.dispose();
    _advancePaymentController.dispose();
    super.dispose();
  }

  String formatCurrency(double amount) {
    return amount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Costos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Moneda',
                  border: OutlineInputBorder(),
                ),
                value: selectedCurrency,
                items: currencies.map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Tipo de Envío',
                  border: OutlineInputBorder(),
                ),
                value: selectedShippingType,
                items: shippingTypes.map((String shippingType) {
                  return DropdownMenuItem<String>(
                    value: shippingType,
                    child: Text(shippingType),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedShippingType = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _productCostController,
                decoration: InputDecoration(
                  labelText: 'Costo del Producto (${selectedCurrency})',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el costo del producto';
                  }
                  if (double.tryParse(value.replaceAll(',', '.')) == null) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _shippingCostController,
                decoration: InputDecoration(
                  labelText: 'Costo de Envío (${selectedCurrency})',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el costo de envío';
                  }
                  if (double.tryParse(value.replaceAll(',', '.')) == null) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateCosts();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
              ),
              SizedBox(height: 24),
              if (totalToPay > 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.deepPurple[50],
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Resumen de Costos',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Text(
                              'Costo del Producto y Envío en Bs: ${formatCurrency(totalCostBs)}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Servicio de Distribol: Bs ${formatCurrency(distribolService)}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Total a Pagar: Bs ${formatCurrency(totalToPay)}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _advancePaymentController,
                      decoration: InputDecoration(
                        labelText: 'Adelanto al hacer el pedido (Bs)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el adelanto';
                        }
                        if (double.tryParse(value.replaceAll(',', '.')) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (_formKey.currentState!.validate()) {
                          calculateBalanceDue();
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    if (balanceDue >= 0)
                      Text(
                        'Saldo Contra Entrega: Bs ${formatCurrency(balanceDue)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    SizedBox(height: 16),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
