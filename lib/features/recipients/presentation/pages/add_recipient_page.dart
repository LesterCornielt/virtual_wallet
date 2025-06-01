import 'package:flutter/material.dart';

class AddRecipientPage extends StatelessWidget {
  const AddRecipientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: const Text(
              '<',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Adicionar destinatario',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Móvil',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Número de tarjeta',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Moneda',
                border: OutlineInputBorder(),
              ),
              items: const [
                // Replace with actual currency list
                DropdownMenuItem(value: 'CUP', child: Text('CUP')),
                DropdownMenuItem(value: 'USD', child: Text('USD')),
              ],
              onChanged: (value) {
                // TODO: Handle currency selection
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // Make button full width
              ),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }
}
