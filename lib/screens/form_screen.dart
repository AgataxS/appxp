import 'package:flutter/material.dart';
import '../models/product.dart';

class FormScreen extends StatefulWidget {
  final String action;
  final Product? product;

  FormScreen({required this.action, this.product});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _phone;
  String? _email;
  String? _address;
  String? _additionalInfo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product != null ? '${widget.action} - ${widget.product!.name}' : widget.action),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Por favor complete el formulario para ${widget.action.toLowerCase()}${widget.product != null ? ' este producto' : ''}.'),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre Completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de Teléfono'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su número de teléfono';
                  }
                  return null;
                },
                onSaved: (value) => _phone = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su dirección';
                  }
                  return null;
                },
                onSaved: (value) => _address = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Información Adicional'),
                maxLines: 3,
                onSaved: (value) => _additionalInfo = value,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('Enviar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                   
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('¡Gracias!'),
                        content: Text('Su solicitud ha sido enviada con éxito.'),
                        actions: [
                          TextButton(
                            child: Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
