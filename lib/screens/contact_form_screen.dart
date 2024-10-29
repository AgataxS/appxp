import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {
  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contáctanos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Si tienes alguna pregunta o comentario, por favor completa el formulario a continuación.'),
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
                decoration: InputDecoration(labelText: 'Mensaje'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su mensaje';
                  }
                  return null;
                },
                onSaved: (value) => _message = value,
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
                        content: Text('Tu mensaje ha sido enviado. Nos pondremos en contacto contigo pronto.'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
