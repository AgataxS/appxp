import 'package:flutter/material.dart';
import 'form_screen.dart';

class CustomerServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atención al Cliente'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Solicitar Técnico'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FormScreen(
                    action: 'Solicitar Técnico',
                    product: null, 
                  ),
                ),
              );
            },
          ),
         
        ],
      ),
    );
  }
}
